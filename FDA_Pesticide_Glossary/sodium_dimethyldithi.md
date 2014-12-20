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
-2.939322, -0.7433423, -2.13523, 1, 0, 0, 1,
-2.741762, 1.585652, -1.34225, 1, 0.007843138, 0, 1,
-2.534786, -0.1499288, -0.5988801, 1, 0.01176471, 0, 1,
-2.506249, 2.241457, -0.5006714, 1, 0.01960784, 0, 1,
-2.504383, 1.727362, -1.127389, 1, 0.02352941, 0, 1,
-2.399588, 0.5279635, -1.675321, 1, 0.03137255, 0, 1,
-2.363207, 0.6009261, -0.4341185, 1, 0.03529412, 0, 1,
-2.240615, -1.213101, -3.021425, 1, 0.04313726, 0, 1,
-2.191545, 0.4708583, -2.710613, 1, 0.04705882, 0, 1,
-2.176395, -1.247146, -1.60541, 1, 0.05490196, 0, 1,
-2.148633, 0.9851411, -1.954103, 1, 0.05882353, 0, 1,
-2.120243, 0.475364, -0.417241, 1, 0.06666667, 0, 1,
-2.119878, 0.4412275, -1.689901, 1, 0.07058824, 0, 1,
-2.049805, 0.1954823, -2.25831, 1, 0.07843138, 0, 1,
-2.012987, 0.9316311, -0.7336977, 1, 0.08235294, 0, 1,
-2.011043, -1.281786, -1.907211, 1, 0.09019608, 0, 1,
-1.997239, 0.2827316, -1.938662, 1, 0.09411765, 0, 1,
-1.984694, -0.1211748, -0.3466211, 1, 0.1019608, 0, 1,
-1.980442, 0.888217, -0.9698125, 1, 0.1098039, 0, 1,
-1.97847, 0.04187724, -1.666941, 1, 0.1137255, 0, 1,
-1.963331, -0.7394916, -2.435568, 1, 0.1215686, 0, 1,
-1.948005, -0.5814406, -1.341086, 1, 0.1254902, 0, 1,
-1.933656, 0.07810209, -3.001769, 1, 0.1333333, 0, 1,
-1.901541, 1.470951, 0.3604116, 1, 0.1372549, 0, 1,
-1.865469, -1.130316, -1.962676, 1, 0.145098, 0, 1,
-1.842062, 1.212374, -1.909124, 1, 0.1490196, 0, 1,
-1.841078, -0.9682661, -3.426886, 1, 0.1568628, 0, 1,
-1.839809, 0.5898474, -1.620066, 1, 0.1607843, 0, 1,
-1.833368, 0.2846842, -0.9819454, 1, 0.1686275, 0, 1,
-1.805909, 0.8579234, -0.6863128, 1, 0.172549, 0, 1,
-1.802072, 0.2940687, -1.316235, 1, 0.1803922, 0, 1,
-1.799238, -0.1748098, -2.411786, 1, 0.1843137, 0, 1,
-1.79373, 0.4953478, -2.201399, 1, 0.1921569, 0, 1,
-1.785296, -0.5818496, -0.3125601, 1, 0.1960784, 0, 1,
-1.762394, -0.2706217, -1.565779, 1, 0.2039216, 0, 1,
-1.742377, -0.2193888, -1.847481, 1, 0.2117647, 0, 1,
-1.729929, -0.7035677, -5.172315, 1, 0.2156863, 0, 1,
-1.712692, 2.167374, -2.64269, 1, 0.2235294, 0, 1,
-1.710446, -0.4470282, -0.1779415, 1, 0.227451, 0, 1,
-1.70202, -0.8211861, 0.04557926, 1, 0.2352941, 0, 1,
-1.699949, 0.327216, -1.008196, 1, 0.2392157, 0, 1,
-1.692721, -1.654112, -2.447826, 1, 0.2470588, 0, 1,
-1.685743, -0.687216, -2.34822, 1, 0.2509804, 0, 1,
-1.682641, -1.110345, -3.427882, 1, 0.2588235, 0, 1,
-1.650884, 0.08402674, -1.692455, 1, 0.2627451, 0, 1,
-1.647998, -0.4612156, -3.224888, 1, 0.2705882, 0, 1,
-1.617575, 0.6424329, -0.8183914, 1, 0.2745098, 0, 1,
-1.615685, -1.481711, -3.306319, 1, 0.282353, 0, 1,
-1.609933, -1.752493, -3.394613, 1, 0.2862745, 0, 1,
-1.602481, -0.04805411, -1.765447, 1, 0.2941177, 0, 1,
-1.602379, -0.07086039, -2.113519, 1, 0.3019608, 0, 1,
-1.593552, -0.1199183, -1.778222, 1, 0.3058824, 0, 1,
-1.565478, -1.922082, -2.794787, 1, 0.3137255, 0, 1,
-1.554783, 0.3439872, -1.264032, 1, 0.3176471, 0, 1,
-1.548984, 2.599, -3.258367, 1, 0.3254902, 0, 1,
-1.546727, 2.002051, -0.5024068, 1, 0.3294118, 0, 1,
-1.53794, 0.4991305, -0.02311557, 1, 0.3372549, 0, 1,
-1.525026, 0.1067971, -0.2009104, 1, 0.3411765, 0, 1,
-1.524428, 1.436299, -0.3838954, 1, 0.3490196, 0, 1,
-1.520186, 0.4175687, 0.6332656, 1, 0.3529412, 0, 1,
-1.519594, -0.03394469, -1.137366, 1, 0.3607843, 0, 1,
-1.518956, -0.1094025, -2.005639, 1, 0.3647059, 0, 1,
-1.512074, -0.2299319, -1.891557, 1, 0.372549, 0, 1,
-1.508115, 0.6521531, -1.643418, 1, 0.3764706, 0, 1,
-1.507863, -2.026258, -1.356956, 1, 0.3843137, 0, 1,
-1.498383, -1.23888, -2.357405, 1, 0.3882353, 0, 1,
-1.497567, 0.04713408, -1.9056, 1, 0.3960784, 0, 1,
-1.494807, 1.019039, 1.131177, 1, 0.4039216, 0, 1,
-1.490794, -0.850391, -1.124527, 1, 0.4078431, 0, 1,
-1.468448, 1.487332, -1.317339, 1, 0.4156863, 0, 1,
-1.467168, 0.2585479, -0.273281, 1, 0.4196078, 0, 1,
-1.465742, 1.290225, -0.1052855, 1, 0.427451, 0, 1,
-1.462645, -0.1128875, -2.00007, 1, 0.4313726, 0, 1,
-1.457625, 1.559038, -0.01666786, 1, 0.4392157, 0, 1,
-1.455466, 0.3148157, 0.4080706, 1, 0.4431373, 0, 1,
-1.451567, -0.6967298, -1.676714, 1, 0.4509804, 0, 1,
-1.450244, -1.689458, -3.082727, 1, 0.454902, 0, 1,
-1.443153, 0.3794289, -0.7197335, 1, 0.4627451, 0, 1,
-1.427129, 0.7213977, -0.2532077, 1, 0.4666667, 0, 1,
-1.425406, -0.7389367, -1.247594, 1, 0.4745098, 0, 1,
-1.417266, -2.04079, -2.206698, 1, 0.4784314, 0, 1,
-1.406773, -0.4023938, -2.365001, 1, 0.4862745, 0, 1,
-1.389593, -1.862456, -2.148393, 1, 0.4901961, 0, 1,
-1.388175, 1.195924, -1.97755, 1, 0.4980392, 0, 1,
-1.387948, -0.7554745, -2.829272, 1, 0.5058824, 0, 1,
-1.381215, 1.540415, 0.3305274, 1, 0.509804, 0, 1,
-1.373634, 0.903427, 0.4147371, 1, 0.5176471, 0, 1,
-1.363082, 0.5653352, -2.094422, 1, 0.5215687, 0, 1,
-1.354127, -1.283196, -2.736847, 1, 0.5294118, 0, 1,
-1.340129, 0.3074379, -1.404954, 1, 0.5333334, 0, 1,
-1.334695, 0.5184389, -1.093441, 1, 0.5411765, 0, 1,
-1.331299, -1.633567, -2.037605, 1, 0.5450981, 0, 1,
-1.328438, 1.101989, -1.568029, 1, 0.5529412, 0, 1,
-1.327762, 0.8478068, -3.386421, 1, 0.5568628, 0, 1,
-1.321231, 0.965704, -0.6665306, 1, 0.5647059, 0, 1,
-1.309438, 0.4638141, -1.69757, 1, 0.5686275, 0, 1,
-1.298894, 0.3661843, -1.342641, 1, 0.5764706, 0, 1,
-1.293257, -1.868235, -2.369949, 1, 0.5803922, 0, 1,
-1.288891, -0.2369273, -1.321976, 1, 0.5882353, 0, 1,
-1.286048, -2.133355, -1.890123, 1, 0.5921569, 0, 1,
-1.285697, 2.322768, 0.1606144, 1, 0.6, 0, 1,
-1.284485, -0.4153484, 0.03587172, 1, 0.6078432, 0, 1,
-1.283988, -1.309389, -3.892617, 1, 0.6117647, 0, 1,
-1.282096, 0.1790155, -1.508901, 1, 0.6196079, 0, 1,
-1.280932, -0.9002823, -3.252617, 1, 0.6235294, 0, 1,
-1.280343, 0.3719372, -1.859618, 1, 0.6313726, 0, 1,
-1.267775, 0.3359865, 1.029287, 1, 0.6352941, 0, 1,
-1.253115, 0.8574365, 0.01794422, 1, 0.6431373, 0, 1,
-1.252215, -0.3895993, -0.1498293, 1, 0.6470588, 0, 1,
-1.249069, -1.280752, -3.209713, 1, 0.654902, 0, 1,
-1.24601, -0.9922928, -5.769385, 1, 0.6588235, 0, 1,
-1.235149, -0.5566762, -1.880804, 1, 0.6666667, 0, 1,
-1.225641, 0.9386862, -0.4630535, 1, 0.6705883, 0, 1,
-1.222376, -0.1092553, -0.4447531, 1, 0.6784314, 0, 1,
-1.220128, 1.046309, -1.095081, 1, 0.682353, 0, 1,
-1.219595, -0.4933357, -1.600722, 1, 0.6901961, 0, 1,
-1.218622, -1.259016, -2.604264, 1, 0.6941177, 0, 1,
-1.215943, 0.5804886, -2.5925, 1, 0.7019608, 0, 1,
-1.214758, -0.1623061, -0.9136425, 1, 0.7098039, 0, 1,
-1.209879, 0.4023077, 0.1959776, 1, 0.7137255, 0, 1,
-1.206302, -0.4613366, -2.374475, 1, 0.7215686, 0, 1,
-1.203436, -1.784114, -1.79593, 1, 0.7254902, 0, 1,
-1.196153, -0.3859521, -2.784101, 1, 0.7333333, 0, 1,
-1.193505, -2.507596, -3.093599, 1, 0.7372549, 0, 1,
-1.190716, -1.529163, -0.05452039, 1, 0.7450981, 0, 1,
-1.180899, -1.491249, -2.593505, 1, 0.7490196, 0, 1,
-1.174045, 1.013624, -2.258704, 1, 0.7568628, 0, 1,
-1.173033, -0.4540506, -0.4699328, 1, 0.7607843, 0, 1,
-1.166908, -1.672865, -2.478836, 1, 0.7686275, 0, 1,
-1.165309, 0.3653719, -1.412656, 1, 0.772549, 0, 1,
-1.163545, 0.1540354, -2.063345, 1, 0.7803922, 0, 1,
-1.158736, -0.4892767, -3.59726, 1, 0.7843137, 0, 1,
-1.136192, -1.248654, -2.592845, 1, 0.7921569, 0, 1,
-1.134677, -2.411531, -1.422263, 1, 0.7960784, 0, 1,
-1.131473, 1.594393, 0.3520124, 1, 0.8039216, 0, 1,
-1.126898, 0.3570966, -1.225962, 1, 0.8117647, 0, 1,
-1.11623, -0.9201212, -4.370393, 1, 0.8156863, 0, 1,
-1.104377, 0.855923, -2.608158, 1, 0.8235294, 0, 1,
-1.103154, -0.3927313, -0.8141931, 1, 0.827451, 0, 1,
-1.100541, 1.374582, -0.7360653, 1, 0.8352941, 0, 1,
-1.095837, 0.9984884, 0.3696015, 1, 0.8392157, 0, 1,
-1.092844, -1.493337, -1.871607, 1, 0.8470588, 0, 1,
-1.091311, -0.6488868, -0.8263013, 1, 0.8509804, 0, 1,
-1.087398, 1.452548, 0.4538614, 1, 0.8588235, 0, 1,
-1.085627, -0.4620516, -2.546256, 1, 0.8627451, 0, 1,
-1.06979, -0.3948205, -1.113485, 1, 0.8705882, 0, 1,
-1.069441, -0.5298649, -1.300884, 1, 0.8745098, 0, 1,
-1.068324, -1.481933, -3.06514, 1, 0.8823529, 0, 1,
-1.057006, 0.2082187, -0.991595, 1, 0.8862745, 0, 1,
-1.055193, 0.1575415, -0.05176339, 1, 0.8941177, 0, 1,
-1.046008, -1.378446, -1.307038, 1, 0.8980392, 0, 1,
-1.036541, 0.361487, -0.2221352, 1, 0.9058824, 0, 1,
-1.035681, 0.06264918, -0.6154491, 1, 0.9137255, 0, 1,
-1.033976, 0.4054522, -0.4367306, 1, 0.9176471, 0, 1,
-1.022027, 0.4391633, -2.021945, 1, 0.9254902, 0, 1,
-1.021822, 0.05581421, -2.219854, 1, 0.9294118, 0, 1,
-1.021623, -0.1486723, -2.265729, 1, 0.9372549, 0, 1,
-1.021345, -1.759249, -1.349385, 1, 0.9411765, 0, 1,
-1.008726, -1.128221, -2.533366, 1, 0.9490196, 0, 1,
-1.004586, 0.6194085, -0.5332755, 1, 0.9529412, 0, 1,
-0.9988739, -0.246657, -1.555646, 1, 0.9607843, 0, 1,
-0.9954024, -0.1732951, 0.1187107, 1, 0.9647059, 0, 1,
-0.9915308, -0.6872242, -0.3074451, 1, 0.972549, 0, 1,
-0.9887903, -1.638187, -2.407483, 1, 0.9764706, 0, 1,
-0.9839289, -0.460435, -4.698125, 1, 0.9843137, 0, 1,
-0.9788851, -0.901491, -2.134349, 1, 0.9882353, 0, 1,
-0.9655281, 1.415615, -1.105583, 1, 0.9960784, 0, 1,
-0.9583039, 0.9989218, 1.112081, 0.9960784, 1, 0, 1,
-0.9490619, 0.2699252, 0.5078672, 0.9921569, 1, 0, 1,
-0.9428678, -0.7931882, -2.580497, 0.9843137, 1, 0, 1,
-0.930145, 0.1827879, -1.790727, 0.9803922, 1, 0, 1,
-0.926446, 0.4345599, -1.409908, 0.972549, 1, 0, 1,
-0.9248571, -1.026769, -5.330776, 0.9686275, 1, 0, 1,
-0.9216819, -0.1967956, -0.8955046, 0.9607843, 1, 0, 1,
-0.917104, -1.942802, -2.101674, 0.9568627, 1, 0, 1,
-0.9148022, -0.9646478, -0.1825463, 0.9490196, 1, 0, 1,
-0.9088772, 0.2614159, -2.919211, 0.945098, 1, 0, 1,
-0.8987473, 1.585889, -1.288866, 0.9372549, 1, 0, 1,
-0.8981955, 0.3796952, -1.562127, 0.9333333, 1, 0, 1,
-0.885433, -0.542773, -2.878522, 0.9254902, 1, 0, 1,
-0.8736078, -1.046133, -1.713797, 0.9215686, 1, 0, 1,
-0.8713838, -0.4328303, -1.953085, 0.9137255, 1, 0, 1,
-0.8677118, -1.203709, -1.115685, 0.9098039, 1, 0, 1,
-0.8645117, 1.004726, -0.6138388, 0.9019608, 1, 0, 1,
-0.8617458, -0.24083, -1.707, 0.8941177, 1, 0, 1,
-0.8576326, -0.003272579, -0.2928623, 0.8901961, 1, 0, 1,
-0.8449119, 2.07815, -1.62126, 0.8823529, 1, 0, 1,
-0.8430296, 0.2618992, -1.071353, 0.8784314, 1, 0, 1,
-0.8430172, 0.4878055, -1.663146, 0.8705882, 1, 0, 1,
-0.8330103, -0.434487, -1.322009, 0.8666667, 1, 0, 1,
-0.8315046, 0.4289868, -1.563363, 0.8588235, 1, 0, 1,
-0.8296563, 0.7264063, 0.6528845, 0.854902, 1, 0, 1,
-0.8288206, -0.7509091, -1.622274, 0.8470588, 1, 0, 1,
-0.8272256, 1.500932, -2.141651, 0.8431373, 1, 0, 1,
-0.8267519, 0.8897685, 1.389753, 0.8352941, 1, 0, 1,
-0.8266208, -1.779887, -2.776862, 0.8313726, 1, 0, 1,
-0.8165927, 0.04109794, -0.06214524, 0.8235294, 1, 0, 1,
-0.812143, 1.660115, -2.17197, 0.8196079, 1, 0, 1,
-0.8052254, 0.6414981, 0.638743, 0.8117647, 1, 0, 1,
-0.8030633, -0.6645097, -2.093494, 0.8078431, 1, 0, 1,
-0.7986166, -0.159033, -2.54171, 0.8, 1, 0, 1,
-0.7971201, 0.9917836, -0.2908814, 0.7921569, 1, 0, 1,
-0.7950258, -0.4011795, -1.04518, 0.7882353, 1, 0, 1,
-0.7917742, 1.239551, -1.734318, 0.7803922, 1, 0, 1,
-0.7909369, -1.511587, -3.566825, 0.7764706, 1, 0, 1,
-0.7830601, 0.04939706, -1.951622, 0.7686275, 1, 0, 1,
-0.7796752, -1.377948, -3.071483, 0.7647059, 1, 0, 1,
-0.7664037, 0.577459, -1.292917, 0.7568628, 1, 0, 1,
-0.7659364, 0.5999029, -1.710948, 0.7529412, 1, 0, 1,
-0.7613996, 0.0366911, -0.5934796, 0.7450981, 1, 0, 1,
-0.7542427, 1.449347, -0.3448833, 0.7411765, 1, 0, 1,
-0.741842, 1.028053, -0.444765, 0.7333333, 1, 0, 1,
-0.7408151, -1.094606, -3.604681, 0.7294118, 1, 0, 1,
-0.7390626, -0.02155896, -3.162185, 0.7215686, 1, 0, 1,
-0.7377877, 0.9402136, 0.7375393, 0.7176471, 1, 0, 1,
-0.7373127, 0.01717162, -0.428894, 0.7098039, 1, 0, 1,
-0.7327529, -0.7951944, -2.227615, 0.7058824, 1, 0, 1,
-0.7327221, 0.150489, -1.63989, 0.6980392, 1, 0, 1,
-0.7305542, -0.7608475, -2.37352, 0.6901961, 1, 0, 1,
-0.7288399, 0.7188048, -0.2635061, 0.6862745, 1, 0, 1,
-0.7278558, -0.1329514, -0.09858093, 0.6784314, 1, 0, 1,
-0.7250201, 0.6310471, -1.246089, 0.6745098, 1, 0, 1,
-0.7249732, -0.310738, -1.71829, 0.6666667, 1, 0, 1,
-0.7243457, -0.839796, -2.386634, 0.6627451, 1, 0, 1,
-0.7235606, -0.4233766, -3.921975, 0.654902, 1, 0, 1,
-0.7172122, -1.289911, -4.388458, 0.6509804, 1, 0, 1,
-0.7155358, 0.9409201, -0.8926775, 0.6431373, 1, 0, 1,
-0.7101576, -1.568498, -2.28545, 0.6392157, 1, 0, 1,
-0.702315, 1.085883, -2.074292, 0.6313726, 1, 0, 1,
-0.6944644, 0.6593531, -3.301927, 0.627451, 1, 0, 1,
-0.6904952, -0.3338917, -4.33776, 0.6196079, 1, 0, 1,
-0.6885831, -0.5709344, -3.395114, 0.6156863, 1, 0, 1,
-0.6879029, -0.3027168, -2.103776, 0.6078432, 1, 0, 1,
-0.6837903, -0.6614556, -0.6037705, 0.6039216, 1, 0, 1,
-0.6809478, 0.3803393, -0.7956119, 0.5960785, 1, 0, 1,
-0.6806546, -0.7152652, -2.181784, 0.5882353, 1, 0, 1,
-0.6806317, 0.1373291, -0.9703674, 0.5843138, 1, 0, 1,
-0.6804828, 1.246056, 0.2969464, 0.5764706, 1, 0, 1,
-0.6792895, 0.6944073, -0.894144, 0.572549, 1, 0, 1,
-0.6769385, -1.559721, -2.479694, 0.5647059, 1, 0, 1,
-0.6765565, 0.2544557, -1.548056, 0.5607843, 1, 0, 1,
-0.6757055, 0.8575259, -1.323184, 0.5529412, 1, 0, 1,
-0.6725712, -1.949055, -1.623047, 0.5490196, 1, 0, 1,
-0.6703449, 2.027848, 3.105598, 0.5411765, 1, 0, 1,
-0.6677547, -1.996027, -1.445484, 0.5372549, 1, 0, 1,
-0.6676994, 0.6677612, 1.023322, 0.5294118, 1, 0, 1,
-0.662097, 1.972619, 0.5633251, 0.5254902, 1, 0, 1,
-0.6582069, -1.527494, -3.603417, 0.5176471, 1, 0, 1,
-0.6554627, 1.046114, -1.131279, 0.5137255, 1, 0, 1,
-0.6341484, -0.5840898, -4.01219, 0.5058824, 1, 0, 1,
-0.6309437, 0.107944, -2.329178, 0.5019608, 1, 0, 1,
-0.6302184, -0.9828588, -1.807115, 0.4941176, 1, 0, 1,
-0.6244721, 0.1156983, -2.255754, 0.4862745, 1, 0, 1,
-0.6137366, -2.353582, -3.146371, 0.4823529, 1, 0, 1,
-0.613559, 0.9738575, -0.6850213, 0.4745098, 1, 0, 1,
-0.6128256, -0.2334832, -1.579555, 0.4705882, 1, 0, 1,
-0.6125749, 1.155285, 1.034943, 0.4627451, 1, 0, 1,
-0.6098081, 0.7733659, -1.26243, 0.4588235, 1, 0, 1,
-0.6068704, 1.26099, -1.824049, 0.4509804, 1, 0, 1,
-0.6047357, -1.040001, -3.563979, 0.4470588, 1, 0, 1,
-0.5987322, 0.3146544, -2.564891, 0.4392157, 1, 0, 1,
-0.5942424, -0.2795752, -0.8239487, 0.4352941, 1, 0, 1,
-0.5937719, 0.1781763, -0.322377, 0.427451, 1, 0, 1,
-0.5930336, 1.305439, -1.42342, 0.4235294, 1, 0, 1,
-0.5916182, -0.3488307, -2.184461, 0.4156863, 1, 0, 1,
-0.5896394, -0.07279285, -0.3439815, 0.4117647, 1, 0, 1,
-0.5807307, -1.145303, -3.968856, 0.4039216, 1, 0, 1,
-0.5803974, 1.1749, -0.7866485, 0.3960784, 1, 0, 1,
-0.5758187, 2.056075, 1.1419, 0.3921569, 1, 0, 1,
-0.5649947, 0.4539117, -0.1423499, 0.3843137, 1, 0, 1,
-0.5624065, 2.58072, -0.04588726, 0.3803922, 1, 0, 1,
-0.559681, -0.5006225, -2.969616, 0.372549, 1, 0, 1,
-0.5568706, -0.1767022, -2.544473, 0.3686275, 1, 0, 1,
-0.5543226, -0.3522857, -1.822928, 0.3607843, 1, 0, 1,
-0.5509742, -1.453978, -2.864033, 0.3568628, 1, 0, 1,
-0.5502017, -0.3740022, -1.4938, 0.3490196, 1, 0, 1,
-0.5483798, 0.9829975, 0.5194736, 0.345098, 1, 0, 1,
-0.540414, -0.8828979, -3.620187, 0.3372549, 1, 0, 1,
-0.5362241, -1.588206, -4.557015, 0.3333333, 1, 0, 1,
-0.5355427, -0.457608, -1.591592, 0.3254902, 1, 0, 1,
-0.5337634, 0.346541, -0.3388779, 0.3215686, 1, 0, 1,
-0.5335181, -1.198882, -3.481976, 0.3137255, 1, 0, 1,
-0.5332589, -0.721507, -3.629956, 0.3098039, 1, 0, 1,
-0.5286586, -0.8045186, -3.742743, 0.3019608, 1, 0, 1,
-0.5240985, 0.8478064, -1.42526, 0.2941177, 1, 0, 1,
-0.5226046, -1.131401, -1.383306, 0.2901961, 1, 0, 1,
-0.5172029, -1.4778, -2.221396, 0.282353, 1, 0, 1,
-0.5151595, 1.081591, 1.226506, 0.2784314, 1, 0, 1,
-0.5132067, -1.758854, -2.82067, 0.2705882, 1, 0, 1,
-0.5131053, -0.8697746, -1.751534, 0.2666667, 1, 0, 1,
-0.5078741, 2.60832, -0.9825459, 0.2588235, 1, 0, 1,
-0.4982328, -2.16778, -2.211412, 0.254902, 1, 0, 1,
-0.4975086, -1.213847, -1.098398, 0.2470588, 1, 0, 1,
-0.4973356, -1.195817, -1.457084, 0.2431373, 1, 0, 1,
-0.495481, -0.2020279, -1.566197, 0.2352941, 1, 0, 1,
-0.4928962, -0.1412747, -2.210436, 0.2313726, 1, 0, 1,
-0.4889123, 0.2518093, -0.4322699, 0.2235294, 1, 0, 1,
-0.4834939, 0.4711497, -0.2974716, 0.2196078, 1, 0, 1,
-0.480981, -0.1246561, -1.356395, 0.2117647, 1, 0, 1,
-0.4760422, -1.044685, -1.567033, 0.2078431, 1, 0, 1,
-0.4751871, -0.2256294, -3.766932, 0.2, 1, 0, 1,
-0.4750673, -1.829858, -4.11131, 0.1921569, 1, 0, 1,
-0.4710109, -1.506843, -3.461492, 0.1882353, 1, 0, 1,
-0.4683393, 0.7821052, -0.2128774, 0.1803922, 1, 0, 1,
-0.4683191, -2.167712, -3.226035, 0.1764706, 1, 0, 1,
-0.4674192, 1.489952, -0.3066019, 0.1686275, 1, 0, 1,
-0.4645819, -0.451606, -1.277847, 0.1647059, 1, 0, 1,
-0.4509427, -0.2775179, -1.636555, 0.1568628, 1, 0, 1,
-0.4469683, 0.1418374, -1.604444, 0.1529412, 1, 0, 1,
-0.444532, -0.7476479, -2.505636, 0.145098, 1, 0, 1,
-0.4412306, -2.377336, -2.172235, 0.1411765, 1, 0, 1,
-0.4408685, 0.8185866, 0.04643612, 0.1333333, 1, 0, 1,
-0.4383344, -0.929081, -3.260313, 0.1294118, 1, 0, 1,
-0.4368061, 0.5708184, 0.6848348, 0.1215686, 1, 0, 1,
-0.4332072, -1.63037, -1.699889, 0.1176471, 1, 0, 1,
-0.4321085, 0.3852842, 0.2231047, 0.1098039, 1, 0, 1,
-0.4315545, 0.425867, -2.887422, 0.1058824, 1, 0, 1,
-0.4310877, 0.5838519, -1.724558, 0.09803922, 1, 0, 1,
-0.4308177, -0.34784, -1.087716, 0.09019608, 1, 0, 1,
-0.4289177, -0.625645, -3.008301, 0.08627451, 1, 0, 1,
-0.4259696, -0.379767, -1.811541, 0.07843138, 1, 0, 1,
-0.4234711, -0.6033714, -1.571044, 0.07450981, 1, 0, 1,
-0.4234357, 2.467539, 0.6891679, 0.06666667, 1, 0, 1,
-0.4204186, -0.5402812, -3.230053, 0.0627451, 1, 0, 1,
-0.4195403, 1.084441, -0.1339662, 0.05490196, 1, 0, 1,
-0.4176609, -1.369642, -3.403358, 0.05098039, 1, 0, 1,
-0.4152222, -1.197538, -3.712942, 0.04313726, 1, 0, 1,
-0.410664, -2.321905, -1.94711, 0.03921569, 1, 0, 1,
-0.410559, -0.2477918, -2.933216, 0.03137255, 1, 0, 1,
-0.4094737, 0.8250852, -1.711852, 0.02745098, 1, 0, 1,
-0.4090722, 0.03781087, -1.241546, 0.01960784, 1, 0, 1,
-0.4085531, -2.538753, -2.874759, 0.01568628, 1, 0, 1,
-0.40402, -0.5236078, -0.9588138, 0.007843138, 1, 0, 1,
-0.4024956, 1.625702, -0.7683098, 0.003921569, 1, 0, 1,
-0.4012832, -1.694027, -0.9495834, 0, 1, 0.003921569, 1,
-0.3966069, -0.6775098, -0.8229028, 0, 1, 0.01176471, 1,
-0.3952438, 0.1968574, 0.01776166, 0, 1, 0.01568628, 1,
-0.3925303, 0.5263997, -1.684371, 0, 1, 0.02352941, 1,
-0.3910466, 0.6911399, -1.030658, 0, 1, 0.02745098, 1,
-0.3910185, 0.7029325, -0.4164139, 0, 1, 0.03529412, 1,
-0.3776116, 1.789034, -1.165589, 0, 1, 0.03921569, 1,
-0.3695905, 1.201311, 0.6726051, 0, 1, 0.04705882, 1,
-0.3661672, -0.8165113, -2.691309, 0, 1, 0.05098039, 1,
-0.3623869, 0.9183195, -0.3675877, 0, 1, 0.05882353, 1,
-0.362269, -1.541874, -5.043162, 0, 1, 0.0627451, 1,
-0.3571779, -0.7701966, -2.34464, 0, 1, 0.07058824, 1,
-0.3553116, -0.1147757, -1.542128, 0, 1, 0.07450981, 1,
-0.3509674, -0.1438987, -3.213818, 0, 1, 0.08235294, 1,
-0.3464273, -0.8333728, -2.619442, 0, 1, 0.08627451, 1,
-0.3460409, -1.659833, -4.485441, 0, 1, 0.09411765, 1,
-0.3427898, 0.9058773, -0.7275318, 0, 1, 0.1019608, 1,
-0.339704, 0.8065585, -0.1137947, 0, 1, 0.1058824, 1,
-0.3346863, -1.050634, -2.988986, 0, 1, 0.1137255, 1,
-0.3344758, -0.1070017, -2.453098, 0, 1, 0.1176471, 1,
-0.3336121, 0.04640444, -2.073683, 0, 1, 0.1254902, 1,
-0.3320461, 0.7984256, -1.525257, 0, 1, 0.1294118, 1,
-0.3318696, -0.2358484, -3.013022, 0, 1, 0.1372549, 1,
-0.3304583, 0.4903189, -0.2877237, 0, 1, 0.1411765, 1,
-0.3300189, 0.3498706, -1.575822, 0, 1, 0.1490196, 1,
-0.3259572, 0.2102826, -0.5500736, 0, 1, 0.1529412, 1,
-0.3252386, 1.587244, 0.150078, 0, 1, 0.1607843, 1,
-0.3247934, -0.3573321, -1.094683, 0, 1, 0.1647059, 1,
-0.3241751, -0.4497578, -4.075974, 0, 1, 0.172549, 1,
-0.3228891, -0.4480917, -2.508439, 0, 1, 0.1764706, 1,
-0.3228732, -0.7183606, -4.718313, 0, 1, 0.1843137, 1,
-0.3196864, 0.9256908, -2.978712, 0, 1, 0.1882353, 1,
-0.3163631, -0.376419, -0.987262, 0, 1, 0.1960784, 1,
-0.3162427, -0.5617042, -0.8961926, 0, 1, 0.2039216, 1,
-0.3135199, 0.2120326, -0.7603043, 0, 1, 0.2078431, 1,
-0.3128327, -0.3745193, -1.671438, 0, 1, 0.2156863, 1,
-0.3066557, -0.008202777, -0.9961097, 0, 1, 0.2196078, 1,
-0.3028628, -1.419052, -2.553357, 0, 1, 0.227451, 1,
-0.2998811, -0.4453747, -3.335453, 0, 1, 0.2313726, 1,
-0.2874757, 0.7748483, -0.3318034, 0, 1, 0.2392157, 1,
-0.2870679, -1.678621, -1.657709, 0, 1, 0.2431373, 1,
-0.2830531, 0.8376742, -0.9737391, 0, 1, 0.2509804, 1,
-0.2827257, -0.5137534, -2.005416, 0, 1, 0.254902, 1,
-0.2827246, -0.1768697, -1.567178, 0, 1, 0.2627451, 1,
-0.2825924, -0.02031894, -1.306592, 0, 1, 0.2666667, 1,
-0.2820584, 0.5487072, -0.8322414, 0, 1, 0.2745098, 1,
-0.276275, 2.074123, -1.349153, 0, 1, 0.2784314, 1,
-0.2700785, -0.0468101, -2.603774, 0, 1, 0.2862745, 1,
-0.2653507, 0.4382771, 0.1650082, 0, 1, 0.2901961, 1,
-0.2480888, 0.09340064, -2.931194, 0, 1, 0.2980392, 1,
-0.247773, -0.4968044, -2.449311, 0, 1, 0.3058824, 1,
-0.2415439, -0.4105968, -3.332181, 0, 1, 0.3098039, 1,
-0.2408697, 0.4285747, -1.086371, 0, 1, 0.3176471, 1,
-0.2399334, -0.9267881, -3.218062, 0, 1, 0.3215686, 1,
-0.2399029, -0.5005811, -2.471778, 0, 1, 0.3294118, 1,
-0.2396414, -1.221625, -2.875309, 0, 1, 0.3333333, 1,
-0.2360449, 1.149086, -0.7886314, 0, 1, 0.3411765, 1,
-0.2336151, 0.9301987, 0.9136496, 0, 1, 0.345098, 1,
-0.2320716, 0.6364728, -1.573681, 0, 1, 0.3529412, 1,
-0.2200817, -0.03875696, -2.874694, 0, 1, 0.3568628, 1,
-0.2188943, 0.8181168, -1.785332, 0, 1, 0.3647059, 1,
-0.2143248, -0.5676022, -3.61921, 0, 1, 0.3686275, 1,
-0.2110748, 0.9358906, -1.096489, 0, 1, 0.3764706, 1,
-0.2067871, -1.729366, -2.951715, 0, 1, 0.3803922, 1,
-0.2057013, 2.247181, 2.170996, 0, 1, 0.3882353, 1,
-0.2044033, 0.5383539, -0.1671195, 0, 1, 0.3921569, 1,
-0.1992182, 0.7477041, -2.048836, 0, 1, 0.4, 1,
-0.1932528, 0.5042694, -0.4583535, 0, 1, 0.4078431, 1,
-0.1929088, 1.13567, -0.7267255, 0, 1, 0.4117647, 1,
-0.1921393, -0.1128928, -3.237665, 0, 1, 0.4196078, 1,
-0.1870422, -2.42042, -1.068516, 0, 1, 0.4235294, 1,
-0.1826065, -0.9054075, -4.413998, 0, 1, 0.4313726, 1,
-0.1815169, -0.889787, -4.710599, 0, 1, 0.4352941, 1,
-0.1812041, 0.4772807, -2.436974, 0, 1, 0.4431373, 1,
-0.1807328, 0.3049211, -3.417742, 0, 1, 0.4470588, 1,
-0.1794118, 0.3573593, 0.659045, 0, 1, 0.454902, 1,
-0.1783593, 0.508562, -0.6883673, 0, 1, 0.4588235, 1,
-0.175906, -1.064372, -2.668059, 0, 1, 0.4666667, 1,
-0.1630897, -0.2313162, -3.796956, 0, 1, 0.4705882, 1,
-0.1549653, -1.141724, -3.866826, 0, 1, 0.4784314, 1,
-0.1529181, 1.23396, 0.8838687, 0, 1, 0.4823529, 1,
-0.1520132, -0.4653605, -2.273547, 0, 1, 0.4901961, 1,
-0.1513822, 0.783303, -1.092197, 0, 1, 0.4941176, 1,
-0.1496917, -0.4029484, -3.221233, 0, 1, 0.5019608, 1,
-0.1475284, 2.037461, -1.901322, 0, 1, 0.509804, 1,
-0.1465787, -1.46924, -3.265643, 0, 1, 0.5137255, 1,
-0.1462009, 0.3076021, 0.06312154, 0, 1, 0.5215687, 1,
-0.1461654, -0.3704892, -4.050677, 0, 1, 0.5254902, 1,
-0.1423234, -0.1563324, -1.816682, 0, 1, 0.5333334, 1,
-0.1404349, -0.08405361, -2.746776, 0, 1, 0.5372549, 1,
-0.1381669, -0.4297231, -2.950194, 0, 1, 0.5450981, 1,
-0.1380354, 0.8524032, 0.137125, 0, 1, 0.5490196, 1,
-0.132163, -3.047701, -3.704745, 0, 1, 0.5568628, 1,
-0.1288383, 0.6353787, 0.3491399, 0, 1, 0.5607843, 1,
-0.1283429, 0.632934, 0.2132512, 0, 1, 0.5686275, 1,
-0.1258363, 0.1045516, -0.936811, 0, 1, 0.572549, 1,
-0.118557, 0.4102185, 1.006552, 0, 1, 0.5803922, 1,
-0.1178676, 1.323541, 0.635413, 0, 1, 0.5843138, 1,
-0.1158339, 0.8093535, -0.5162258, 0, 1, 0.5921569, 1,
-0.1156192, 1.462502, 0.2082804, 0, 1, 0.5960785, 1,
-0.1114714, 0.0849738, -1.790341, 0, 1, 0.6039216, 1,
-0.1103793, 0.1488232, -0.7598848, 0, 1, 0.6117647, 1,
-0.1062164, 1.067624, -2.385979, 0, 1, 0.6156863, 1,
-0.1029299, -1.753188, -2.345387, 0, 1, 0.6235294, 1,
-0.1008114, -0.1425979, -1.433124, 0, 1, 0.627451, 1,
-0.09710999, -1.589196, -2.053191, 0, 1, 0.6352941, 1,
-0.09665759, -1.045991, -4.185533, 0, 1, 0.6392157, 1,
-0.0921821, -0.567072, -4.387719, 0, 1, 0.6470588, 1,
-0.09020215, 0.8920398, -0.3206994, 0, 1, 0.6509804, 1,
-0.0893371, 2.332748, -0.3059044, 0, 1, 0.6588235, 1,
-0.08614818, -1.242267, -2.441623, 0, 1, 0.6627451, 1,
-0.08421617, -0.1127918, -2.443625, 0, 1, 0.6705883, 1,
-0.08419959, -0.6864786, -2.532825, 0, 1, 0.6745098, 1,
-0.0796812, -1.218184, -5.027454, 0, 1, 0.682353, 1,
-0.07909226, 0.01443944, 0.3165608, 0, 1, 0.6862745, 1,
-0.07836526, 1.687129, -2.001628, 0, 1, 0.6941177, 1,
-0.07671303, -1.064871, -3.010507, 0, 1, 0.7019608, 1,
-0.07641986, -0.4074009, -3.452168, 0, 1, 0.7058824, 1,
-0.07336622, -0.2105218, -2.578532, 0, 1, 0.7137255, 1,
-0.0680173, -0.5806205, -4.464648, 0, 1, 0.7176471, 1,
-0.06612203, 0.8692876, 2.029842, 0, 1, 0.7254902, 1,
-0.06523962, 1.574296, 0.07880813, 0, 1, 0.7294118, 1,
-0.06325094, 0.7175463, 1.029171, 0, 1, 0.7372549, 1,
-0.05881627, 1.323008, -0.5068369, 0, 1, 0.7411765, 1,
-0.05059622, -0.04874048, -3.229771, 0, 1, 0.7490196, 1,
-0.04665865, 1.905491, -0.1258267, 0, 1, 0.7529412, 1,
-0.04630178, 0.7437286, -1.074911, 0, 1, 0.7607843, 1,
-0.04530942, 0.7110509, -1.830215, 0, 1, 0.7647059, 1,
-0.04291367, 0.6154804, 0.4009789, 0, 1, 0.772549, 1,
-0.04128246, 1.343595, -0.2523525, 0, 1, 0.7764706, 1,
-0.03998178, 0.4060777, 0.219826, 0, 1, 0.7843137, 1,
-0.03950448, 1.68135, 1.861256, 0, 1, 0.7882353, 1,
-0.03666615, -0.8233572, -2.74183, 0, 1, 0.7960784, 1,
-0.03472558, 0.7201461, 1.960092, 0, 1, 0.8039216, 1,
-0.03311108, -0.9486709, -2.96013, 0, 1, 0.8078431, 1,
-0.03228233, 1.562984, -1.492338, 0, 1, 0.8156863, 1,
-0.02828307, 0.002353679, -3.073522, 0, 1, 0.8196079, 1,
-0.02814271, 0.58524, 0.7279593, 0, 1, 0.827451, 1,
-0.02517327, 1.581311, -0.4012543, 0, 1, 0.8313726, 1,
-0.02265765, 2.324278, 0.7821974, 0, 1, 0.8392157, 1,
-0.02038948, -0.5542816, -2.820188, 0, 1, 0.8431373, 1,
-0.01521114, -0.9896548, -2.572989, 0, 1, 0.8509804, 1,
-0.01126058, 0.6568837, -0.1118857, 0, 1, 0.854902, 1,
-0.01067808, -0.9931943, -2.875917, 0, 1, 0.8627451, 1,
-0.008323976, 0.6381286, -0.3831383, 0, 1, 0.8666667, 1,
-0.002979337, 1.891071, -0.5891457, 0, 1, 0.8745098, 1,
-0.001021738, -0.80683, -3.157981, 0, 1, 0.8784314, 1,
0.002367217, -0.3699089, 1.512671, 0, 1, 0.8862745, 1,
0.002846314, 0.03180066, -1.337828, 0, 1, 0.8901961, 1,
0.005534025, 0.6845233, -0.1056224, 0, 1, 0.8980392, 1,
0.005554405, -1.9875, 2.879259, 0, 1, 0.9058824, 1,
0.006724752, 0.6513838, 0.3307799, 0, 1, 0.9098039, 1,
0.00974581, -0.02433899, 2.144124, 0, 1, 0.9176471, 1,
0.0117458, 0.5148715, 1.460922, 0, 1, 0.9215686, 1,
0.01378488, 0.4080476, -0.4692723, 0, 1, 0.9294118, 1,
0.0159896, -0.2162748, 3.263556, 0, 1, 0.9333333, 1,
0.02417608, -2.258976, 3.798764, 0, 1, 0.9411765, 1,
0.0283065, 0.005638078, 1.418714, 0, 1, 0.945098, 1,
0.02988185, -1.127741, 3.067879, 0, 1, 0.9529412, 1,
0.03045129, -2.255957, 3.156434, 0, 1, 0.9568627, 1,
0.03673568, 0.9584751, -0.5925931, 0, 1, 0.9647059, 1,
0.03829491, 2.033275, -0.004247827, 0, 1, 0.9686275, 1,
0.04080304, -1.40918, 3.41349, 0, 1, 0.9764706, 1,
0.04129693, 1.368781, -0.4182666, 0, 1, 0.9803922, 1,
0.04187267, -0.1979033, 2.028125, 0, 1, 0.9882353, 1,
0.04389694, -0.2650738, 2.702199, 0, 1, 0.9921569, 1,
0.04784054, 0.08089688, 0.8533452, 0, 1, 1, 1,
0.04869992, 1.635532, -0.8068375, 0, 0.9921569, 1, 1,
0.05281299, -1.345311, 1.630386, 0, 0.9882353, 1, 1,
0.05303252, 1.601944, -1.038953, 0, 0.9803922, 1, 1,
0.05362375, 0.3085798, 1.346423, 0, 0.9764706, 1, 1,
0.05378944, 0.2736639, -0.6151081, 0, 0.9686275, 1, 1,
0.05676542, 1.920036, -0.4254621, 0, 0.9647059, 1, 1,
0.06002732, -1.25099, 4.638463, 0, 0.9568627, 1, 1,
0.06171984, 1.220029, 0.6719065, 0, 0.9529412, 1, 1,
0.06445251, 1.617524, -0.1191917, 0, 0.945098, 1, 1,
0.06753492, -0.02691011, 2.469498, 0, 0.9411765, 1, 1,
0.06873394, 0.6946844, 1.383712, 0, 0.9333333, 1, 1,
0.06928496, 0.603451, -1.261356, 0, 0.9294118, 1, 1,
0.06947516, -0.2351449, 3.057046, 0, 0.9215686, 1, 1,
0.07143136, 0.06626406, 0.2840895, 0, 0.9176471, 1, 1,
0.07691851, -0.1258158, 3.425702, 0, 0.9098039, 1, 1,
0.07796837, -2.617035, 2.975525, 0, 0.9058824, 1, 1,
0.07883085, 2.471642, -0.69178, 0, 0.8980392, 1, 1,
0.08082876, -0.4864358, 2.031447, 0, 0.8901961, 1, 1,
0.08232698, 1.376559, -0.57659, 0, 0.8862745, 1, 1,
0.08334097, -1.187923, 4.061514, 0, 0.8784314, 1, 1,
0.08364375, 0.1093871, -0.06169027, 0, 0.8745098, 1, 1,
0.09163265, 0.9219163, -0.4745385, 0, 0.8666667, 1, 1,
0.09490548, -0.05182849, 1.172969, 0, 0.8627451, 1, 1,
0.09624847, -0.03827881, 0.6232901, 0, 0.854902, 1, 1,
0.1022241, 1.440868, -0.3176535, 0, 0.8509804, 1, 1,
0.1050915, -0.4823338, 2.42827, 0, 0.8431373, 1, 1,
0.1053208, 0.8422875, 1.628267, 0, 0.8392157, 1, 1,
0.1087855, -1.069967, 2.954575, 0, 0.8313726, 1, 1,
0.1173701, 0.04711678, 0.3994278, 0, 0.827451, 1, 1,
0.1179152, 0.7665944, -0.3937684, 0, 0.8196079, 1, 1,
0.1221194, -0.9177674, 3.591476, 0, 0.8156863, 1, 1,
0.1258549, 0.5856189, 0.363397, 0, 0.8078431, 1, 1,
0.128004, 0.1746359, 0.2448563, 0, 0.8039216, 1, 1,
0.1317971, 1.258148, -0.8018312, 0, 0.7960784, 1, 1,
0.1325367, -0.05504615, 0.2482445, 0, 0.7882353, 1, 1,
0.1370649, 2.553723, -0.5167785, 0, 0.7843137, 1, 1,
0.1478318, 1.22082, 0.7782944, 0, 0.7764706, 1, 1,
0.1544203, 2.286951, -1.186012, 0, 0.772549, 1, 1,
0.1574113, 0.7433083, -0.6348262, 0, 0.7647059, 1, 1,
0.1576064, -1.238343, 3.852273, 0, 0.7607843, 1, 1,
0.1603374, -2.092056, 3.273795, 0, 0.7529412, 1, 1,
0.1611889, -0.1646973, 1.987586, 0, 0.7490196, 1, 1,
0.1614009, 1.322778, -0.05886259, 0, 0.7411765, 1, 1,
0.1663802, -0.9447678, 4.106468, 0, 0.7372549, 1, 1,
0.1696563, 0.121402, 0.475186, 0, 0.7294118, 1, 1,
0.1705196, -0.205811, 1.692093, 0, 0.7254902, 1, 1,
0.170997, -1.545905, 1.454032, 0, 0.7176471, 1, 1,
0.1739169, -0.1900938, 2.520442, 0, 0.7137255, 1, 1,
0.1762114, 0.8240098, 0.9498612, 0, 0.7058824, 1, 1,
0.1763513, 1.974394, 0.4636173, 0, 0.6980392, 1, 1,
0.182451, 1.607503, -0.03133628, 0, 0.6941177, 1, 1,
0.1827409, -0.1717575, 3.58418, 0, 0.6862745, 1, 1,
0.1841378, 0.6786181, 0.2959317, 0, 0.682353, 1, 1,
0.1864124, 1.124338, 0.111935, 0, 0.6745098, 1, 1,
0.1865523, -1.313444, 2.285982, 0, 0.6705883, 1, 1,
0.1894195, 0.8493333, 0.2319213, 0, 0.6627451, 1, 1,
0.1904237, -1.829338, 3.69136, 0, 0.6588235, 1, 1,
0.195803, 1.415686, -0.5764792, 0, 0.6509804, 1, 1,
0.2038741, -0.823443, 3.178221, 0, 0.6470588, 1, 1,
0.2048336, -0.1620921, 2.174166, 0, 0.6392157, 1, 1,
0.2097261, -0.1496266, 1.49801, 0, 0.6352941, 1, 1,
0.2112539, -0.5083753, 3.070306, 0, 0.627451, 1, 1,
0.2113071, -1.35249, 2.316354, 0, 0.6235294, 1, 1,
0.2121427, -0.1981551, 2.00322, 0, 0.6156863, 1, 1,
0.2136567, 1.183436, -0.8574995, 0, 0.6117647, 1, 1,
0.2146876, 0.8738192, -0.3512628, 0, 0.6039216, 1, 1,
0.2155974, 0.9980112, 0.7618918, 0, 0.5960785, 1, 1,
0.2197662, 1.193393, 0.6968993, 0, 0.5921569, 1, 1,
0.2226481, -1.402736, 2.470201, 0, 0.5843138, 1, 1,
0.22662, -0.3776808, 4.09033, 0, 0.5803922, 1, 1,
0.2362403, -0.1733602, 2.015076, 0, 0.572549, 1, 1,
0.23697, -0.6204244, 2.981251, 0, 0.5686275, 1, 1,
0.2390707, 0.9135527, 0.07942229, 0, 0.5607843, 1, 1,
0.2394775, -0.6562362, 1.204488, 0, 0.5568628, 1, 1,
0.2426343, 1.219208, 1.184115, 0, 0.5490196, 1, 1,
0.2477306, 0.3502967, 1.163249, 0, 0.5450981, 1, 1,
0.2496379, -1.202793, 2.240152, 0, 0.5372549, 1, 1,
0.2499547, 2.497731, 0.4562207, 0, 0.5333334, 1, 1,
0.2503868, -0.7074714, 4.188369, 0, 0.5254902, 1, 1,
0.2505724, -0.3334552, 1.433601, 0, 0.5215687, 1, 1,
0.2514404, -1.422329, 2.692963, 0, 0.5137255, 1, 1,
0.2519982, -1.000719, 2.807451, 0, 0.509804, 1, 1,
0.2564046, 0.2362014, 1.447293, 0, 0.5019608, 1, 1,
0.2576701, 1.198818, 1.01044, 0, 0.4941176, 1, 1,
0.2673362, 0.5026021, -0.06114805, 0, 0.4901961, 1, 1,
0.2677596, 0.4254337, 0.3257932, 0, 0.4823529, 1, 1,
0.2679689, -0.8458847, 1.898994, 0, 0.4784314, 1, 1,
0.2679761, 1.138409, -1.189659, 0, 0.4705882, 1, 1,
0.2780071, -0.8638072, 4.504965, 0, 0.4666667, 1, 1,
0.2819678, 0.530706, 0.177121, 0, 0.4588235, 1, 1,
0.2822869, -0.1743849, 1.069574, 0, 0.454902, 1, 1,
0.2845356, -1.633961, 3.235035, 0, 0.4470588, 1, 1,
0.2852113, -0.001301077, 1.313162, 0, 0.4431373, 1, 1,
0.2853047, -1.288802, 4.198869, 0, 0.4352941, 1, 1,
0.2883557, 1.173943, 1.749819, 0, 0.4313726, 1, 1,
0.290371, 0.2285218, 0.6027409, 0, 0.4235294, 1, 1,
0.2907408, 1.604502, -0.8742526, 0, 0.4196078, 1, 1,
0.2911757, 1.333427, -0.8893406, 0, 0.4117647, 1, 1,
0.2923627, 0.3423581, 1.441836, 0, 0.4078431, 1, 1,
0.2957389, 0.6555163, -0.801935, 0, 0.4, 1, 1,
0.2958133, -0.2756433, 2.48071, 0, 0.3921569, 1, 1,
0.2993242, -0.5633587, 2.902668, 0, 0.3882353, 1, 1,
0.3004062, -0.002897379, -0.6677549, 0, 0.3803922, 1, 1,
0.3033003, -0.436076, 3.3599, 0, 0.3764706, 1, 1,
0.3046043, -0.6328202, 2.501601, 0, 0.3686275, 1, 1,
0.3064425, -0.1644626, 3.266364, 0, 0.3647059, 1, 1,
0.3110409, -0.04225361, 2.0897, 0, 0.3568628, 1, 1,
0.3131714, -1.115499, 1.150946, 0, 0.3529412, 1, 1,
0.3135552, -1.143433, 2.605239, 0, 0.345098, 1, 1,
0.3144747, -1.225497, 3.522002, 0, 0.3411765, 1, 1,
0.3146726, 1.255556, 0.4055267, 0, 0.3333333, 1, 1,
0.314877, -1.493657, 1.43011, 0, 0.3294118, 1, 1,
0.3211458, -1.702896, 3.083276, 0, 0.3215686, 1, 1,
0.3265146, -0.8314621, 2.814131, 0, 0.3176471, 1, 1,
0.3269182, 2.359199, 0.9751034, 0, 0.3098039, 1, 1,
0.3335275, 0.5354006, 2.586205, 0, 0.3058824, 1, 1,
0.3336284, -1.248345, 4.327157, 0, 0.2980392, 1, 1,
0.3370126, -0.1490922, 2.757895, 0, 0.2901961, 1, 1,
0.3378745, -0.803379, 3.360049, 0, 0.2862745, 1, 1,
0.3380817, -0.3096905, 1.607962, 0, 0.2784314, 1, 1,
0.3423364, -0.8217022, 3.225683, 0, 0.2745098, 1, 1,
0.3523709, 0.686184, -0.9075513, 0, 0.2666667, 1, 1,
0.3587472, -1.761045, 4.402271, 0, 0.2627451, 1, 1,
0.3592933, 0.8517308, 1.317882, 0, 0.254902, 1, 1,
0.3600945, -0.2867584, 1.06145, 0, 0.2509804, 1, 1,
0.3618384, 0.4063225, 2.625645, 0, 0.2431373, 1, 1,
0.3622928, -0.3780314, 2.182659, 0, 0.2392157, 1, 1,
0.3645316, 0.09986258, -0.4463427, 0, 0.2313726, 1, 1,
0.3708932, 1.154674, -0.3696263, 0, 0.227451, 1, 1,
0.3716879, -1.358406, 2.335626, 0, 0.2196078, 1, 1,
0.3719161, 0.1495907, 0.7873989, 0, 0.2156863, 1, 1,
0.3823996, -0.7900168, 2.009863, 0, 0.2078431, 1, 1,
0.3855834, 1.426997, -0.8345605, 0, 0.2039216, 1, 1,
0.3869128, 0.06951185, 0.6048458, 0, 0.1960784, 1, 1,
0.3888182, -0.4140983, 2.578838, 0, 0.1882353, 1, 1,
0.3914192, 0.142969, 1.848223, 0, 0.1843137, 1, 1,
0.3919214, -0.537863, 1.044318, 0, 0.1764706, 1, 1,
0.4004126, -0.02126658, 0.7683029, 0, 0.172549, 1, 1,
0.400505, 1.174431, 0.9449177, 0, 0.1647059, 1, 1,
0.4107713, -0.1509686, 0.8498453, 0, 0.1607843, 1, 1,
0.4126273, 0.3111565, 1.897928, 0, 0.1529412, 1, 1,
0.4137197, -2.486541, 3.157374, 0, 0.1490196, 1, 1,
0.4233823, -1.387236, 1.433277, 0, 0.1411765, 1, 1,
0.4258443, -0.3564892, 1.886906, 0, 0.1372549, 1, 1,
0.4342819, 1.105206, 0.6205193, 0, 0.1294118, 1, 1,
0.4358385, 0.3050831, -0.06882591, 0, 0.1254902, 1, 1,
0.4418705, 0.8279429, 2.025701, 0, 0.1176471, 1, 1,
0.4506266, 0.3228414, -0.3097554, 0, 0.1137255, 1, 1,
0.4510617, 0.1447321, 0.7427087, 0, 0.1058824, 1, 1,
0.4523478, -1.333721, 2.957432, 0, 0.09803922, 1, 1,
0.4526494, -0.5725764, 2.013545, 0, 0.09411765, 1, 1,
0.4533014, -2.415683, 3.625015, 0, 0.08627451, 1, 1,
0.4608033, -0.909543, 2.10064, 0, 0.08235294, 1, 1,
0.4609555, -0.3870019, 2.610925, 0, 0.07450981, 1, 1,
0.46118, 0.07208433, 1.019833, 0, 0.07058824, 1, 1,
0.4689014, 0.9291888, 0.6291396, 0, 0.0627451, 1, 1,
0.4704879, 0.8107982, 1.959306, 0, 0.05882353, 1, 1,
0.4782038, 0.5159867, 1.594603, 0, 0.05098039, 1, 1,
0.4792766, -1.750102, 3.565119, 0, 0.04705882, 1, 1,
0.4865057, -0.9656586, 2.647061, 0, 0.03921569, 1, 1,
0.4871705, 0.8322892, 1.758524, 0, 0.03529412, 1, 1,
0.4883947, -1.153448, 3.27498, 0, 0.02745098, 1, 1,
0.4900749, 1.281451, 0.7545957, 0, 0.02352941, 1, 1,
0.4912613, -0.3754473, 0.77374, 0, 0.01568628, 1, 1,
0.4942878, -1.667605, 2.471451, 0, 0.01176471, 1, 1,
0.4960111, -0.0534954, 1.456728, 0, 0.003921569, 1, 1,
0.4976824, 0.8484212, 0.5173306, 0.003921569, 0, 1, 1,
0.4978173, 0.05091411, 1.345074, 0.007843138, 0, 1, 1,
0.4988914, 0.1936186, 0.9135053, 0.01568628, 0, 1, 1,
0.5052292, 0.6170756, 0.7146913, 0.01960784, 0, 1, 1,
0.5074978, 0.1816772, 2.794743, 0.02745098, 0, 1, 1,
0.5087885, -1.644627, 4.199218, 0.03137255, 0, 1, 1,
0.5095842, -0.9779786, 2.202671, 0.03921569, 0, 1, 1,
0.5130538, 0.7802768, 0.6415567, 0.04313726, 0, 1, 1,
0.5133343, 0.5726621, 0.8307528, 0.05098039, 0, 1, 1,
0.5135876, -0.7352082, 2.302485, 0.05490196, 0, 1, 1,
0.5179695, 0.5056486, -0.3201073, 0.0627451, 0, 1, 1,
0.519509, -0.3977448, 2.387824, 0.06666667, 0, 1, 1,
0.5212597, -0.8388068, 2.046547, 0.07450981, 0, 1, 1,
0.5213034, 1.37909, 0.3158819, 0.07843138, 0, 1, 1,
0.5246882, 0.01740526, 2.004608, 0.08627451, 0, 1, 1,
0.5258443, 1.114753, -0.7208144, 0.09019608, 0, 1, 1,
0.5259825, -1.212396, 2.089596, 0.09803922, 0, 1, 1,
0.5304325, 0.212047, 2.458869, 0.1058824, 0, 1, 1,
0.5393924, 0.928085, -1.075489, 0.1098039, 0, 1, 1,
0.5617718, -0.5793378, 1.786814, 0.1176471, 0, 1, 1,
0.5636947, 1.541508, 1.820936, 0.1215686, 0, 1, 1,
0.564222, -0.6843216, 2.804921, 0.1294118, 0, 1, 1,
0.5681542, 1.036648, -0.671432, 0.1333333, 0, 1, 1,
0.5709235, -1.281859, 1.180356, 0.1411765, 0, 1, 1,
0.5743532, 0.8037412, 1.259011, 0.145098, 0, 1, 1,
0.577243, -0.4927268, 2.06205, 0.1529412, 0, 1, 1,
0.5802641, 2.061167, 1.421647, 0.1568628, 0, 1, 1,
0.59117, 0.7515427, -0.1219645, 0.1647059, 0, 1, 1,
0.600274, 0.3303687, 0.5319802, 0.1686275, 0, 1, 1,
0.6012911, 1.680642, -0.6721352, 0.1764706, 0, 1, 1,
0.6042681, -0.2503586, 4.093456, 0.1803922, 0, 1, 1,
0.6056033, -0.210875, 1.656566, 0.1882353, 0, 1, 1,
0.6065521, -0.3922887, 2.234092, 0.1921569, 0, 1, 1,
0.609464, 0.4255881, 2.299131, 0.2, 0, 1, 1,
0.6107785, -0.3560162, 1.404036, 0.2078431, 0, 1, 1,
0.611208, 1.441355, 1.098206, 0.2117647, 0, 1, 1,
0.6156598, -0.04725918, 1.912136, 0.2196078, 0, 1, 1,
0.6168714, 1.014468, -0.3264881, 0.2235294, 0, 1, 1,
0.6244224, 0.05481265, 1.735553, 0.2313726, 0, 1, 1,
0.6286108, -0.2387625, -0.1000516, 0.2352941, 0, 1, 1,
0.6325262, -1.806557, 2.966835, 0.2431373, 0, 1, 1,
0.635304, 1.078124, -0.02039592, 0.2470588, 0, 1, 1,
0.6364015, -0.06675807, 2.467116, 0.254902, 0, 1, 1,
0.6384752, 0.3289827, 1.931179, 0.2588235, 0, 1, 1,
0.6406211, -1.705431, 3.200249, 0.2666667, 0, 1, 1,
0.6428837, 1.29507, -0.3390468, 0.2705882, 0, 1, 1,
0.6451452, -0.2877121, 1.058138, 0.2784314, 0, 1, 1,
0.6464599, -0.1966182, 1.173164, 0.282353, 0, 1, 1,
0.6514691, -0.2973313, 2.533529, 0.2901961, 0, 1, 1,
0.663915, 0.5226709, 0.4396009, 0.2941177, 0, 1, 1,
0.6673917, -0.02864542, 1.45799, 0.3019608, 0, 1, 1,
0.6689439, 0.04316536, 0.4513328, 0.3098039, 0, 1, 1,
0.67303, -0.03223924, 0.5733932, 0.3137255, 0, 1, 1,
0.6743032, -1.211317, 3.953442, 0.3215686, 0, 1, 1,
0.6748052, 1.075831, -0.04911654, 0.3254902, 0, 1, 1,
0.6778845, 0.204604, 2.496167, 0.3333333, 0, 1, 1,
0.6798466, 0.607595, 1.231018, 0.3372549, 0, 1, 1,
0.6816221, 0.6245416, 2.262147, 0.345098, 0, 1, 1,
0.684562, -0.06187978, 2.7173, 0.3490196, 0, 1, 1,
0.6847298, -1.218371, 3.590323, 0.3568628, 0, 1, 1,
0.6935585, -1.785578, 1.951471, 0.3607843, 0, 1, 1,
0.6974183, 1.486861, -1.317877, 0.3686275, 0, 1, 1,
0.6999946, -0.7506446, 2.864046, 0.372549, 0, 1, 1,
0.7004387, -0.9004397, 2.64129, 0.3803922, 0, 1, 1,
0.7032558, -2.28324, 2.514614, 0.3843137, 0, 1, 1,
0.705179, 0.5862609, 1.145383, 0.3921569, 0, 1, 1,
0.712115, -0.8141671, 1.785793, 0.3960784, 0, 1, 1,
0.7231099, 0.965225, 0.871197, 0.4039216, 0, 1, 1,
0.7234246, 1.168022, -2.215088, 0.4117647, 0, 1, 1,
0.7255109, 0.5607681, 2.193719, 0.4156863, 0, 1, 1,
0.725911, 0.3704449, 2.229309, 0.4235294, 0, 1, 1,
0.7312579, -1.875596, 1.847828, 0.427451, 0, 1, 1,
0.7335891, 0.03978746, 1.813414, 0.4352941, 0, 1, 1,
0.7350333, 1.668828, -1.06267, 0.4392157, 0, 1, 1,
0.7359832, 0.6584184, 0.5781004, 0.4470588, 0, 1, 1,
0.7406868, -0.4004073, 2.940375, 0.4509804, 0, 1, 1,
0.7431178, -0.20126, 3.800809, 0.4588235, 0, 1, 1,
0.7466354, -0.3585188, 1.883501, 0.4627451, 0, 1, 1,
0.7519401, 1.054826, 0.3402916, 0.4705882, 0, 1, 1,
0.7530241, 1.138605, 0.8461928, 0.4745098, 0, 1, 1,
0.7531297, 1.25199, 0.5209032, 0.4823529, 0, 1, 1,
0.755079, 0.00108817, 0.1755919, 0.4862745, 0, 1, 1,
0.7607583, -0.2726346, 1.215351, 0.4941176, 0, 1, 1,
0.7608191, 0.006345271, 1.945079, 0.5019608, 0, 1, 1,
0.7683771, 1.419941, 1.283661, 0.5058824, 0, 1, 1,
0.768984, 1.561513, 0.500567, 0.5137255, 0, 1, 1,
0.770218, -1.090775, 1.488004, 0.5176471, 0, 1, 1,
0.7730051, 1.497831, -0.68974, 0.5254902, 0, 1, 1,
0.7734738, 0.9512312, 0.1040088, 0.5294118, 0, 1, 1,
0.7748334, -0.1346289, 1.258046, 0.5372549, 0, 1, 1,
0.7754762, 1.305946, 0.373183, 0.5411765, 0, 1, 1,
0.7786236, 1.708015, -0.4136534, 0.5490196, 0, 1, 1,
0.7824953, 1.588872, -0.8395829, 0.5529412, 0, 1, 1,
0.7832007, -0.1853224, 1.567814, 0.5607843, 0, 1, 1,
0.7855946, -1.336006, 2.273035, 0.5647059, 0, 1, 1,
0.7879986, -0.8775544, 1.702074, 0.572549, 0, 1, 1,
0.7882938, -1.496423, 1.705287, 0.5764706, 0, 1, 1,
0.791747, 0.4740521, 0.04109462, 0.5843138, 0, 1, 1,
0.7928473, 1.005474, 0.2082486, 0.5882353, 0, 1, 1,
0.7928997, 0.1457758, 1.603241, 0.5960785, 0, 1, 1,
0.7934133, 1.021917, 0.0198729, 0.6039216, 0, 1, 1,
0.794818, -0.9799768, 2.573687, 0.6078432, 0, 1, 1,
0.7969018, 0.8447145, 0.3334332, 0.6156863, 0, 1, 1,
0.7990295, -0.2034191, -0.8003212, 0.6196079, 0, 1, 1,
0.8001544, 0.555913, 0.4817976, 0.627451, 0, 1, 1,
0.8068894, -0.005065534, 0.8351885, 0.6313726, 0, 1, 1,
0.8097286, 0.3519566, -0.4236884, 0.6392157, 0, 1, 1,
0.8177329, -0.07129902, 1.662126, 0.6431373, 0, 1, 1,
0.818223, 0.4315846, 2.45387, 0.6509804, 0, 1, 1,
0.8187578, -0.4886287, 2.383528, 0.654902, 0, 1, 1,
0.8209324, 0.84688, 0.5343773, 0.6627451, 0, 1, 1,
0.8248253, 1.270279, 0.6503444, 0.6666667, 0, 1, 1,
0.8287237, -1.131484, 1.871105, 0.6745098, 0, 1, 1,
0.829366, -2.15584, 2.321074, 0.6784314, 0, 1, 1,
0.8342046, -0.5541564, 2.608598, 0.6862745, 0, 1, 1,
0.8399398, 0.1252296, 1.51691, 0.6901961, 0, 1, 1,
0.8404868, 0.5957298, 1.370589, 0.6980392, 0, 1, 1,
0.8507002, 1.135047, -0.9377168, 0.7058824, 0, 1, 1,
0.8543627, -0.2074106, 1.037724, 0.7098039, 0, 1, 1,
0.8550387, -0.2547354, 3.73043, 0.7176471, 0, 1, 1,
0.8567056, 1.028825, 1.06608, 0.7215686, 0, 1, 1,
0.8646338, 0.3088576, 0.8375689, 0.7294118, 0, 1, 1,
0.8711699, 1.232124, -0.3052856, 0.7333333, 0, 1, 1,
0.8753322, 0.6964117, 0.4891821, 0.7411765, 0, 1, 1,
0.8861891, 0.9499601, 1.155866, 0.7450981, 0, 1, 1,
0.8911474, 0.076267, 2.316214, 0.7529412, 0, 1, 1,
0.8927563, -0.310306, 1.42955, 0.7568628, 0, 1, 1,
0.8967961, 0.5385426, 1.246884, 0.7647059, 0, 1, 1,
0.9014917, -1.792525, 0.6195384, 0.7686275, 0, 1, 1,
0.9084027, -0.7827553, 3.076388, 0.7764706, 0, 1, 1,
0.9109201, -0.4061616, 2.083014, 0.7803922, 0, 1, 1,
0.9132756, 0.1097873, 2.395238, 0.7882353, 0, 1, 1,
0.9279211, -0.0280265, 1.129698, 0.7921569, 0, 1, 1,
0.9333596, 1.972861, 0.9682059, 0.8, 0, 1, 1,
0.9371111, -0.8619702, 2.720007, 0.8078431, 0, 1, 1,
0.9417649, -0.1618223, 0.3843634, 0.8117647, 0, 1, 1,
0.9420359, -1.809812, 2.978491, 0.8196079, 0, 1, 1,
0.950648, 0.6272558, -0.1996458, 0.8235294, 0, 1, 1,
0.9507251, -2.13182, 2.327017, 0.8313726, 0, 1, 1,
0.9511917, 0.5605466, 1.744182, 0.8352941, 0, 1, 1,
0.9653932, 0.05467318, 1.375818, 0.8431373, 0, 1, 1,
0.9654917, -0.05549539, 1.282927, 0.8470588, 0, 1, 1,
0.9720233, 0.2833494, 1.735628, 0.854902, 0, 1, 1,
0.9724262, 1.152926, 1.020893, 0.8588235, 0, 1, 1,
0.9751236, 0.4745238, 1.048083, 0.8666667, 0, 1, 1,
0.9776882, 0.5686526, 0.5794118, 0.8705882, 0, 1, 1,
0.9792135, -0.5211317, 2.276158, 0.8784314, 0, 1, 1,
0.9798622, 0.01637835, 0.7404884, 0.8823529, 0, 1, 1,
0.9808758, 0.2414873, 0.6748998, 0.8901961, 0, 1, 1,
0.9833713, 0.9355525, 0.9667379, 0.8941177, 0, 1, 1,
0.9869528, -0.02743289, 3.669803, 0.9019608, 0, 1, 1,
1.002099, -0.07867104, 1.537678, 0.9098039, 0, 1, 1,
1.010468, 1.320375, 1.144252, 0.9137255, 0, 1, 1,
1.014244, 0.1933188, 0.4058514, 0.9215686, 0, 1, 1,
1.025454, 0.708962, 0.2721678, 0.9254902, 0, 1, 1,
1.026409, -0.4081392, 1.788925, 0.9333333, 0, 1, 1,
1.026672, -0.06484424, 1.631132, 0.9372549, 0, 1, 1,
1.027598, -0.4808177, 1.916366, 0.945098, 0, 1, 1,
1.028221, -0.8503332, 1.386372, 0.9490196, 0, 1, 1,
1.028995, 1.026609, 2.044309, 0.9568627, 0, 1, 1,
1.032853, -1.365202, 3.658217, 0.9607843, 0, 1, 1,
1.033546, 0.4797263, -0.8859912, 0.9686275, 0, 1, 1,
1.039964, 1.212047, 0.2342718, 0.972549, 0, 1, 1,
1.04496, -1.865807, 3.305698, 0.9803922, 0, 1, 1,
1.047611, 0.04047505, 1.116732, 0.9843137, 0, 1, 1,
1.053191, 2.010463, 0.5085897, 0.9921569, 0, 1, 1,
1.061449, -2.029409, 2.922701, 0.9960784, 0, 1, 1,
1.06353, -1.308094, 2.895355, 1, 0, 0.9960784, 1,
1.065657, -1.958877, 4.214261, 1, 0, 0.9882353, 1,
1.070773, -0.513925, 3.454886, 1, 0, 0.9843137, 1,
1.070801, -0.9800419, 2.715783, 1, 0, 0.9764706, 1,
1.071377, 1.604191, 1.564985, 1, 0, 0.972549, 1,
1.074341, 0.5539337, 0.3725286, 1, 0, 0.9647059, 1,
1.079779, -0.7622481, 1.337919, 1, 0, 0.9607843, 1,
1.088459, 0.08250034, 1.187013, 1, 0, 0.9529412, 1,
1.088504, 0.617487, 0.5848681, 1, 0, 0.9490196, 1,
1.093136, 1.755781, 0.1030122, 1, 0, 0.9411765, 1,
1.094694, 1.866111, 0.9372509, 1, 0, 0.9372549, 1,
1.099621, 2.732503, 0.3244244, 1, 0, 0.9294118, 1,
1.101041, -0.7701075, 2.105089, 1, 0, 0.9254902, 1,
1.107619, 0.4939419, 1.346327, 1, 0, 0.9176471, 1,
1.114497, 0.9286838, 2.610171, 1, 0, 0.9137255, 1,
1.124512, -0.1679934, 1.604312, 1, 0, 0.9058824, 1,
1.13051, -1.047923, 1.841635, 1, 0, 0.9019608, 1,
1.131373, -0.8920334, 2.211382, 1, 0, 0.8941177, 1,
1.135403, 0.1373138, 1.452058, 1, 0, 0.8862745, 1,
1.139369, -0.7274328, 2.407388, 1, 0, 0.8823529, 1,
1.143631, 1.258558, -0.3671928, 1, 0, 0.8745098, 1,
1.145798, -0.5211088, 1.835258, 1, 0, 0.8705882, 1,
1.147771, -0.1084665, 0.3424944, 1, 0, 0.8627451, 1,
1.150653, -0.5568167, 3.123603, 1, 0, 0.8588235, 1,
1.153653, -0.3665819, 2.490494, 1, 0, 0.8509804, 1,
1.153996, 0.2450508, 0.8130957, 1, 0, 0.8470588, 1,
1.170708, 0.4240095, -0.3847237, 1, 0, 0.8392157, 1,
1.177463, -0.4470762, 1.478115, 1, 0, 0.8352941, 1,
1.185135, 0.1813052, 0.08687404, 1, 0, 0.827451, 1,
1.185815, -1.308141, 1.766678, 1, 0, 0.8235294, 1,
1.18721, -0.05043742, 3.13565, 1, 0, 0.8156863, 1,
1.192508, 1.25135, 1.150785, 1, 0, 0.8117647, 1,
1.201224, -0.2689264, 2.218484, 1, 0, 0.8039216, 1,
1.202485, -0.1299084, 2.333972, 1, 0, 0.7960784, 1,
1.206624, -0.9780458, 3.642459, 1, 0, 0.7921569, 1,
1.207707, -0.03982791, 3.268776, 1, 0, 0.7843137, 1,
1.210179, -1.048618, 3.61934, 1, 0, 0.7803922, 1,
1.210585, -0.04189708, 0.5447729, 1, 0, 0.772549, 1,
1.212677, -0.320758, 1.988981, 1, 0, 0.7686275, 1,
1.22187, -0.5826533, 2.475205, 1, 0, 0.7607843, 1,
1.222478, -0.2680181, 2.806852, 1, 0, 0.7568628, 1,
1.227321, -2.040487, 0.09191122, 1, 0, 0.7490196, 1,
1.231957, -0.2313358, 0.5207177, 1, 0, 0.7450981, 1,
1.232767, -0.4684498, 4.347644, 1, 0, 0.7372549, 1,
1.233331, 0.6282598, 1.385873, 1, 0, 0.7333333, 1,
1.238494, 0.8806238, -0.3185548, 1, 0, 0.7254902, 1,
1.241252, 0.6155487, 0.9016378, 1, 0, 0.7215686, 1,
1.252927, 1.337176, 0.7736647, 1, 0, 0.7137255, 1,
1.255116, 0.6826022, 2.722883, 1, 0, 0.7098039, 1,
1.276211, -0.4686608, 3.572048, 1, 0, 0.7019608, 1,
1.279241, 2.582504, -0.01240761, 1, 0, 0.6941177, 1,
1.302386, -0.3546825, 2.07167, 1, 0, 0.6901961, 1,
1.305222, -0.9397779, 1.660714, 1, 0, 0.682353, 1,
1.306952, -1.258925, 1.964118, 1, 0, 0.6784314, 1,
1.317112, 2.509512, 0.5835759, 1, 0, 0.6705883, 1,
1.321717, 1.507606, 1.11831, 1, 0, 0.6666667, 1,
1.323507, -1.219365, 1.133095, 1, 0, 0.6588235, 1,
1.329249, 0.5379344, 1.826989, 1, 0, 0.654902, 1,
1.337969, 0.4909632, 1.528026, 1, 0, 0.6470588, 1,
1.356985, -1.356355, 1.288465, 1, 0, 0.6431373, 1,
1.363006, 1.939984, 0.1373657, 1, 0, 0.6352941, 1,
1.364789, -1.838794, 1.955097, 1, 0, 0.6313726, 1,
1.367149, 0.3996687, 0.1144972, 1, 0, 0.6235294, 1,
1.372633, 0.06031317, 1.704715, 1, 0, 0.6196079, 1,
1.373902, 2.84639, -1.163249, 1, 0, 0.6117647, 1,
1.381541, -1.478747, 1.206038, 1, 0, 0.6078432, 1,
1.38192, -1.65954, 2.871426, 1, 0, 0.6, 1,
1.382434, 1.234401, -0.4406799, 1, 0, 0.5921569, 1,
1.3856, 1.495574, -0.5405059, 1, 0, 0.5882353, 1,
1.393463, -1.359758, 0.9409788, 1, 0, 0.5803922, 1,
1.401536, 2.039412, 1.68628, 1, 0, 0.5764706, 1,
1.416006, -0.7377898, 3.669964, 1, 0, 0.5686275, 1,
1.416121, -0.3845199, 0.9217062, 1, 0, 0.5647059, 1,
1.417272, -0.5630697, 1.796247, 1, 0, 0.5568628, 1,
1.428882, -0.5852851, 2.931833, 1, 0, 0.5529412, 1,
1.430585, 0.5366216, 0.7429933, 1, 0, 0.5450981, 1,
1.447659, -0.8813302, 2.192634, 1, 0, 0.5411765, 1,
1.453099, 0.1170598, 1.652977, 1, 0, 0.5333334, 1,
1.45603, -0.6834176, 2.903118, 1, 0, 0.5294118, 1,
1.461598, -0.4557292, 1.484086, 1, 0, 0.5215687, 1,
1.464049, 1.412318, 0.001347466, 1, 0, 0.5176471, 1,
1.470233, -1.225736, 1.056966, 1, 0, 0.509804, 1,
1.481908, 0.5098359, 0.1914252, 1, 0, 0.5058824, 1,
1.490103, -0.6689785, 1.444443, 1, 0, 0.4980392, 1,
1.492868, 0.2952429, 1.329111, 1, 0, 0.4901961, 1,
1.497372, -0.7903893, 1.028778, 1, 0, 0.4862745, 1,
1.506288, 0.5587156, 2.427283, 1, 0, 0.4784314, 1,
1.523881, 0.1722074, 1.230963, 1, 0, 0.4745098, 1,
1.524508, -2.134661, 2.694861, 1, 0, 0.4666667, 1,
1.528798, 1.343261, 0.1880696, 1, 0, 0.4627451, 1,
1.532158, -0.2778572, 3.033565, 1, 0, 0.454902, 1,
1.535885, 0.2023585, 2.614437, 1, 0, 0.4509804, 1,
1.536491, -0.272097, 2.071083, 1, 0, 0.4431373, 1,
1.550769, 0.3458508, 1.940664, 1, 0, 0.4392157, 1,
1.555396, 0.2381803, 0.8258461, 1, 0, 0.4313726, 1,
1.556233, -0.136959, 2.68582, 1, 0, 0.427451, 1,
1.565113, -0.8144028, 2.907622, 1, 0, 0.4196078, 1,
1.572458, 0.6296636, 2.115825, 1, 0, 0.4156863, 1,
1.586577, -0.2163289, 1.907737, 1, 0, 0.4078431, 1,
1.591995, 0.7814541, 2.502969, 1, 0, 0.4039216, 1,
1.609204, 0.1000293, -0.3216587, 1, 0, 0.3960784, 1,
1.62293, 2.249299, 1.426813, 1, 0, 0.3882353, 1,
1.626337, -0.688525, 3.365754, 1, 0, 0.3843137, 1,
1.64137, 0.3490493, 1.366748, 1, 0, 0.3764706, 1,
1.64369, -0.8494537, 3.260526, 1, 0, 0.372549, 1,
1.651602, 0.3366162, 0.6601686, 1, 0, 0.3647059, 1,
1.658362, 1.185495, 3.673805, 1, 0, 0.3607843, 1,
1.659491, -0.2883046, 0.3621071, 1, 0, 0.3529412, 1,
1.685444, 0.855076, 0.48543, 1, 0, 0.3490196, 1,
1.704312, -0.7890447, 3.302808, 1, 0, 0.3411765, 1,
1.705474, 1.883776, 1.828121, 1, 0, 0.3372549, 1,
1.724074, 0.07046063, 0.7697808, 1, 0, 0.3294118, 1,
1.725485, 0.8611714, 1.848207, 1, 0, 0.3254902, 1,
1.735411, -0.5119425, 1.871648, 1, 0, 0.3176471, 1,
1.746682, 1.573302, 0.1634773, 1, 0, 0.3137255, 1,
1.749916, 0.831834, 1.828027, 1, 0, 0.3058824, 1,
1.752774, -0.4918606, 1.675558, 1, 0, 0.2980392, 1,
1.765301, -0.02316498, 3.206244, 1, 0, 0.2941177, 1,
1.788256, -1.421569, 1.346307, 1, 0, 0.2862745, 1,
1.794078, 1.154106, 1.087007, 1, 0, 0.282353, 1,
1.798752, -1.320456, 2.296999, 1, 0, 0.2745098, 1,
1.800326, 0.6930562, 2.032587, 1, 0, 0.2705882, 1,
1.806005, -0.3236052, 0.5062433, 1, 0, 0.2627451, 1,
1.810503, 0.3592008, 1.50502, 1, 0, 0.2588235, 1,
1.824227, -0.02858028, 1.810741, 1, 0, 0.2509804, 1,
1.842772, 0.5962664, -0.12519, 1, 0, 0.2470588, 1,
1.870697, -0.02495584, 0.08234501, 1, 0, 0.2392157, 1,
1.882151, 2.723988, 1.594088, 1, 0, 0.2352941, 1,
1.889614, 0.3226164, 1.5759, 1, 0, 0.227451, 1,
1.913324, 0.2292515, 3.348637, 1, 0, 0.2235294, 1,
1.920818, 2.346066, 0.6336654, 1, 0, 0.2156863, 1,
1.921747, 0.4237589, -0.4125861, 1, 0, 0.2117647, 1,
1.965785, 1.898185, -0.4484922, 1, 0, 0.2039216, 1,
1.984205, 0.4040854, 1.060973, 1, 0, 0.1960784, 1,
1.989338, -1.464916, 2.314371, 1, 0, 0.1921569, 1,
1.989526, -1.219611, 1.393746, 1, 0, 0.1843137, 1,
2.00416, -0.3835679, 2.145841, 1, 0, 0.1803922, 1,
2.006003, 1.077007, 0.3228394, 1, 0, 0.172549, 1,
2.016532, 0.5585839, 0.1701893, 1, 0, 0.1686275, 1,
2.027922, -0.6310212, 1.822028, 1, 0, 0.1607843, 1,
2.041388, 1.779875, -0.3444247, 1, 0, 0.1568628, 1,
2.046718, -0.4771388, 2.067468, 1, 0, 0.1490196, 1,
2.050267, 0.894586, -0.8452491, 1, 0, 0.145098, 1,
2.101608, 0.1123032, 1.649457, 1, 0, 0.1372549, 1,
2.110329, 1.529585, -0.3231463, 1, 0, 0.1333333, 1,
2.120162, -1.702169, 2.568172, 1, 0, 0.1254902, 1,
2.177825, -2.509856, 3.944237, 1, 0, 0.1215686, 1,
2.182464, 0.7708527, 3.100032, 1, 0, 0.1137255, 1,
2.245673, 0.2048399, 0.02142497, 1, 0, 0.1098039, 1,
2.279273, 0.7816232, 1.721824, 1, 0, 0.1019608, 1,
2.306012, -0.7964655, 2.91251, 1, 0, 0.09411765, 1,
2.338657, 2.092559, 0.233312, 1, 0, 0.09019608, 1,
2.362282, 0.7540733, 3.704578, 1, 0, 0.08235294, 1,
2.369739, 0.5337803, 3.049828, 1, 0, 0.07843138, 1,
2.457764, 1.631041, 0.9358963, 1, 0, 0.07058824, 1,
2.46281, 0.6874412, 3.674838, 1, 0, 0.06666667, 1,
2.509125, -1.293617, 1.747245, 1, 0, 0.05882353, 1,
2.527859, 2.532765, 0.905286, 1, 0, 0.05490196, 1,
2.550055, 0.4470713, 1.210785, 1, 0, 0.04705882, 1,
2.570879, 1.088721, 0.2770338, 1, 0, 0.04313726, 1,
2.599603, 2.116706, 1.808767, 1, 0, 0.03529412, 1,
2.805053, -0.9036781, 1.202359, 1, 0, 0.03137255, 1,
2.831456, -0.920145, 0.8917304, 1, 0, 0.02352941, 1,
2.912463, 1.281002, 1.120633, 1, 0, 0.01960784, 1,
3.232934, 1.480919, 1.026009, 1, 0, 0.01176471, 1,
3.372432, 1.215642, 2.278122, 1, 0, 0.007843138, 1
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
0.2165546, -4.04675, -7.533515, 0, -0.5, 0.5, 0.5,
0.2165546, -4.04675, -7.533515, 1, -0.5, 0.5, 0.5,
0.2165546, -4.04675, -7.533515, 1, 1.5, 0.5, 0.5,
0.2165546, -4.04675, -7.533515, 0, 1.5, 0.5, 0.5
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
-4.009165, -0.1006554, -7.533515, 0, -0.5, 0.5, 0.5,
-4.009165, -0.1006554, -7.533515, 1, -0.5, 0.5, 0.5,
-4.009165, -0.1006554, -7.533515, 1, 1.5, 0.5, 0.5,
-4.009165, -0.1006554, -7.533515, 0, 1.5, 0.5, 0.5
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
-4.009165, -4.04675, -0.5654609, 0, -0.5, 0.5, 0.5,
-4.009165, -4.04675, -0.5654609, 1, -0.5, 0.5, 0.5,
-4.009165, -4.04675, -0.5654609, 1, 1.5, 0.5, 0.5,
-4.009165, -4.04675, -0.5654609, 0, 1.5, 0.5, 0.5
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
-2, -3.136112, -5.925503,
3, -3.136112, -5.925503,
-2, -3.136112, -5.925503,
-2, -3.287885, -6.193505,
-1, -3.136112, -5.925503,
-1, -3.287885, -6.193505,
0, -3.136112, -5.925503,
0, -3.287885, -6.193505,
1, -3.136112, -5.925503,
1, -3.287885, -6.193505,
2, -3.136112, -5.925503,
2, -3.287885, -6.193505,
3, -3.136112, -5.925503,
3, -3.287885, -6.193505
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
-2, -3.591431, -6.729509, 0, -0.5, 0.5, 0.5,
-2, -3.591431, -6.729509, 1, -0.5, 0.5, 0.5,
-2, -3.591431, -6.729509, 1, 1.5, 0.5, 0.5,
-2, -3.591431, -6.729509, 0, 1.5, 0.5, 0.5,
-1, -3.591431, -6.729509, 0, -0.5, 0.5, 0.5,
-1, -3.591431, -6.729509, 1, -0.5, 0.5, 0.5,
-1, -3.591431, -6.729509, 1, 1.5, 0.5, 0.5,
-1, -3.591431, -6.729509, 0, 1.5, 0.5, 0.5,
0, -3.591431, -6.729509, 0, -0.5, 0.5, 0.5,
0, -3.591431, -6.729509, 1, -0.5, 0.5, 0.5,
0, -3.591431, -6.729509, 1, 1.5, 0.5, 0.5,
0, -3.591431, -6.729509, 0, 1.5, 0.5, 0.5,
1, -3.591431, -6.729509, 0, -0.5, 0.5, 0.5,
1, -3.591431, -6.729509, 1, -0.5, 0.5, 0.5,
1, -3.591431, -6.729509, 1, 1.5, 0.5, 0.5,
1, -3.591431, -6.729509, 0, 1.5, 0.5, 0.5,
2, -3.591431, -6.729509, 0, -0.5, 0.5, 0.5,
2, -3.591431, -6.729509, 1, -0.5, 0.5, 0.5,
2, -3.591431, -6.729509, 1, 1.5, 0.5, 0.5,
2, -3.591431, -6.729509, 0, 1.5, 0.5, 0.5,
3, -3.591431, -6.729509, 0, -0.5, 0.5, 0.5,
3, -3.591431, -6.729509, 1, -0.5, 0.5, 0.5,
3, -3.591431, -6.729509, 1, 1.5, 0.5, 0.5,
3, -3.591431, -6.729509, 0, 1.5, 0.5, 0.5
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
-3.033999, -3, -5.925503,
-3.033999, 2, -5.925503,
-3.033999, -3, -5.925503,
-3.196527, -3, -6.193505,
-3.033999, -2, -5.925503,
-3.196527, -2, -6.193505,
-3.033999, -1, -5.925503,
-3.196527, -1, -6.193505,
-3.033999, 0, -5.925503,
-3.196527, 0, -6.193505,
-3.033999, 1, -5.925503,
-3.196527, 1, -6.193505,
-3.033999, 2, -5.925503,
-3.196527, 2, -6.193505
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
-3.521582, -3, -6.729509, 0, -0.5, 0.5, 0.5,
-3.521582, -3, -6.729509, 1, -0.5, 0.5, 0.5,
-3.521582, -3, -6.729509, 1, 1.5, 0.5, 0.5,
-3.521582, -3, -6.729509, 0, 1.5, 0.5, 0.5,
-3.521582, -2, -6.729509, 0, -0.5, 0.5, 0.5,
-3.521582, -2, -6.729509, 1, -0.5, 0.5, 0.5,
-3.521582, -2, -6.729509, 1, 1.5, 0.5, 0.5,
-3.521582, -2, -6.729509, 0, 1.5, 0.5, 0.5,
-3.521582, -1, -6.729509, 0, -0.5, 0.5, 0.5,
-3.521582, -1, -6.729509, 1, -0.5, 0.5, 0.5,
-3.521582, -1, -6.729509, 1, 1.5, 0.5, 0.5,
-3.521582, -1, -6.729509, 0, 1.5, 0.5, 0.5,
-3.521582, 0, -6.729509, 0, -0.5, 0.5, 0.5,
-3.521582, 0, -6.729509, 1, -0.5, 0.5, 0.5,
-3.521582, 0, -6.729509, 1, 1.5, 0.5, 0.5,
-3.521582, 0, -6.729509, 0, 1.5, 0.5, 0.5,
-3.521582, 1, -6.729509, 0, -0.5, 0.5, 0.5,
-3.521582, 1, -6.729509, 1, -0.5, 0.5, 0.5,
-3.521582, 1, -6.729509, 1, 1.5, 0.5, 0.5,
-3.521582, 1, -6.729509, 0, 1.5, 0.5, 0.5,
-3.521582, 2, -6.729509, 0, -0.5, 0.5, 0.5,
-3.521582, 2, -6.729509, 1, -0.5, 0.5, 0.5,
-3.521582, 2, -6.729509, 1, 1.5, 0.5, 0.5,
-3.521582, 2, -6.729509, 0, 1.5, 0.5, 0.5
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
-3.033999, -3.136112, -4,
-3.033999, -3.136112, 4,
-3.033999, -3.136112, -4,
-3.196527, -3.287885, -4,
-3.033999, -3.136112, -2,
-3.196527, -3.287885, -2,
-3.033999, -3.136112, 0,
-3.196527, -3.287885, 0,
-3.033999, -3.136112, 2,
-3.196527, -3.287885, 2,
-3.033999, -3.136112, 4,
-3.196527, -3.287885, 4
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
-3.521582, -3.591431, -4, 0, -0.5, 0.5, 0.5,
-3.521582, -3.591431, -4, 1, -0.5, 0.5, 0.5,
-3.521582, -3.591431, -4, 1, 1.5, 0.5, 0.5,
-3.521582, -3.591431, -4, 0, 1.5, 0.5, 0.5,
-3.521582, -3.591431, -2, 0, -0.5, 0.5, 0.5,
-3.521582, -3.591431, -2, 1, -0.5, 0.5, 0.5,
-3.521582, -3.591431, -2, 1, 1.5, 0.5, 0.5,
-3.521582, -3.591431, -2, 0, 1.5, 0.5, 0.5,
-3.521582, -3.591431, 0, 0, -0.5, 0.5, 0.5,
-3.521582, -3.591431, 0, 1, -0.5, 0.5, 0.5,
-3.521582, -3.591431, 0, 1, 1.5, 0.5, 0.5,
-3.521582, -3.591431, 0, 0, 1.5, 0.5, 0.5,
-3.521582, -3.591431, 2, 0, -0.5, 0.5, 0.5,
-3.521582, -3.591431, 2, 1, -0.5, 0.5, 0.5,
-3.521582, -3.591431, 2, 1, 1.5, 0.5, 0.5,
-3.521582, -3.591431, 2, 0, 1.5, 0.5, 0.5,
-3.521582, -3.591431, 4, 0, -0.5, 0.5, 0.5,
-3.521582, -3.591431, 4, 1, -0.5, 0.5, 0.5,
-3.521582, -3.591431, 4, 1, 1.5, 0.5, 0.5,
-3.521582, -3.591431, 4, 0, 1.5, 0.5, 0.5
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
-3.033999, -3.136112, -5.925503,
-3.033999, 2.934802, -5.925503,
-3.033999, -3.136112, 4.794581,
-3.033999, 2.934802, 4.794581,
-3.033999, -3.136112, -5.925503,
-3.033999, -3.136112, 4.794581,
-3.033999, 2.934802, -5.925503,
-3.033999, 2.934802, 4.794581,
-3.033999, -3.136112, -5.925503,
3.467108, -3.136112, -5.925503,
-3.033999, -3.136112, 4.794581,
3.467108, -3.136112, 4.794581,
-3.033999, 2.934802, -5.925503,
3.467108, 2.934802, -5.925503,
-3.033999, 2.934802, 4.794581,
3.467108, 2.934802, 4.794581,
3.467108, -3.136112, -5.925503,
3.467108, 2.934802, -5.925503,
3.467108, -3.136112, 4.794581,
3.467108, 2.934802, 4.794581,
3.467108, -3.136112, -5.925503,
3.467108, -3.136112, 4.794581,
3.467108, 2.934802, -5.925503,
3.467108, 2.934802, 4.794581
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
var radius = 7.438267;
var distance = 33.09369;
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
mvMatrix.translate( -0.2165546, 0.1006554, 0.5654609 );
mvMatrix.scale( 1.237082, 1.324743, 0.750218 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.09369);
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
sodium_dimethyldithi<-read.table("sodium_dimethyldithi.xyz")
```

```
## Error in read.table("sodium_dimethyldithi.xyz"): no lines available in input
```

```r
x<-sodium_dimethyldithi$V2
```

```
## Error in eval(expr, envir, enclos): object 'sodium_dimethyldithi' not found
```

```r
y<-sodium_dimethyldithi$V3
```

```
## Error in eval(expr, envir, enclos): object 'sodium_dimethyldithi' not found
```

```r
z<-sodium_dimethyldithi$V4
```

```
## Error in eval(expr, envir, enclos): object 'sodium_dimethyldithi' not found
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
-2.939322, -0.7433423, -2.13523, 0, 0, 1, 1, 1,
-2.741762, 1.585652, -1.34225, 1, 0, 0, 1, 1,
-2.534786, -0.1499288, -0.5988801, 1, 0, 0, 1, 1,
-2.506249, 2.241457, -0.5006714, 1, 0, 0, 1, 1,
-2.504383, 1.727362, -1.127389, 1, 0, 0, 1, 1,
-2.399588, 0.5279635, -1.675321, 1, 0, 0, 1, 1,
-2.363207, 0.6009261, -0.4341185, 0, 0, 0, 1, 1,
-2.240615, -1.213101, -3.021425, 0, 0, 0, 1, 1,
-2.191545, 0.4708583, -2.710613, 0, 0, 0, 1, 1,
-2.176395, -1.247146, -1.60541, 0, 0, 0, 1, 1,
-2.148633, 0.9851411, -1.954103, 0, 0, 0, 1, 1,
-2.120243, 0.475364, -0.417241, 0, 0, 0, 1, 1,
-2.119878, 0.4412275, -1.689901, 0, 0, 0, 1, 1,
-2.049805, 0.1954823, -2.25831, 1, 1, 1, 1, 1,
-2.012987, 0.9316311, -0.7336977, 1, 1, 1, 1, 1,
-2.011043, -1.281786, -1.907211, 1, 1, 1, 1, 1,
-1.997239, 0.2827316, -1.938662, 1, 1, 1, 1, 1,
-1.984694, -0.1211748, -0.3466211, 1, 1, 1, 1, 1,
-1.980442, 0.888217, -0.9698125, 1, 1, 1, 1, 1,
-1.97847, 0.04187724, -1.666941, 1, 1, 1, 1, 1,
-1.963331, -0.7394916, -2.435568, 1, 1, 1, 1, 1,
-1.948005, -0.5814406, -1.341086, 1, 1, 1, 1, 1,
-1.933656, 0.07810209, -3.001769, 1, 1, 1, 1, 1,
-1.901541, 1.470951, 0.3604116, 1, 1, 1, 1, 1,
-1.865469, -1.130316, -1.962676, 1, 1, 1, 1, 1,
-1.842062, 1.212374, -1.909124, 1, 1, 1, 1, 1,
-1.841078, -0.9682661, -3.426886, 1, 1, 1, 1, 1,
-1.839809, 0.5898474, -1.620066, 1, 1, 1, 1, 1,
-1.833368, 0.2846842, -0.9819454, 0, 0, 1, 1, 1,
-1.805909, 0.8579234, -0.6863128, 1, 0, 0, 1, 1,
-1.802072, 0.2940687, -1.316235, 1, 0, 0, 1, 1,
-1.799238, -0.1748098, -2.411786, 1, 0, 0, 1, 1,
-1.79373, 0.4953478, -2.201399, 1, 0, 0, 1, 1,
-1.785296, -0.5818496, -0.3125601, 1, 0, 0, 1, 1,
-1.762394, -0.2706217, -1.565779, 0, 0, 0, 1, 1,
-1.742377, -0.2193888, -1.847481, 0, 0, 0, 1, 1,
-1.729929, -0.7035677, -5.172315, 0, 0, 0, 1, 1,
-1.712692, 2.167374, -2.64269, 0, 0, 0, 1, 1,
-1.710446, -0.4470282, -0.1779415, 0, 0, 0, 1, 1,
-1.70202, -0.8211861, 0.04557926, 0, 0, 0, 1, 1,
-1.699949, 0.327216, -1.008196, 0, 0, 0, 1, 1,
-1.692721, -1.654112, -2.447826, 1, 1, 1, 1, 1,
-1.685743, -0.687216, -2.34822, 1, 1, 1, 1, 1,
-1.682641, -1.110345, -3.427882, 1, 1, 1, 1, 1,
-1.650884, 0.08402674, -1.692455, 1, 1, 1, 1, 1,
-1.647998, -0.4612156, -3.224888, 1, 1, 1, 1, 1,
-1.617575, 0.6424329, -0.8183914, 1, 1, 1, 1, 1,
-1.615685, -1.481711, -3.306319, 1, 1, 1, 1, 1,
-1.609933, -1.752493, -3.394613, 1, 1, 1, 1, 1,
-1.602481, -0.04805411, -1.765447, 1, 1, 1, 1, 1,
-1.602379, -0.07086039, -2.113519, 1, 1, 1, 1, 1,
-1.593552, -0.1199183, -1.778222, 1, 1, 1, 1, 1,
-1.565478, -1.922082, -2.794787, 1, 1, 1, 1, 1,
-1.554783, 0.3439872, -1.264032, 1, 1, 1, 1, 1,
-1.548984, 2.599, -3.258367, 1, 1, 1, 1, 1,
-1.546727, 2.002051, -0.5024068, 1, 1, 1, 1, 1,
-1.53794, 0.4991305, -0.02311557, 0, 0, 1, 1, 1,
-1.525026, 0.1067971, -0.2009104, 1, 0, 0, 1, 1,
-1.524428, 1.436299, -0.3838954, 1, 0, 0, 1, 1,
-1.520186, 0.4175687, 0.6332656, 1, 0, 0, 1, 1,
-1.519594, -0.03394469, -1.137366, 1, 0, 0, 1, 1,
-1.518956, -0.1094025, -2.005639, 1, 0, 0, 1, 1,
-1.512074, -0.2299319, -1.891557, 0, 0, 0, 1, 1,
-1.508115, 0.6521531, -1.643418, 0, 0, 0, 1, 1,
-1.507863, -2.026258, -1.356956, 0, 0, 0, 1, 1,
-1.498383, -1.23888, -2.357405, 0, 0, 0, 1, 1,
-1.497567, 0.04713408, -1.9056, 0, 0, 0, 1, 1,
-1.494807, 1.019039, 1.131177, 0, 0, 0, 1, 1,
-1.490794, -0.850391, -1.124527, 0, 0, 0, 1, 1,
-1.468448, 1.487332, -1.317339, 1, 1, 1, 1, 1,
-1.467168, 0.2585479, -0.273281, 1, 1, 1, 1, 1,
-1.465742, 1.290225, -0.1052855, 1, 1, 1, 1, 1,
-1.462645, -0.1128875, -2.00007, 1, 1, 1, 1, 1,
-1.457625, 1.559038, -0.01666786, 1, 1, 1, 1, 1,
-1.455466, 0.3148157, 0.4080706, 1, 1, 1, 1, 1,
-1.451567, -0.6967298, -1.676714, 1, 1, 1, 1, 1,
-1.450244, -1.689458, -3.082727, 1, 1, 1, 1, 1,
-1.443153, 0.3794289, -0.7197335, 1, 1, 1, 1, 1,
-1.427129, 0.7213977, -0.2532077, 1, 1, 1, 1, 1,
-1.425406, -0.7389367, -1.247594, 1, 1, 1, 1, 1,
-1.417266, -2.04079, -2.206698, 1, 1, 1, 1, 1,
-1.406773, -0.4023938, -2.365001, 1, 1, 1, 1, 1,
-1.389593, -1.862456, -2.148393, 1, 1, 1, 1, 1,
-1.388175, 1.195924, -1.97755, 1, 1, 1, 1, 1,
-1.387948, -0.7554745, -2.829272, 0, 0, 1, 1, 1,
-1.381215, 1.540415, 0.3305274, 1, 0, 0, 1, 1,
-1.373634, 0.903427, 0.4147371, 1, 0, 0, 1, 1,
-1.363082, 0.5653352, -2.094422, 1, 0, 0, 1, 1,
-1.354127, -1.283196, -2.736847, 1, 0, 0, 1, 1,
-1.340129, 0.3074379, -1.404954, 1, 0, 0, 1, 1,
-1.334695, 0.5184389, -1.093441, 0, 0, 0, 1, 1,
-1.331299, -1.633567, -2.037605, 0, 0, 0, 1, 1,
-1.328438, 1.101989, -1.568029, 0, 0, 0, 1, 1,
-1.327762, 0.8478068, -3.386421, 0, 0, 0, 1, 1,
-1.321231, 0.965704, -0.6665306, 0, 0, 0, 1, 1,
-1.309438, 0.4638141, -1.69757, 0, 0, 0, 1, 1,
-1.298894, 0.3661843, -1.342641, 0, 0, 0, 1, 1,
-1.293257, -1.868235, -2.369949, 1, 1, 1, 1, 1,
-1.288891, -0.2369273, -1.321976, 1, 1, 1, 1, 1,
-1.286048, -2.133355, -1.890123, 1, 1, 1, 1, 1,
-1.285697, 2.322768, 0.1606144, 1, 1, 1, 1, 1,
-1.284485, -0.4153484, 0.03587172, 1, 1, 1, 1, 1,
-1.283988, -1.309389, -3.892617, 1, 1, 1, 1, 1,
-1.282096, 0.1790155, -1.508901, 1, 1, 1, 1, 1,
-1.280932, -0.9002823, -3.252617, 1, 1, 1, 1, 1,
-1.280343, 0.3719372, -1.859618, 1, 1, 1, 1, 1,
-1.267775, 0.3359865, 1.029287, 1, 1, 1, 1, 1,
-1.253115, 0.8574365, 0.01794422, 1, 1, 1, 1, 1,
-1.252215, -0.3895993, -0.1498293, 1, 1, 1, 1, 1,
-1.249069, -1.280752, -3.209713, 1, 1, 1, 1, 1,
-1.24601, -0.9922928, -5.769385, 1, 1, 1, 1, 1,
-1.235149, -0.5566762, -1.880804, 1, 1, 1, 1, 1,
-1.225641, 0.9386862, -0.4630535, 0, 0, 1, 1, 1,
-1.222376, -0.1092553, -0.4447531, 1, 0, 0, 1, 1,
-1.220128, 1.046309, -1.095081, 1, 0, 0, 1, 1,
-1.219595, -0.4933357, -1.600722, 1, 0, 0, 1, 1,
-1.218622, -1.259016, -2.604264, 1, 0, 0, 1, 1,
-1.215943, 0.5804886, -2.5925, 1, 0, 0, 1, 1,
-1.214758, -0.1623061, -0.9136425, 0, 0, 0, 1, 1,
-1.209879, 0.4023077, 0.1959776, 0, 0, 0, 1, 1,
-1.206302, -0.4613366, -2.374475, 0, 0, 0, 1, 1,
-1.203436, -1.784114, -1.79593, 0, 0, 0, 1, 1,
-1.196153, -0.3859521, -2.784101, 0, 0, 0, 1, 1,
-1.193505, -2.507596, -3.093599, 0, 0, 0, 1, 1,
-1.190716, -1.529163, -0.05452039, 0, 0, 0, 1, 1,
-1.180899, -1.491249, -2.593505, 1, 1, 1, 1, 1,
-1.174045, 1.013624, -2.258704, 1, 1, 1, 1, 1,
-1.173033, -0.4540506, -0.4699328, 1, 1, 1, 1, 1,
-1.166908, -1.672865, -2.478836, 1, 1, 1, 1, 1,
-1.165309, 0.3653719, -1.412656, 1, 1, 1, 1, 1,
-1.163545, 0.1540354, -2.063345, 1, 1, 1, 1, 1,
-1.158736, -0.4892767, -3.59726, 1, 1, 1, 1, 1,
-1.136192, -1.248654, -2.592845, 1, 1, 1, 1, 1,
-1.134677, -2.411531, -1.422263, 1, 1, 1, 1, 1,
-1.131473, 1.594393, 0.3520124, 1, 1, 1, 1, 1,
-1.126898, 0.3570966, -1.225962, 1, 1, 1, 1, 1,
-1.11623, -0.9201212, -4.370393, 1, 1, 1, 1, 1,
-1.104377, 0.855923, -2.608158, 1, 1, 1, 1, 1,
-1.103154, -0.3927313, -0.8141931, 1, 1, 1, 1, 1,
-1.100541, 1.374582, -0.7360653, 1, 1, 1, 1, 1,
-1.095837, 0.9984884, 0.3696015, 0, 0, 1, 1, 1,
-1.092844, -1.493337, -1.871607, 1, 0, 0, 1, 1,
-1.091311, -0.6488868, -0.8263013, 1, 0, 0, 1, 1,
-1.087398, 1.452548, 0.4538614, 1, 0, 0, 1, 1,
-1.085627, -0.4620516, -2.546256, 1, 0, 0, 1, 1,
-1.06979, -0.3948205, -1.113485, 1, 0, 0, 1, 1,
-1.069441, -0.5298649, -1.300884, 0, 0, 0, 1, 1,
-1.068324, -1.481933, -3.06514, 0, 0, 0, 1, 1,
-1.057006, 0.2082187, -0.991595, 0, 0, 0, 1, 1,
-1.055193, 0.1575415, -0.05176339, 0, 0, 0, 1, 1,
-1.046008, -1.378446, -1.307038, 0, 0, 0, 1, 1,
-1.036541, 0.361487, -0.2221352, 0, 0, 0, 1, 1,
-1.035681, 0.06264918, -0.6154491, 0, 0, 0, 1, 1,
-1.033976, 0.4054522, -0.4367306, 1, 1, 1, 1, 1,
-1.022027, 0.4391633, -2.021945, 1, 1, 1, 1, 1,
-1.021822, 0.05581421, -2.219854, 1, 1, 1, 1, 1,
-1.021623, -0.1486723, -2.265729, 1, 1, 1, 1, 1,
-1.021345, -1.759249, -1.349385, 1, 1, 1, 1, 1,
-1.008726, -1.128221, -2.533366, 1, 1, 1, 1, 1,
-1.004586, 0.6194085, -0.5332755, 1, 1, 1, 1, 1,
-0.9988739, -0.246657, -1.555646, 1, 1, 1, 1, 1,
-0.9954024, -0.1732951, 0.1187107, 1, 1, 1, 1, 1,
-0.9915308, -0.6872242, -0.3074451, 1, 1, 1, 1, 1,
-0.9887903, -1.638187, -2.407483, 1, 1, 1, 1, 1,
-0.9839289, -0.460435, -4.698125, 1, 1, 1, 1, 1,
-0.9788851, -0.901491, -2.134349, 1, 1, 1, 1, 1,
-0.9655281, 1.415615, -1.105583, 1, 1, 1, 1, 1,
-0.9583039, 0.9989218, 1.112081, 1, 1, 1, 1, 1,
-0.9490619, 0.2699252, 0.5078672, 0, 0, 1, 1, 1,
-0.9428678, -0.7931882, -2.580497, 1, 0, 0, 1, 1,
-0.930145, 0.1827879, -1.790727, 1, 0, 0, 1, 1,
-0.926446, 0.4345599, -1.409908, 1, 0, 0, 1, 1,
-0.9248571, -1.026769, -5.330776, 1, 0, 0, 1, 1,
-0.9216819, -0.1967956, -0.8955046, 1, 0, 0, 1, 1,
-0.917104, -1.942802, -2.101674, 0, 0, 0, 1, 1,
-0.9148022, -0.9646478, -0.1825463, 0, 0, 0, 1, 1,
-0.9088772, 0.2614159, -2.919211, 0, 0, 0, 1, 1,
-0.8987473, 1.585889, -1.288866, 0, 0, 0, 1, 1,
-0.8981955, 0.3796952, -1.562127, 0, 0, 0, 1, 1,
-0.885433, -0.542773, -2.878522, 0, 0, 0, 1, 1,
-0.8736078, -1.046133, -1.713797, 0, 0, 0, 1, 1,
-0.8713838, -0.4328303, -1.953085, 1, 1, 1, 1, 1,
-0.8677118, -1.203709, -1.115685, 1, 1, 1, 1, 1,
-0.8645117, 1.004726, -0.6138388, 1, 1, 1, 1, 1,
-0.8617458, -0.24083, -1.707, 1, 1, 1, 1, 1,
-0.8576326, -0.003272579, -0.2928623, 1, 1, 1, 1, 1,
-0.8449119, 2.07815, -1.62126, 1, 1, 1, 1, 1,
-0.8430296, 0.2618992, -1.071353, 1, 1, 1, 1, 1,
-0.8430172, 0.4878055, -1.663146, 1, 1, 1, 1, 1,
-0.8330103, -0.434487, -1.322009, 1, 1, 1, 1, 1,
-0.8315046, 0.4289868, -1.563363, 1, 1, 1, 1, 1,
-0.8296563, 0.7264063, 0.6528845, 1, 1, 1, 1, 1,
-0.8288206, -0.7509091, -1.622274, 1, 1, 1, 1, 1,
-0.8272256, 1.500932, -2.141651, 1, 1, 1, 1, 1,
-0.8267519, 0.8897685, 1.389753, 1, 1, 1, 1, 1,
-0.8266208, -1.779887, -2.776862, 1, 1, 1, 1, 1,
-0.8165927, 0.04109794, -0.06214524, 0, 0, 1, 1, 1,
-0.812143, 1.660115, -2.17197, 1, 0, 0, 1, 1,
-0.8052254, 0.6414981, 0.638743, 1, 0, 0, 1, 1,
-0.8030633, -0.6645097, -2.093494, 1, 0, 0, 1, 1,
-0.7986166, -0.159033, -2.54171, 1, 0, 0, 1, 1,
-0.7971201, 0.9917836, -0.2908814, 1, 0, 0, 1, 1,
-0.7950258, -0.4011795, -1.04518, 0, 0, 0, 1, 1,
-0.7917742, 1.239551, -1.734318, 0, 0, 0, 1, 1,
-0.7909369, -1.511587, -3.566825, 0, 0, 0, 1, 1,
-0.7830601, 0.04939706, -1.951622, 0, 0, 0, 1, 1,
-0.7796752, -1.377948, -3.071483, 0, 0, 0, 1, 1,
-0.7664037, 0.577459, -1.292917, 0, 0, 0, 1, 1,
-0.7659364, 0.5999029, -1.710948, 0, 0, 0, 1, 1,
-0.7613996, 0.0366911, -0.5934796, 1, 1, 1, 1, 1,
-0.7542427, 1.449347, -0.3448833, 1, 1, 1, 1, 1,
-0.741842, 1.028053, -0.444765, 1, 1, 1, 1, 1,
-0.7408151, -1.094606, -3.604681, 1, 1, 1, 1, 1,
-0.7390626, -0.02155896, -3.162185, 1, 1, 1, 1, 1,
-0.7377877, 0.9402136, 0.7375393, 1, 1, 1, 1, 1,
-0.7373127, 0.01717162, -0.428894, 1, 1, 1, 1, 1,
-0.7327529, -0.7951944, -2.227615, 1, 1, 1, 1, 1,
-0.7327221, 0.150489, -1.63989, 1, 1, 1, 1, 1,
-0.7305542, -0.7608475, -2.37352, 1, 1, 1, 1, 1,
-0.7288399, 0.7188048, -0.2635061, 1, 1, 1, 1, 1,
-0.7278558, -0.1329514, -0.09858093, 1, 1, 1, 1, 1,
-0.7250201, 0.6310471, -1.246089, 1, 1, 1, 1, 1,
-0.7249732, -0.310738, -1.71829, 1, 1, 1, 1, 1,
-0.7243457, -0.839796, -2.386634, 1, 1, 1, 1, 1,
-0.7235606, -0.4233766, -3.921975, 0, 0, 1, 1, 1,
-0.7172122, -1.289911, -4.388458, 1, 0, 0, 1, 1,
-0.7155358, 0.9409201, -0.8926775, 1, 0, 0, 1, 1,
-0.7101576, -1.568498, -2.28545, 1, 0, 0, 1, 1,
-0.702315, 1.085883, -2.074292, 1, 0, 0, 1, 1,
-0.6944644, 0.6593531, -3.301927, 1, 0, 0, 1, 1,
-0.6904952, -0.3338917, -4.33776, 0, 0, 0, 1, 1,
-0.6885831, -0.5709344, -3.395114, 0, 0, 0, 1, 1,
-0.6879029, -0.3027168, -2.103776, 0, 0, 0, 1, 1,
-0.6837903, -0.6614556, -0.6037705, 0, 0, 0, 1, 1,
-0.6809478, 0.3803393, -0.7956119, 0, 0, 0, 1, 1,
-0.6806546, -0.7152652, -2.181784, 0, 0, 0, 1, 1,
-0.6806317, 0.1373291, -0.9703674, 0, 0, 0, 1, 1,
-0.6804828, 1.246056, 0.2969464, 1, 1, 1, 1, 1,
-0.6792895, 0.6944073, -0.894144, 1, 1, 1, 1, 1,
-0.6769385, -1.559721, -2.479694, 1, 1, 1, 1, 1,
-0.6765565, 0.2544557, -1.548056, 1, 1, 1, 1, 1,
-0.6757055, 0.8575259, -1.323184, 1, 1, 1, 1, 1,
-0.6725712, -1.949055, -1.623047, 1, 1, 1, 1, 1,
-0.6703449, 2.027848, 3.105598, 1, 1, 1, 1, 1,
-0.6677547, -1.996027, -1.445484, 1, 1, 1, 1, 1,
-0.6676994, 0.6677612, 1.023322, 1, 1, 1, 1, 1,
-0.662097, 1.972619, 0.5633251, 1, 1, 1, 1, 1,
-0.6582069, -1.527494, -3.603417, 1, 1, 1, 1, 1,
-0.6554627, 1.046114, -1.131279, 1, 1, 1, 1, 1,
-0.6341484, -0.5840898, -4.01219, 1, 1, 1, 1, 1,
-0.6309437, 0.107944, -2.329178, 1, 1, 1, 1, 1,
-0.6302184, -0.9828588, -1.807115, 1, 1, 1, 1, 1,
-0.6244721, 0.1156983, -2.255754, 0, 0, 1, 1, 1,
-0.6137366, -2.353582, -3.146371, 1, 0, 0, 1, 1,
-0.613559, 0.9738575, -0.6850213, 1, 0, 0, 1, 1,
-0.6128256, -0.2334832, -1.579555, 1, 0, 0, 1, 1,
-0.6125749, 1.155285, 1.034943, 1, 0, 0, 1, 1,
-0.6098081, 0.7733659, -1.26243, 1, 0, 0, 1, 1,
-0.6068704, 1.26099, -1.824049, 0, 0, 0, 1, 1,
-0.6047357, -1.040001, -3.563979, 0, 0, 0, 1, 1,
-0.5987322, 0.3146544, -2.564891, 0, 0, 0, 1, 1,
-0.5942424, -0.2795752, -0.8239487, 0, 0, 0, 1, 1,
-0.5937719, 0.1781763, -0.322377, 0, 0, 0, 1, 1,
-0.5930336, 1.305439, -1.42342, 0, 0, 0, 1, 1,
-0.5916182, -0.3488307, -2.184461, 0, 0, 0, 1, 1,
-0.5896394, -0.07279285, -0.3439815, 1, 1, 1, 1, 1,
-0.5807307, -1.145303, -3.968856, 1, 1, 1, 1, 1,
-0.5803974, 1.1749, -0.7866485, 1, 1, 1, 1, 1,
-0.5758187, 2.056075, 1.1419, 1, 1, 1, 1, 1,
-0.5649947, 0.4539117, -0.1423499, 1, 1, 1, 1, 1,
-0.5624065, 2.58072, -0.04588726, 1, 1, 1, 1, 1,
-0.559681, -0.5006225, -2.969616, 1, 1, 1, 1, 1,
-0.5568706, -0.1767022, -2.544473, 1, 1, 1, 1, 1,
-0.5543226, -0.3522857, -1.822928, 1, 1, 1, 1, 1,
-0.5509742, -1.453978, -2.864033, 1, 1, 1, 1, 1,
-0.5502017, -0.3740022, -1.4938, 1, 1, 1, 1, 1,
-0.5483798, 0.9829975, 0.5194736, 1, 1, 1, 1, 1,
-0.540414, -0.8828979, -3.620187, 1, 1, 1, 1, 1,
-0.5362241, -1.588206, -4.557015, 1, 1, 1, 1, 1,
-0.5355427, -0.457608, -1.591592, 1, 1, 1, 1, 1,
-0.5337634, 0.346541, -0.3388779, 0, 0, 1, 1, 1,
-0.5335181, -1.198882, -3.481976, 1, 0, 0, 1, 1,
-0.5332589, -0.721507, -3.629956, 1, 0, 0, 1, 1,
-0.5286586, -0.8045186, -3.742743, 1, 0, 0, 1, 1,
-0.5240985, 0.8478064, -1.42526, 1, 0, 0, 1, 1,
-0.5226046, -1.131401, -1.383306, 1, 0, 0, 1, 1,
-0.5172029, -1.4778, -2.221396, 0, 0, 0, 1, 1,
-0.5151595, 1.081591, 1.226506, 0, 0, 0, 1, 1,
-0.5132067, -1.758854, -2.82067, 0, 0, 0, 1, 1,
-0.5131053, -0.8697746, -1.751534, 0, 0, 0, 1, 1,
-0.5078741, 2.60832, -0.9825459, 0, 0, 0, 1, 1,
-0.4982328, -2.16778, -2.211412, 0, 0, 0, 1, 1,
-0.4975086, -1.213847, -1.098398, 0, 0, 0, 1, 1,
-0.4973356, -1.195817, -1.457084, 1, 1, 1, 1, 1,
-0.495481, -0.2020279, -1.566197, 1, 1, 1, 1, 1,
-0.4928962, -0.1412747, -2.210436, 1, 1, 1, 1, 1,
-0.4889123, 0.2518093, -0.4322699, 1, 1, 1, 1, 1,
-0.4834939, 0.4711497, -0.2974716, 1, 1, 1, 1, 1,
-0.480981, -0.1246561, -1.356395, 1, 1, 1, 1, 1,
-0.4760422, -1.044685, -1.567033, 1, 1, 1, 1, 1,
-0.4751871, -0.2256294, -3.766932, 1, 1, 1, 1, 1,
-0.4750673, -1.829858, -4.11131, 1, 1, 1, 1, 1,
-0.4710109, -1.506843, -3.461492, 1, 1, 1, 1, 1,
-0.4683393, 0.7821052, -0.2128774, 1, 1, 1, 1, 1,
-0.4683191, -2.167712, -3.226035, 1, 1, 1, 1, 1,
-0.4674192, 1.489952, -0.3066019, 1, 1, 1, 1, 1,
-0.4645819, -0.451606, -1.277847, 1, 1, 1, 1, 1,
-0.4509427, -0.2775179, -1.636555, 1, 1, 1, 1, 1,
-0.4469683, 0.1418374, -1.604444, 0, 0, 1, 1, 1,
-0.444532, -0.7476479, -2.505636, 1, 0, 0, 1, 1,
-0.4412306, -2.377336, -2.172235, 1, 0, 0, 1, 1,
-0.4408685, 0.8185866, 0.04643612, 1, 0, 0, 1, 1,
-0.4383344, -0.929081, -3.260313, 1, 0, 0, 1, 1,
-0.4368061, 0.5708184, 0.6848348, 1, 0, 0, 1, 1,
-0.4332072, -1.63037, -1.699889, 0, 0, 0, 1, 1,
-0.4321085, 0.3852842, 0.2231047, 0, 0, 0, 1, 1,
-0.4315545, 0.425867, -2.887422, 0, 0, 0, 1, 1,
-0.4310877, 0.5838519, -1.724558, 0, 0, 0, 1, 1,
-0.4308177, -0.34784, -1.087716, 0, 0, 0, 1, 1,
-0.4289177, -0.625645, -3.008301, 0, 0, 0, 1, 1,
-0.4259696, -0.379767, -1.811541, 0, 0, 0, 1, 1,
-0.4234711, -0.6033714, -1.571044, 1, 1, 1, 1, 1,
-0.4234357, 2.467539, 0.6891679, 1, 1, 1, 1, 1,
-0.4204186, -0.5402812, -3.230053, 1, 1, 1, 1, 1,
-0.4195403, 1.084441, -0.1339662, 1, 1, 1, 1, 1,
-0.4176609, -1.369642, -3.403358, 1, 1, 1, 1, 1,
-0.4152222, -1.197538, -3.712942, 1, 1, 1, 1, 1,
-0.410664, -2.321905, -1.94711, 1, 1, 1, 1, 1,
-0.410559, -0.2477918, -2.933216, 1, 1, 1, 1, 1,
-0.4094737, 0.8250852, -1.711852, 1, 1, 1, 1, 1,
-0.4090722, 0.03781087, -1.241546, 1, 1, 1, 1, 1,
-0.4085531, -2.538753, -2.874759, 1, 1, 1, 1, 1,
-0.40402, -0.5236078, -0.9588138, 1, 1, 1, 1, 1,
-0.4024956, 1.625702, -0.7683098, 1, 1, 1, 1, 1,
-0.4012832, -1.694027, -0.9495834, 1, 1, 1, 1, 1,
-0.3966069, -0.6775098, -0.8229028, 1, 1, 1, 1, 1,
-0.3952438, 0.1968574, 0.01776166, 0, 0, 1, 1, 1,
-0.3925303, 0.5263997, -1.684371, 1, 0, 0, 1, 1,
-0.3910466, 0.6911399, -1.030658, 1, 0, 0, 1, 1,
-0.3910185, 0.7029325, -0.4164139, 1, 0, 0, 1, 1,
-0.3776116, 1.789034, -1.165589, 1, 0, 0, 1, 1,
-0.3695905, 1.201311, 0.6726051, 1, 0, 0, 1, 1,
-0.3661672, -0.8165113, -2.691309, 0, 0, 0, 1, 1,
-0.3623869, 0.9183195, -0.3675877, 0, 0, 0, 1, 1,
-0.362269, -1.541874, -5.043162, 0, 0, 0, 1, 1,
-0.3571779, -0.7701966, -2.34464, 0, 0, 0, 1, 1,
-0.3553116, -0.1147757, -1.542128, 0, 0, 0, 1, 1,
-0.3509674, -0.1438987, -3.213818, 0, 0, 0, 1, 1,
-0.3464273, -0.8333728, -2.619442, 0, 0, 0, 1, 1,
-0.3460409, -1.659833, -4.485441, 1, 1, 1, 1, 1,
-0.3427898, 0.9058773, -0.7275318, 1, 1, 1, 1, 1,
-0.339704, 0.8065585, -0.1137947, 1, 1, 1, 1, 1,
-0.3346863, -1.050634, -2.988986, 1, 1, 1, 1, 1,
-0.3344758, -0.1070017, -2.453098, 1, 1, 1, 1, 1,
-0.3336121, 0.04640444, -2.073683, 1, 1, 1, 1, 1,
-0.3320461, 0.7984256, -1.525257, 1, 1, 1, 1, 1,
-0.3318696, -0.2358484, -3.013022, 1, 1, 1, 1, 1,
-0.3304583, 0.4903189, -0.2877237, 1, 1, 1, 1, 1,
-0.3300189, 0.3498706, -1.575822, 1, 1, 1, 1, 1,
-0.3259572, 0.2102826, -0.5500736, 1, 1, 1, 1, 1,
-0.3252386, 1.587244, 0.150078, 1, 1, 1, 1, 1,
-0.3247934, -0.3573321, -1.094683, 1, 1, 1, 1, 1,
-0.3241751, -0.4497578, -4.075974, 1, 1, 1, 1, 1,
-0.3228891, -0.4480917, -2.508439, 1, 1, 1, 1, 1,
-0.3228732, -0.7183606, -4.718313, 0, 0, 1, 1, 1,
-0.3196864, 0.9256908, -2.978712, 1, 0, 0, 1, 1,
-0.3163631, -0.376419, -0.987262, 1, 0, 0, 1, 1,
-0.3162427, -0.5617042, -0.8961926, 1, 0, 0, 1, 1,
-0.3135199, 0.2120326, -0.7603043, 1, 0, 0, 1, 1,
-0.3128327, -0.3745193, -1.671438, 1, 0, 0, 1, 1,
-0.3066557, -0.008202777, -0.9961097, 0, 0, 0, 1, 1,
-0.3028628, -1.419052, -2.553357, 0, 0, 0, 1, 1,
-0.2998811, -0.4453747, -3.335453, 0, 0, 0, 1, 1,
-0.2874757, 0.7748483, -0.3318034, 0, 0, 0, 1, 1,
-0.2870679, -1.678621, -1.657709, 0, 0, 0, 1, 1,
-0.2830531, 0.8376742, -0.9737391, 0, 0, 0, 1, 1,
-0.2827257, -0.5137534, -2.005416, 0, 0, 0, 1, 1,
-0.2827246, -0.1768697, -1.567178, 1, 1, 1, 1, 1,
-0.2825924, -0.02031894, -1.306592, 1, 1, 1, 1, 1,
-0.2820584, 0.5487072, -0.8322414, 1, 1, 1, 1, 1,
-0.276275, 2.074123, -1.349153, 1, 1, 1, 1, 1,
-0.2700785, -0.0468101, -2.603774, 1, 1, 1, 1, 1,
-0.2653507, 0.4382771, 0.1650082, 1, 1, 1, 1, 1,
-0.2480888, 0.09340064, -2.931194, 1, 1, 1, 1, 1,
-0.247773, -0.4968044, -2.449311, 1, 1, 1, 1, 1,
-0.2415439, -0.4105968, -3.332181, 1, 1, 1, 1, 1,
-0.2408697, 0.4285747, -1.086371, 1, 1, 1, 1, 1,
-0.2399334, -0.9267881, -3.218062, 1, 1, 1, 1, 1,
-0.2399029, -0.5005811, -2.471778, 1, 1, 1, 1, 1,
-0.2396414, -1.221625, -2.875309, 1, 1, 1, 1, 1,
-0.2360449, 1.149086, -0.7886314, 1, 1, 1, 1, 1,
-0.2336151, 0.9301987, 0.9136496, 1, 1, 1, 1, 1,
-0.2320716, 0.6364728, -1.573681, 0, 0, 1, 1, 1,
-0.2200817, -0.03875696, -2.874694, 1, 0, 0, 1, 1,
-0.2188943, 0.8181168, -1.785332, 1, 0, 0, 1, 1,
-0.2143248, -0.5676022, -3.61921, 1, 0, 0, 1, 1,
-0.2110748, 0.9358906, -1.096489, 1, 0, 0, 1, 1,
-0.2067871, -1.729366, -2.951715, 1, 0, 0, 1, 1,
-0.2057013, 2.247181, 2.170996, 0, 0, 0, 1, 1,
-0.2044033, 0.5383539, -0.1671195, 0, 0, 0, 1, 1,
-0.1992182, 0.7477041, -2.048836, 0, 0, 0, 1, 1,
-0.1932528, 0.5042694, -0.4583535, 0, 0, 0, 1, 1,
-0.1929088, 1.13567, -0.7267255, 0, 0, 0, 1, 1,
-0.1921393, -0.1128928, -3.237665, 0, 0, 0, 1, 1,
-0.1870422, -2.42042, -1.068516, 0, 0, 0, 1, 1,
-0.1826065, -0.9054075, -4.413998, 1, 1, 1, 1, 1,
-0.1815169, -0.889787, -4.710599, 1, 1, 1, 1, 1,
-0.1812041, 0.4772807, -2.436974, 1, 1, 1, 1, 1,
-0.1807328, 0.3049211, -3.417742, 1, 1, 1, 1, 1,
-0.1794118, 0.3573593, 0.659045, 1, 1, 1, 1, 1,
-0.1783593, 0.508562, -0.6883673, 1, 1, 1, 1, 1,
-0.175906, -1.064372, -2.668059, 1, 1, 1, 1, 1,
-0.1630897, -0.2313162, -3.796956, 1, 1, 1, 1, 1,
-0.1549653, -1.141724, -3.866826, 1, 1, 1, 1, 1,
-0.1529181, 1.23396, 0.8838687, 1, 1, 1, 1, 1,
-0.1520132, -0.4653605, -2.273547, 1, 1, 1, 1, 1,
-0.1513822, 0.783303, -1.092197, 1, 1, 1, 1, 1,
-0.1496917, -0.4029484, -3.221233, 1, 1, 1, 1, 1,
-0.1475284, 2.037461, -1.901322, 1, 1, 1, 1, 1,
-0.1465787, -1.46924, -3.265643, 1, 1, 1, 1, 1,
-0.1462009, 0.3076021, 0.06312154, 0, 0, 1, 1, 1,
-0.1461654, -0.3704892, -4.050677, 1, 0, 0, 1, 1,
-0.1423234, -0.1563324, -1.816682, 1, 0, 0, 1, 1,
-0.1404349, -0.08405361, -2.746776, 1, 0, 0, 1, 1,
-0.1381669, -0.4297231, -2.950194, 1, 0, 0, 1, 1,
-0.1380354, 0.8524032, 0.137125, 1, 0, 0, 1, 1,
-0.132163, -3.047701, -3.704745, 0, 0, 0, 1, 1,
-0.1288383, 0.6353787, 0.3491399, 0, 0, 0, 1, 1,
-0.1283429, 0.632934, 0.2132512, 0, 0, 0, 1, 1,
-0.1258363, 0.1045516, -0.936811, 0, 0, 0, 1, 1,
-0.118557, 0.4102185, 1.006552, 0, 0, 0, 1, 1,
-0.1178676, 1.323541, 0.635413, 0, 0, 0, 1, 1,
-0.1158339, 0.8093535, -0.5162258, 0, 0, 0, 1, 1,
-0.1156192, 1.462502, 0.2082804, 1, 1, 1, 1, 1,
-0.1114714, 0.0849738, -1.790341, 1, 1, 1, 1, 1,
-0.1103793, 0.1488232, -0.7598848, 1, 1, 1, 1, 1,
-0.1062164, 1.067624, -2.385979, 1, 1, 1, 1, 1,
-0.1029299, -1.753188, -2.345387, 1, 1, 1, 1, 1,
-0.1008114, -0.1425979, -1.433124, 1, 1, 1, 1, 1,
-0.09710999, -1.589196, -2.053191, 1, 1, 1, 1, 1,
-0.09665759, -1.045991, -4.185533, 1, 1, 1, 1, 1,
-0.0921821, -0.567072, -4.387719, 1, 1, 1, 1, 1,
-0.09020215, 0.8920398, -0.3206994, 1, 1, 1, 1, 1,
-0.0893371, 2.332748, -0.3059044, 1, 1, 1, 1, 1,
-0.08614818, -1.242267, -2.441623, 1, 1, 1, 1, 1,
-0.08421617, -0.1127918, -2.443625, 1, 1, 1, 1, 1,
-0.08419959, -0.6864786, -2.532825, 1, 1, 1, 1, 1,
-0.0796812, -1.218184, -5.027454, 1, 1, 1, 1, 1,
-0.07909226, 0.01443944, 0.3165608, 0, 0, 1, 1, 1,
-0.07836526, 1.687129, -2.001628, 1, 0, 0, 1, 1,
-0.07671303, -1.064871, -3.010507, 1, 0, 0, 1, 1,
-0.07641986, -0.4074009, -3.452168, 1, 0, 0, 1, 1,
-0.07336622, -0.2105218, -2.578532, 1, 0, 0, 1, 1,
-0.0680173, -0.5806205, -4.464648, 1, 0, 0, 1, 1,
-0.06612203, 0.8692876, 2.029842, 0, 0, 0, 1, 1,
-0.06523962, 1.574296, 0.07880813, 0, 0, 0, 1, 1,
-0.06325094, 0.7175463, 1.029171, 0, 0, 0, 1, 1,
-0.05881627, 1.323008, -0.5068369, 0, 0, 0, 1, 1,
-0.05059622, -0.04874048, -3.229771, 0, 0, 0, 1, 1,
-0.04665865, 1.905491, -0.1258267, 0, 0, 0, 1, 1,
-0.04630178, 0.7437286, -1.074911, 0, 0, 0, 1, 1,
-0.04530942, 0.7110509, -1.830215, 1, 1, 1, 1, 1,
-0.04291367, 0.6154804, 0.4009789, 1, 1, 1, 1, 1,
-0.04128246, 1.343595, -0.2523525, 1, 1, 1, 1, 1,
-0.03998178, 0.4060777, 0.219826, 1, 1, 1, 1, 1,
-0.03950448, 1.68135, 1.861256, 1, 1, 1, 1, 1,
-0.03666615, -0.8233572, -2.74183, 1, 1, 1, 1, 1,
-0.03472558, 0.7201461, 1.960092, 1, 1, 1, 1, 1,
-0.03311108, -0.9486709, -2.96013, 1, 1, 1, 1, 1,
-0.03228233, 1.562984, -1.492338, 1, 1, 1, 1, 1,
-0.02828307, 0.002353679, -3.073522, 1, 1, 1, 1, 1,
-0.02814271, 0.58524, 0.7279593, 1, 1, 1, 1, 1,
-0.02517327, 1.581311, -0.4012543, 1, 1, 1, 1, 1,
-0.02265765, 2.324278, 0.7821974, 1, 1, 1, 1, 1,
-0.02038948, -0.5542816, -2.820188, 1, 1, 1, 1, 1,
-0.01521114, -0.9896548, -2.572989, 1, 1, 1, 1, 1,
-0.01126058, 0.6568837, -0.1118857, 0, 0, 1, 1, 1,
-0.01067808, -0.9931943, -2.875917, 1, 0, 0, 1, 1,
-0.008323976, 0.6381286, -0.3831383, 1, 0, 0, 1, 1,
-0.002979337, 1.891071, -0.5891457, 1, 0, 0, 1, 1,
-0.001021738, -0.80683, -3.157981, 1, 0, 0, 1, 1,
0.002367217, -0.3699089, 1.512671, 1, 0, 0, 1, 1,
0.002846314, 0.03180066, -1.337828, 0, 0, 0, 1, 1,
0.005534025, 0.6845233, -0.1056224, 0, 0, 0, 1, 1,
0.005554405, -1.9875, 2.879259, 0, 0, 0, 1, 1,
0.006724752, 0.6513838, 0.3307799, 0, 0, 0, 1, 1,
0.00974581, -0.02433899, 2.144124, 0, 0, 0, 1, 1,
0.0117458, 0.5148715, 1.460922, 0, 0, 0, 1, 1,
0.01378488, 0.4080476, -0.4692723, 0, 0, 0, 1, 1,
0.0159896, -0.2162748, 3.263556, 1, 1, 1, 1, 1,
0.02417608, -2.258976, 3.798764, 1, 1, 1, 1, 1,
0.0283065, 0.005638078, 1.418714, 1, 1, 1, 1, 1,
0.02988185, -1.127741, 3.067879, 1, 1, 1, 1, 1,
0.03045129, -2.255957, 3.156434, 1, 1, 1, 1, 1,
0.03673568, 0.9584751, -0.5925931, 1, 1, 1, 1, 1,
0.03829491, 2.033275, -0.004247827, 1, 1, 1, 1, 1,
0.04080304, -1.40918, 3.41349, 1, 1, 1, 1, 1,
0.04129693, 1.368781, -0.4182666, 1, 1, 1, 1, 1,
0.04187267, -0.1979033, 2.028125, 1, 1, 1, 1, 1,
0.04389694, -0.2650738, 2.702199, 1, 1, 1, 1, 1,
0.04784054, 0.08089688, 0.8533452, 1, 1, 1, 1, 1,
0.04869992, 1.635532, -0.8068375, 1, 1, 1, 1, 1,
0.05281299, -1.345311, 1.630386, 1, 1, 1, 1, 1,
0.05303252, 1.601944, -1.038953, 1, 1, 1, 1, 1,
0.05362375, 0.3085798, 1.346423, 0, 0, 1, 1, 1,
0.05378944, 0.2736639, -0.6151081, 1, 0, 0, 1, 1,
0.05676542, 1.920036, -0.4254621, 1, 0, 0, 1, 1,
0.06002732, -1.25099, 4.638463, 1, 0, 0, 1, 1,
0.06171984, 1.220029, 0.6719065, 1, 0, 0, 1, 1,
0.06445251, 1.617524, -0.1191917, 1, 0, 0, 1, 1,
0.06753492, -0.02691011, 2.469498, 0, 0, 0, 1, 1,
0.06873394, 0.6946844, 1.383712, 0, 0, 0, 1, 1,
0.06928496, 0.603451, -1.261356, 0, 0, 0, 1, 1,
0.06947516, -0.2351449, 3.057046, 0, 0, 0, 1, 1,
0.07143136, 0.06626406, 0.2840895, 0, 0, 0, 1, 1,
0.07691851, -0.1258158, 3.425702, 0, 0, 0, 1, 1,
0.07796837, -2.617035, 2.975525, 0, 0, 0, 1, 1,
0.07883085, 2.471642, -0.69178, 1, 1, 1, 1, 1,
0.08082876, -0.4864358, 2.031447, 1, 1, 1, 1, 1,
0.08232698, 1.376559, -0.57659, 1, 1, 1, 1, 1,
0.08334097, -1.187923, 4.061514, 1, 1, 1, 1, 1,
0.08364375, 0.1093871, -0.06169027, 1, 1, 1, 1, 1,
0.09163265, 0.9219163, -0.4745385, 1, 1, 1, 1, 1,
0.09490548, -0.05182849, 1.172969, 1, 1, 1, 1, 1,
0.09624847, -0.03827881, 0.6232901, 1, 1, 1, 1, 1,
0.1022241, 1.440868, -0.3176535, 1, 1, 1, 1, 1,
0.1050915, -0.4823338, 2.42827, 1, 1, 1, 1, 1,
0.1053208, 0.8422875, 1.628267, 1, 1, 1, 1, 1,
0.1087855, -1.069967, 2.954575, 1, 1, 1, 1, 1,
0.1173701, 0.04711678, 0.3994278, 1, 1, 1, 1, 1,
0.1179152, 0.7665944, -0.3937684, 1, 1, 1, 1, 1,
0.1221194, -0.9177674, 3.591476, 1, 1, 1, 1, 1,
0.1258549, 0.5856189, 0.363397, 0, 0, 1, 1, 1,
0.128004, 0.1746359, 0.2448563, 1, 0, 0, 1, 1,
0.1317971, 1.258148, -0.8018312, 1, 0, 0, 1, 1,
0.1325367, -0.05504615, 0.2482445, 1, 0, 0, 1, 1,
0.1370649, 2.553723, -0.5167785, 1, 0, 0, 1, 1,
0.1478318, 1.22082, 0.7782944, 1, 0, 0, 1, 1,
0.1544203, 2.286951, -1.186012, 0, 0, 0, 1, 1,
0.1574113, 0.7433083, -0.6348262, 0, 0, 0, 1, 1,
0.1576064, -1.238343, 3.852273, 0, 0, 0, 1, 1,
0.1603374, -2.092056, 3.273795, 0, 0, 0, 1, 1,
0.1611889, -0.1646973, 1.987586, 0, 0, 0, 1, 1,
0.1614009, 1.322778, -0.05886259, 0, 0, 0, 1, 1,
0.1663802, -0.9447678, 4.106468, 0, 0, 0, 1, 1,
0.1696563, 0.121402, 0.475186, 1, 1, 1, 1, 1,
0.1705196, -0.205811, 1.692093, 1, 1, 1, 1, 1,
0.170997, -1.545905, 1.454032, 1, 1, 1, 1, 1,
0.1739169, -0.1900938, 2.520442, 1, 1, 1, 1, 1,
0.1762114, 0.8240098, 0.9498612, 1, 1, 1, 1, 1,
0.1763513, 1.974394, 0.4636173, 1, 1, 1, 1, 1,
0.182451, 1.607503, -0.03133628, 1, 1, 1, 1, 1,
0.1827409, -0.1717575, 3.58418, 1, 1, 1, 1, 1,
0.1841378, 0.6786181, 0.2959317, 1, 1, 1, 1, 1,
0.1864124, 1.124338, 0.111935, 1, 1, 1, 1, 1,
0.1865523, -1.313444, 2.285982, 1, 1, 1, 1, 1,
0.1894195, 0.8493333, 0.2319213, 1, 1, 1, 1, 1,
0.1904237, -1.829338, 3.69136, 1, 1, 1, 1, 1,
0.195803, 1.415686, -0.5764792, 1, 1, 1, 1, 1,
0.2038741, -0.823443, 3.178221, 1, 1, 1, 1, 1,
0.2048336, -0.1620921, 2.174166, 0, 0, 1, 1, 1,
0.2097261, -0.1496266, 1.49801, 1, 0, 0, 1, 1,
0.2112539, -0.5083753, 3.070306, 1, 0, 0, 1, 1,
0.2113071, -1.35249, 2.316354, 1, 0, 0, 1, 1,
0.2121427, -0.1981551, 2.00322, 1, 0, 0, 1, 1,
0.2136567, 1.183436, -0.8574995, 1, 0, 0, 1, 1,
0.2146876, 0.8738192, -0.3512628, 0, 0, 0, 1, 1,
0.2155974, 0.9980112, 0.7618918, 0, 0, 0, 1, 1,
0.2197662, 1.193393, 0.6968993, 0, 0, 0, 1, 1,
0.2226481, -1.402736, 2.470201, 0, 0, 0, 1, 1,
0.22662, -0.3776808, 4.09033, 0, 0, 0, 1, 1,
0.2362403, -0.1733602, 2.015076, 0, 0, 0, 1, 1,
0.23697, -0.6204244, 2.981251, 0, 0, 0, 1, 1,
0.2390707, 0.9135527, 0.07942229, 1, 1, 1, 1, 1,
0.2394775, -0.6562362, 1.204488, 1, 1, 1, 1, 1,
0.2426343, 1.219208, 1.184115, 1, 1, 1, 1, 1,
0.2477306, 0.3502967, 1.163249, 1, 1, 1, 1, 1,
0.2496379, -1.202793, 2.240152, 1, 1, 1, 1, 1,
0.2499547, 2.497731, 0.4562207, 1, 1, 1, 1, 1,
0.2503868, -0.7074714, 4.188369, 1, 1, 1, 1, 1,
0.2505724, -0.3334552, 1.433601, 1, 1, 1, 1, 1,
0.2514404, -1.422329, 2.692963, 1, 1, 1, 1, 1,
0.2519982, -1.000719, 2.807451, 1, 1, 1, 1, 1,
0.2564046, 0.2362014, 1.447293, 1, 1, 1, 1, 1,
0.2576701, 1.198818, 1.01044, 1, 1, 1, 1, 1,
0.2673362, 0.5026021, -0.06114805, 1, 1, 1, 1, 1,
0.2677596, 0.4254337, 0.3257932, 1, 1, 1, 1, 1,
0.2679689, -0.8458847, 1.898994, 1, 1, 1, 1, 1,
0.2679761, 1.138409, -1.189659, 0, 0, 1, 1, 1,
0.2780071, -0.8638072, 4.504965, 1, 0, 0, 1, 1,
0.2819678, 0.530706, 0.177121, 1, 0, 0, 1, 1,
0.2822869, -0.1743849, 1.069574, 1, 0, 0, 1, 1,
0.2845356, -1.633961, 3.235035, 1, 0, 0, 1, 1,
0.2852113, -0.001301077, 1.313162, 1, 0, 0, 1, 1,
0.2853047, -1.288802, 4.198869, 0, 0, 0, 1, 1,
0.2883557, 1.173943, 1.749819, 0, 0, 0, 1, 1,
0.290371, 0.2285218, 0.6027409, 0, 0, 0, 1, 1,
0.2907408, 1.604502, -0.8742526, 0, 0, 0, 1, 1,
0.2911757, 1.333427, -0.8893406, 0, 0, 0, 1, 1,
0.2923627, 0.3423581, 1.441836, 0, 0, 0, 1, 1,
0.2957389, 0.6555163, -0.801935, 0, 0, 0, 1, 1,
0.2958133, -0.2756433, 2.48071, 1, 1, 1, 1, 1,
0.2993242, -0.5633587, 2.902668, 1, 1, 1, 1, 1,
0.3004062, -0.002897379, -0.6677549, 1, 1, 1, 1, 1,
0.3033003, -0.436076, 3.3599, 1, 1, 1, 1, 1,
0.3046043, -0.6328202, 2.501601, 1, 1, 1, 1, 1,
0.3064425, -0.1644626, 3.266364, 1, 1, 1, 1, 1,
0.3110409, -0.04225361, 2.0897, 1, 1, 1, 1, 1,
0.3131714, -1.115499, 1.150946, 1, 1, 1, 1, 1,
0.3135552, -1.143433, 2.605239, 1, 1, 1, 1, 1,
0.3144747, -1.225497, 3.522002, 1, 1, 1, 1, 1,
0.3146726, 1.255556, 0.4055267, 1, 1, 1, 1, 1,
0.314877, -1.493657, 1.43011, 1, 1, 1, 1, 1,
0.3211458, -1.702896, 3.083276, 1, 1, 1, 1, 1,
0.3265146, -0.8314621, 2.814131, 1, 1, 1, 1, 1,
0.3269182, 2.359199, 0.9751034, 1, 1, 1, 1, 1,
0.3335275, 0.5354006, 2.586205, 0, 0, 1, 1, 1,
0.3336284, -1.248345, 4.327157, 1, 0, 0, 1, 1,
0.3370126, -0.1490922, 2.757895, 1, 0, 0, 1, 1,
0.3378745, -0.803379, 3.360049, 1, 0, 0, 1, 1,
0.3380817, -0.3096905, 1.607962, 1, 0, 0, 1, 1,
0.3423364, -0.8217022, 3.225683, 1, 0, 0, 1, 1,
0.3523709, 0.686184, -0.9075513, 0, 0, 0, 1, 1,
0.3587472, -1.761045, 4.402271, 0, 0, 0, 1, 1,
0.3592933, 0.8517308, 1.317882, 0, 0, 0, 1, 1,
0.3600945, -0.2867584, 1.06145, 0, 0, 0, 1, 1,
0.3618384, 0.4063225, 2.625645, 0, 0, 0, 1, 1,
0.3622928, -0.3780314, 2.182659, 0, 0, 0, 1, 1,
0.3645316, 0.09986258, -0.4463427, 0, 0, 0, 1, 1,
0.3708932, 1.154674, -0.3696263, 1, 1, 1, 1, 1,
0.3716879, -1.358406, 2.335626, 1, 1, 1, 1, 1,
0.3719161, 0.1495907, 0.7873989, 1, 1, 1, 1, 1,
0.3823996, -0.7900168, 2.009863, 1, 1, 1, 1, 1,
0.3855834, 1.426997, -0.8345605, 1, 1, 1, 1, 1,
0.3869128, 0.06951185, 0.6048458, 1, 1, 1, 1, 1,
0.3888182, -0.4140983, 2.578838, 1, 1, 1, 1, 1,
0.3914192, 0.142969, 1.848223, 1, 1, 1, 1, 1,
0.3919214, -0.537863, 1.044318, 1, 1, 1, 1, 1,
0.4004126, -0.02126658, 0.7683029, 1, 1, 1, 1, 1,
0.400505, 1.174431, 0.9449177, 1, 1, 1, 1, 1,
0.4107713, -0.1509686, 0.8498453, 1, 1, 1, 1, 1,
0.4126273, 0.3111565, 1.897928, 1, 1, 1, 1, 1,
0.4137197, -2.486541, 3.157374, 1, 1, 1, 1, 1,
0.4233823, -1.387236, 1.433277, 1, 1, 1, 1, 1,
0.4258443, -0.3564892, 1.886906, 0, 0, 1, 1, 1,
0.4342819, 1.105206, 0.6205193, 1, 0, 0, 1, 1,
0.4358385, 0.3050831, -0.06882591, 1, 0, 0, 1, 1,
0.4418705, 0.8279429, 2.025701, 1, 0, 0, 1, 1,
0.4506266, 0.3228414, -0.3097554, 1, 0, 0, 1, 1,
0.4510617, 0.1447321, 0.7427087, 1, 0, 0, 1, 1,
0.4523478, -1.333721, 2.957432, 0, 0, 0, 1, 1,
0.4526494, -0.5725764, 2.013545, 0, 0, 0, 1, 1,
0.4533014, -2.415683, 3.625015, 0, 0, 0, 1, 1,
0.4608033, -0.909543, 2.10064, 0, 0, 0, 1, 1,
0.4609555, -0.3870019, 2.610925, 0, 0, 0, 1, 1,
0.46118, 0.07208433, 1.019833, 0, 0, 0, 1, 1,
0.4689014, 0.9291888, 0.6291396, 0, 0, 0, 1, 1,
0.4704879, 0.8107982, 1.959306, 1, 1, 1, 1, 1,
0.4782038, 0.5159867, 1.594603, 1, 1, 1, 1, 1,
0.4792766, -1.750102, 3.565119, 1, 1, 1, 1, 1,
0.4865057, -0.9656586, 2.647061, 1, 1, 1, 1, 1,
0.4871705, 0.8322892, 1.758524, 1, 1, 1, 1, 1,
0.4883947, -1.153448, 3.27498, 1, 1, 1, 1, 1,
0.4900749, 1.281451, 0.7545957, 1, 1, 1, 1, 1,
0.4912613, -0.3754473, 0.77374, 1, 1, 1, 1, 1,
0.4942878, -1.667605, 2.471451, 1, 1, 1, 1, 1,
0.4960111, -0.0534954, 1.456728, 1, 1, 1, 1, 1,
0.4976824, 0.8484212, 0.5173306, 1, 1, 1, 1, 1,
0.4978173, 0.05091411, 1.345074, 1, 1, 1, 1, 1,
0.4988914, 0.1936186, 0.9135053, 1, 1, 1, 1, 1,
0.5052292, 0.6170756, 0.7146913, 1, 1, 1, 1, 1,
0.5074978, 0.1816772, 2.794743, 1, 1, 1, 1, 1,
0.5087885, -1.644627, 4.199218, 0, 0, 1, 1, 1,
0.5095842, -0.9779786, 2.202671, 1, 0, 0, 1, 1,
0.5130538, 0.7802768, 0.6415567, 1, 0, 0, 1, 1,
0.5133343, 0.5726621, 0.8307528, 1, 0, 0, 1, 1,
0.5135876, -0.7352082, 2.302485, 1, 0, 0, 1, 1,
0.5179695, 0.5056486, -0.3201073, 1, 0, 0, 1, 1,
0.519509, -0.3977448, 2.387824, 0, 0, 0, 1, 1,
0.5212597, -0.8388068, 2.046547, 0, 0, 0, 1, 1,
0.5213034, 1.37909, 0.3158819, 0, 0, 0, 1, 1,
0.5246882, 0.01740526, 2.004608, 0, 0, 0, 1, 1,
0.5258443, 1.114753, -0.7208144, 0, 0, 0, 1, 1,
0.5259825, -1.212396, 2.089596, 0, 0, 0, 1, 1,
0.5304325, 0.212047, 2.458869, 0, 0, 0, 1, 1,
0.5393924, 0.928085, -1.075489, 1, 1, 1, 1, 1,
0.5617718, -0.5793378, 1.786814, 1, 1, 1, 1, 1,
0.5636947, 1.541508, 1.820936, 1, 1, 1, 1, 1,
0.564222, -0.6843216, 2.804921, 1, 1, 1, 1, 1,
0.5681542, 1.036648, -0.671432, 1, 1, 1, 1, 1,
0.5709235, -1.281859, 1.180356, 1, 1, 1, 1, 1,
0.5743532, 0.8037412, 1.259011, 1, 1, 1, 1, 1,
0.577243, -0.4927268, 2.06205, 1, 1, 1, 1, 1,
0.5802641, 2.061167, 1.421647, 1, 1, 1, 1, 1,
0.59117, 0.7515427, -0.1219645, 1, 1, 1, 1, 1,
0.600274, 0.3303687, 0.5319802, 1, 1, 1, 1, 1,
0.6012911, 1.680642, -0.6721352, 1, 1, 1, 1, 1,
0.6042681, -0.2503586, 4.093456, 1, 1, 1, 1, 1,
0.6056033, -0.210875, 1.656566, 1, 1, 1, 1, 1,
0.6065521, -0.3922887, 2.234092, 1, 1, 1, 1, 1,
0.609464, 0.4255881, 2.299131, 0, 0, 1, 1, 1,
0.6107785, -0.3560162, 1.404036, 1, 0, 0, 1, 1,
0.611208, 1.441355, 1.098206, 1, 0, 0, 1, 1,
0.6156598, -0.04725918, 1.912136, 1, 0, 0, 1, 1,
0.6168714, 1.014468, -0.3264881, 1, 0, 0, 1, 1,
0.6244224, 0.05481265, 1.735553, 1, 0, 0, 1, 1,
0.6286108, -0.2387625, -0.1000516, 0, 0, 0, 1, 1,
0.6325262, -1.806557, 2.966835, 0, 0, 0, 1, 1,
0.635304, 1.078124, -0.02039592, 0, 0, 0, 1, 1,
0.6364015, -0.06675807, 2.467116, 0, 0, 0, 1, 1,
0.6384752, 0.3289827, 1.931179, 0, 0, 0, 1, 1,
0.6406211, -1.705431, 3.200249, 0, 0, 0, 1, 1,
0.6428837, 1.29507, -0.3390468, 0, 0, 0, 1, 1,
0.6451452, -0.2877121, 1.058138, 1, 1, 1, 1, 1,
0.6464599, -0.1966182, 1.173164, 1, 1, 1, 1, 1,
0.6514691, -0.2973313, 2.533529, 1, 1, 1, 1, 1,
0.663915, 0.5226709, 0.4396009, 1, 1, 1, 1, 1,
0.6673917, -0.02864542, 1.45799, 1, 1, 1, 1, 1,
0.6689439, 0.04316536, 0.4513328, 1, 1, 1, 1, 1,
0.67303, -0.03223924, 0.5733932, 1, 1, 1, 1, 1,
0.6743032, -1.211317, 3.953442, 1, 1, 1, 1, 1,
0.6748052, 1.075831, -0.04911654, 1, 1, 1, 1, 1,
0.6778845, 0.204604, 2.496167, 1, 1, 1, 1, 1,
0.6798466, 0.607595, 1.231018, 1, 1, 1, 1, 1,
0.6816221, 0.6245416, 2.262147, 1, 1, 1, 1, 1,
0.684562, -0.06187978, 2.7173, 1, 1, 1, 1, 1,
0.6847298, -1.218371, 3.590323, 1, 1, 1, 1, 1,
0.6935585, -1.785578, 1.951471, 1, 1, 1, 1, 1,
0.6974183, 1.486861, -1.317877, 0, 0, 1, 1, 1,
0.6999946, -0.7506446, 2.864046, 1, 0, 0, 1, 1,
0.7004387, -0.9004397, 2.64129, 1, 0, 0, 1, 1,
0.7032558, -2.28324, 2.514614, 1, 0, 0, 1, 1,
0.705179, 0.5862609, 1.145383, 1, 0, 0, 1, 1,
0.712115, -0.8141671, 1.785793, 1, 0, 0, 1, 1,
0.7231099, 0.965225, 0.871197, 0, 0, 0, 1, 1,
0.7234246, 1.168022, -2.215088, 0, 0, 0, 1, 1,
0.7255109, 0.5607681, 2.193719, 0, 0, 0, 1, 1,
0.725911, 0.3704449, 2.229309, 0, 0, 0, 1, 1,
0.7312579, -1.875596, 1.847828, 0, 0, 0, 1, 1,
0.7335891, 0.03978746, 1.813414, 0, 0, 0, 1, 1,
0.7350333, 1.668828, -1.06267, 0, 0, 0, 1, 1,
0.7359832, 0.6584184, 0.5781004, 1, 1, 1, 1, 1,
0.7406868, -0.4004073, 2.940375, 1, 1, 1, 1, 1,
0.7431178, -0.20126, 3.800809, 1, 1, 1, 1, 1,
0.7466354, -0.3585188, 1.883501, 1, 1, 1, 1, 1,
0.7519401, 1.054826, 0.3402916, 1, 1, 1, 1, 1,
0.7530241, 1.138605, 0.8461928, 1, 1, 1, 1, 1,
0.7531297, 1.25199, 0.5209032, 1, 1, 1, 1, 1,
0.755079, 0.00108817, 0.1755919, 1, 1, 1, 1, 1,
0.7607583, -0.2726346, 1.215351, 1, 1, 1, 1, 1,
0.7608191, 0.006345271, 1.945079, 1, 1, 1, 1, 1,
0.7683771, 1.419941, 1.283661, 1, 1, 1, 1, 1,
0.768984, 1.561513, 0.500567, 1, 1, 1, 1, 1,
0.770218, -1.090775, 1.488004, 1, 1, 1, 1, 1,
0.7730051, 1.497831, -0.68974, 1, 1, 1, 1, 1,
0.7734738, 0.9512312, 0.1040088, 1, 1, 1, 1, 1,
0.7748334, -0.1346289, 1.258046, 0, 0, 1, 1, 1,
0.7754762, 1.305946, 0.373183, 1, 0, 0, 1, 1,
0.7786236, 1.708015, -0.4136534, 1, 0, 0, 1, 1,
0.7824953, 1.588872, -0.8395829, 1, 0, 0, 1, 1,
0.7832007, -0.1853224, 1.567814, 1, 0, 0, 1, 1,
0.7855946, -1.336006, 2.273035, 1, 0, 0, 1, 1,
0.7879986, -0.8775544, 1.702074, 0, 0, 0, 1, 1,
0.7882938, -1.496423, 1.705287, 0, 0, 0, 1, 1,
0.791747, 0.4740521, 0.04109462, 0, 0, 0, 1, 1,
0.7928473, 1.005474, 0.2082486, 0, 0, 0, 1, 1,
0.7928997, 0.1457758, 1.603241, 0, 0, 0, 1, 1,
0.7934133, 1.021917, 0.0198729, 0, 0, 0, 1, 1,
0.794818, -0.9799768, 2.573687, 0, 0, 0, 1, 1,
0.7969018, 0.8447145, 0.3334332, 1, 1, 1, 1, 1,
0.7990295, -0.2034191, -0.8003212, 1, 1, 1, 1, 1,
0.8001544, 0.555913, 0.4817976, 1, 1, 1, 1, 1,
0.8068894, -0.005065534, 0.8351885, 1, 1, 1, 1, 1,
0.8097286, 0.3519566, -0.4236884, 1, 1, 1, 1, 1,
0.8177329, -0.07129902, 1.662126, 1, 1, 1, 1, 1,
0.818223, 0.4315846, 2.45387, 1, 1, 1, 1, 1,
0.8187578, -0.4886287, 2.383528, 1, 1, 1, 1, 1,
0.8209324, 0.84688, 0.5343773, 1, 1, 1, 1, 1,
0.8248253, 1.270279, 0.6503444, 1, 1, 1, 1, 1,
0.8287237, -1.131484, 1.871105, 1, 1, 1, 1, 1,
0.829366, -2.15584, 2.321074, 1, 1, 1, 1, 1,
0.8342046, -0.5541564, 2.608598, 1, 1, 1, 1, 1,
0.8399398, 0.1252296, 1.51691, 1, 1, 1, 1, 1,
0.8404868, 0.5957298, 1.370589, 1, 1, 1, 1, 1,
0.8507002, 1.135047, -0.9377168, 0, 0, 1, 1, 1,
0.8543627, -0.2074106, 1.037724, 1, 0, 0, 1, 1,
0.8550387, -0.2547354, 3.73043, 1, 0, 0, 1, 1,
0.8567056, 1.028825, 1.06608, 1, 0, 0, 1, 1,
0.8646338, 0.3088576, 0.8375689, 1, 0, 0, 1, 1,
0.8711699, 1.232124, -0.3052856, 1, 0, 0, 1, 1,
0.8753322, 0.6964117, 0.4891821, 0, 0, 0, 1, 1,
0.8861891, 0.9499601, 1.155866, 0, 0, 0, 1, 1,
0.8911474, 0.076267, 2.316214, 0, 0, 0, 1, 1,
0.8927563, -0.310306, 1.42955, 0, 0, 0, 1, 1,
0.8967961, 0.5385426, 1.246884, 0, 0, 0, 1, 1,
0.9014917, -1.792525, 0.6195384, 0, 0, 0, 1, 1,
0.9084027, -0.7827553, 3.076388, 0, 0, 0, 1, 1,
0.9109201, -0.4061616, 2.083014, 1, 1, 1, 1, 1,
0.9132756, 0.1097873, 2.395238, 1, 1, 1, 1, 1,
0.9279211, -0.0280265, 1.129698, 1, 1, 1, 1, 1,
0.9333596, 1.972861, 0.9682059, 1, 1, 1, 1, 1,
0.9371111, -0.8619702, 2.720007, 1, 1, 1, 1, 1,
0.9417649, -0.1618223, 0.3843634, 1, 1, 1, 1, 1,
0.9420359, -1.809812, 2.978491, 1, 1, 1, 1, 1,
0.950648, 0.6272558, -0.1996458, 1, 1, 1, 1, 1,
0.9507251, -2.13182, 2.327017, 1, 1, 1, 1, 1,
0.9511917, 0.5605466, 1.744182, 1, 1, 1, 1, 1,
0.9653932, 0.05467318, 1.375818, 1, 1, 1, 1, 1,
0.9654917, -0.05549539, 1.282927, 1, 1, 1, 1, 1,
0.9720233, 0.2833494, 1.735628, 1, 1, 1, 1, 1,
0.9724262, 1.152926, 1.020893, 1, 1, 1, 1, 1,
0.9751236, 0.4745238, 1.048083, 1, 1, 1, 1, 1,
0.9776882, 0.5686526, 0.5794118, 0, 0, 1, 1, 1,
0.9792135, -0.5211317, 2.276158, 1, 0, 0, 1, 1,
0.9798622, 0.01637835, 0.7404884, 1, 0, 0, 1, 1,
0.9808758, 0.2414873, 0.6748998, 1, 0, 0, 1, 1,
0.9833713, 0.9355525, 0.9667379, 1, 0, 0, 1, 1,
0.9869528, -0.02743289, 3.669803, 1, 0, 0, 1, 1,
1.002099, -0.07867104, 1.537678, 0, 0, 0, 1, 1,
1.010468, 1.320375, 1.144252, 0, 0, 0, 1, 1,
1.014244, 0.1933188, 0.4058514, 0, 0, 0, 1, 1,
1.025454, 0.708962, 0.2721678, 0, 0, 0, 1, 1,
1.026409, -0.4081392, 1.788925, 0, 0, 0, 1, 1,
1.026672, -0.06484424, 1.631132, 0, 0, 0, 1, 1,
1.027598, -0.4808177, 1.916366, 0, 0, 0, 1, 1,
1.028221, -0.8503332, 1.386372, 1, 1, 1, 1, 1,
1.028995, 1.026609, 2.044309, 1, 1, 1, 1, 1,
1.032853, -1.365202, 3.658217, 1, 1, 1, 1, 1,
1.033546, 0.4797263, -0.8859912, 1, 1, 1, 1, 1,
1.039964, 1.212047, 0.2342718, 1, 1, 1, 1, 1,
1.04496, -1.865807, 3.305698, 1, 1, 1, 1, 1,
1.047611, 0.04047505, 1.116732, 1, 1, 1, 1, 1,
1.053191, 2.010463, 0.5085897, 1, 1, 1, 1, 1,
1.061449, -2.029409, 2.922701, 1, 1, 1, 1, 1,
1.06353, -1.308094, 2.895355, 1, 1, 1, 1, 1,
1.065657, -1.958877, 4.214261, 1, 1, 1, 1, 1,
1.070773, -0.513925, 3.454886, 1, 1, 1, 1, 1,
1.070801, -0.9800419, 2.715783, 1, 1, 1, 1, 1,
1.071377, 1.604191, 1.564985, 1, 1, 1, 1, 1,
1.074341, 0.5539337, 0.3725286, 1, 1, 1, 1, 1,
1.079779, -0.7622481, 1.337919, 0, 0, 1, 1, 1,
1.088459, 0.08250034, 1.187013, 1, 0, 0, 1, 1,
1.088504, 0.617487, 0.5848681, 1, 0, 0, 1, 1,
1.093136, 1.755781, 0.1030122, 1, 0, 0, 1, 1,
1.094694, 1.866111, 0.9372509, 1, 0, 0, 1, 1,
1.099621, 2.732503, 0.3244244, 1, 0, 0, 1, 1,
1.101041, -0.7701075, 2.105089, 0, 0, 0, 1, 1,
1.107619, 0.4939419, 1.346327, 0, 0, 0, 1, 1,
1.114497, 0.9286838, 2.610171, 0, 0, 0, 1, 1,
1.124512, -0.1679934, 1.604312, 0, 0, 0, 1, 1,
1.13051, -1.047923, 1.841635, 0, 0, 0, 1, 1,
1.131373, -0.8920334, 2.211382, 0, 0, 0, 1, 1,
1.135403, 0.1373138, 1.452058, 0, 0, 0, 1, 1,
1.139369, -0.7274328, 2.407388, 1, 1, 1, 1, 1,
1.143631, 1.258558, -0.3671928, 1, 1, 1, 1, 1,
1.145798, -0.5211088, 1.835258, 1, 1, 1, 1, 1,
1.147771, -0.1084665, 0.3424944, 1, 1, 1, 1, 1,
1.150653, -0.5568167, 3.123603, 1, 1, 1, 1, 1,
1.153653, -0.3665819, 2.490494, 1, 1, 1, 1, 1,
1.153996, 0.2450508, 0.8130957, 1, 1, 1, 1, 1,
1.170708, 0.4240095, -0.3847237, 1, 1, 1, 1, 1,
1.177463, -0.4470762, 1.478115, 1, 1, 1, 1, 1,
1.185135, 0.1813052, 0.08687404, 1, 1, 1, 1, 1,
1.185815, -1.308141, 1.766678, 1, 1, 1, 1, 1,
1.18721, -0.05043742, 3.13565, 1, 1, 1, 1, 1,
1.192508, 1.25135, 1.150785, 1, 1, 1, 1, 1,
1.201224, -0.2689264, 2.218484, 1, 1, 1, 1, 1,
1.202485, -0.1299084, 2.333972, 1, 1, 1, 1, 1,
1.206624, -0.9780458, 3.642459, 0, 0, 1, 1, 1,
1.207707, -0.03982791, 3.268776, 1, 0, 0, 1, 1,
1.210179, -1.048618, 3.61934, 1, 0, 0, 1, 1,
1.210585, -0.04189708, 0.5447729, 1, 0, 0, 1, 1,
1.212677, -0.320758, 1.988981, 1, 0, 0, 1, 1,
1.22187, -0.5826533, 2.475205, 1, 0, 0, 1, 1,
1.222478, -0.2680181, 2.806852, 0, 0, 0, 1, 1,
1.227321, -2.040487, 0.09191122, 0, 0, 0, 1, 1,
1.231957, -0.2313358, 0.5207177, 0, 0, 0, 1, 1,
1.232767, -0.4684498, 4.347644, 0, 0, 0, 1, 1,
1.233331, 0.6282598, 1.385873, 0, 0, 0, 1, 1,
1.238494, 0.8806238, -0.3185548, 0, 0, 0, 1, 1,
1.241252, 0.6155487, 0.9016378, 0, 0, 0, 1, 1,
1.252927, 1.337176, 0.7736647, 1, 1, 1, 1, 1,
1.255116, 0.6826022, 2.722883, 1, 1, 1, 1, 1,
1.276211, -0.4686608, 3.572048, 1, 1, 1, 1, 1,
1.279241, 2.582504, -0.01240761, 1, 1, 1, 1, 1,
1.302386, -0.3546825, 2.07167, 1, 1, 1, 1, 1,
1.305222, -0.9397779, 1.660714, 1, 1, 1, 1, 1,
1.306952, -1.258925, 1.964118, 1, 1, 1, 1, 1,
1.317112, 2.509512, 0.5835759, 1, 1, 1, 1, 1,
1.321717, 1.507606, 1.11831, 1, 1, 1, 1, 1,
1.323507, -1.219365, 1.133095, 1, 1, 1, 1, 1,
1.329249, 0.5379344, 1.826989, 1, 1, 1, 1, 1,
1.337969, 0.4909632, 1.528026, 1, 1, 1, 1, 1,
1.356985, -1.356355, 1.288465, 1, 1, 1, 1, 1,
1.363006, 1.939984, 0.1373657, 1, 1, 1, 1, 1,
1.364789, -1.838794, 1.955097, 1, 1, 1, 1, 1,
1.367149, 0.3996687, 0.1144972, 0, 0, 1, 1, 1,
1.372633, 0.06031317, 1.704715, 1, 0, 0, 1, 1,
1.373902, 2.84639, -1.163249, 1, 0, 0, 1, 1,
1.381541, -1.478747, 1.206038, 1, 0, 0, 1, 1,
1.38192, -1.65954, 2.871426, 1, 0, 0, 1, 1,
1.382434, 1.234401, -0.4406799, 1, 0, 0, 1, 1,
1.3856, 1.495574, -0.5405059, 0, 0, 0, 1, 1,
1.393463, -1.359758, 0.9409788, 0, 0, 0, 1, 1,
1.401536, 2.039412, 1.68628, 0, 0, 0, 1, 1,
1.416006, -0.7377898, 3.669964, 0, 0, 0, 1, 1,
1.416121, -0.3845199, 0.9217062, 0, 0, 0, 1, 1,
1.417272, -0.5630697, 1.796247, 0, 0, 0, 1, 1,
1.428882, -0.5852851, 2.931833, 0, 0, 0, 1, 1,
1.430585, 0.5366216, 0.7429933, 1, 1, 1, 1, 1,
1.447659, -0.8813302, 2.192634, 1, 1, 1, 1, 1,
1.453099, 0.1170598, 1.652977, 1, 1, 1, 1, 1,
1.45603, -0.6834176, 2.903118, 1, 1, 1, 1, 1,
1.461598, -0.4557292, 1.484086, 1, 1, 1, 1, 1,
1.464049, 1.412318, 0.001347466, 1, 1, 1, 1, 1,
1.470233, -1.225736, 1.056966, 1, 1, 1, 1, 1,
1.481908, 0.5098359, 0.1914252, 1, 1, 1, 1, 1,
1.490103, -0.6689785, 1.444443, 1, 1, 1, 1, 1,
1.492868, 0.2952429, 1.329111, 1, 1, 1, 1, 1,
1.497372, -0.7903893, 1.028778, 1, 1, 1, 1, 1,
1.506288, 0.5587156, 2.427283, 1, 1, 1, 1, 1,
1.523881, 0.1722074, 1.230963, 1, 1, 1, 1, 1,
1.524508, -2.134661, 2.694861, 1, 1, 1, 1, 1,
1.528798, 1.343261, 0.1880696, 1, 1, 1, 1, 1,
1.532158, -0.2778572, 3.033565, 0, 0, 1, 1, 1,
1.535885, 0.2023585, 2.614437, 1, 0, 0, 1, 1,
1.536491, -0.272097, 2.071083, 1, 0, 0, 1, 1,
1.550769, 0.3458508, 1.940664, 1, 0, 0, 1, 1,
1.555396, 0.2381803, 0.8258461, 1, 0, 0, 1, 1,
1.556233, -0.136959, 2.68582, 1, 0, 0, 1, 1,
1.565113, -0.8144028, 2.907622, 0, 0, 0, 1, 1,
1.572458, 0.6296636, 2.115825, 0, 0, 0, 1, 1,
1.586577, -0.2163289, 1.907737, 0, 0, 0, 1, 1,
1.591995, 0.7814541, 2.502969, 0, 0, 0, 1, 1,
1.609204, 0.1000293, -0.3216587, 0, 0, 0, 1, 1,
1.62293, 2.249299, 1.426813, 0, 0, 0, 1, 1,
1.626337, -0.688525, 3.365754, 0, 0, 0, 1, 1,
1.64137, 0.3490493, 1.366748, 1, 1, 1, 1, 1,
1.64369, -0.8494537, 3.260526, 1, 1, 1, 1, 1,
1.651602, 0.3366162, 0.6601686, 1, 1, 1, 1, 1,
1.658362, 1.185495, 3.673805, 1, 1, 1, 1, 1,
1.659491, -0.2883046, 0.3621071, 1, 1, 1, 1, 1,
1.685444, 0.855076, 0.48543, 1, 1, 1, 1, 1,
1.704312, -0.7890447, 3.302808, 1, 1, 1, 1, 1,
1.705474, 1.883776, 1.828121, 1, 1, 1, 1, 1,
1.724074, 0.07046063, 0.7697808, 1, 1, 1, 1, 1,
1.725485, 0.8611714, 1.848207, 1, 1, 1, 1, 1,
1.735411, -0.5119425, 1.871648, 1, 1, 1, 1, 1,
1.746682, 1.573302, 0.1634773, 1, 1, 1, 1, 1,
1.749916, 0.831834, 1.828027, 1, 1, 1, 1, 1,
1.752774, -0.4918606, 1.675558, 1, 1, 1, 1, 1,
1.765301, -0.02316498, 3.206244, 1, 1, 1, 1, 1,
1.788256, -1.421569, 1.346307, 0, 0, 1, 1, 1,
1.794078, 1.154106, 1.087007, 1, 0, 0, 1, 1,
1.798752, -1.320456, 2.296999, 1, 0, 0, 1, 1,
1.800326, 0.6930562, 2.032587, 1, 0, 0, 1, 1,
1.806005, -0.3236052, 0.5062433, 1, 0, 0, 1, 1,
1.810503, 0.3592008, 1.50502, 1, 0, 0, 1, 1,
1.824227, -0.02858028, 1.810741, 0, 0, 0, 1, 1,
1.842772, 0.5962664, -0.12519, 0, 0, 0, 1, 1,
1.870697, -0.02495584, 0.08234501, 0, 0, 0, 1, 1,
1.882151, 2.723988, 1.594088, 0, 0, 0, 1, 1,
1.889614, 0.3226164, 1.5759, 0, 0, 0, 1, 1,
1.913324, 0.2292515, 3.348637, 0, 0, 0, 1, 1,
1.920818, 2.346066, 0.6336654, 0, 0, 0, 1, 1,
1.921747, 0.4237589, -0.4125861, 1, 1, 1, 1, 1,
1.965785, 1.898185, -0.4484922, 1, 1, 1, 1, 1,
1.984205, 0.4040854, 1.060973, 1, 1, 1, 1, 1,
1.989338, -1.464916, 2.314371, 1, 1, 1, 1, 1,
1.989526, -1.219611, 1.393746, 1, 1, 1, 1, 1,
2.00416, -0.3835679, 2.145841, 1, 1, 1, 1, 1,
2.006003, 1.077007, 0.3228394, 1, 1, 1, 1, 1,
2.016532, 0.5585839, 0.1701893, 1, 1, 1, 1, 1,
2.027922, -0.6310212, 1.822028, 1, 1, 1, 1, 1,
2.041388, 1.779875, -0.3444247, 1, 1, 1, 1, 1,
2.046718, -0.4771388, 2.067468, 1, 1, 1, 1, 1,
2.050267, 0.894586, -0.8452491, 1, 1, 1, 1, 1,
2.101608, 0.1123032, 1.649457, 1, 1, 1, 1, 1,
2.110329, 1.529585, -0.3231463, 1, 1, 1, 1, 1,
2.120162, -1.702169, 2.568172, 1, 1, 1, 1, 1,
2.177825, -2.509856, 3.944237, 0, 0, 1, 1, 1,
2.182464, 0.7708527, 3.100032, 1, 0, 0, 1, 1,
2.245673, 0.2048399, 0.02142497, 1, 0, 0, 1, 1,
2.279273, 0.7816232, 1.721824, 1, 0, 0, 1, 1,
2.306012, -0.7964655, 2.91251, 1, 0, 0, 1, 1,
2.338657, 2.092559, 0.233312, 1, 0, 0, 1, 1,
2.362282, 0.7540733, 3.704578, 0, 0, 0, 1, 1,
2.369739, 0.5337803, 3.049828, 0, 0, 0, 1, 1,
2.457764, 1.631041, 0.9358963, 0, 0, 0, 1, 1,
2.46281, 0.6874412, 3.674838, 0, 0, 0, 1, 1,
2.509125, -1.293617, 1.747245, 0, 0, 0, 1, 1,
2.527859, 2.532765, 0.905286, 0, 0, 0, 1, 1,
2.550055, 0.4470713, 1.210785, 0, 0, 0, 1, 1,
2.570879, 1.088721, 0.2770338, 1, 1, 1, 1, 1,
2.599603, 2.116706, 1.808767, 1, 1, 1, 1, 1,
2.805053, -0.9036781, 1.202359, 1, 1, 1, 1, 1,
2.831456, -0.920145, 0.8917304, 1, 1, 1, 1, 1,
2.912463, 1.281002, 1.120633, 1, 1, 1, 1, 1,
3.232934, 1.480919, 1.026009, 1, 1, 1, 1, 1,
3.372432, 1.215642, 2.278122, 1, 1, 1, 1, 1
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
var radius = 9.290876;
var distance = 32.63381;
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
mvMatrix.translate( -0.2165546, 0.1006553, 0.5654609 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.63381);
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
