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
-3.714617, 0.07888647, -1.042844, 1, 0, 0, 1,
-2.882425, 0.6212283, 0.8536232, 1, 0.007843138, 0, 1,
-2.739377, 0.1934127, -3.671378, 1, 0.01176471, 0, 1,
-2.622656, 0.08453195, -2.24169, 1, 0.01960784, 0, 1,
-2.568755, 0.248201, -1.437144, 1, 0.02352941, 0, 1,
-2.407731, -0.1904669, -2.818165, 1, 0.03137255, 0, 1,
-2.404823, 2.350703, -0.978485, 1, 0.03529412, 0, 1,
-2.356193, -0.8194537, -2.312791, 1, 0.04313726, 0, 1,
-2.308104, -0.7192861, -0.7642333, 1, 0.04705882, 0, 1,
-2.29324, -1.23241, -3.592395, 1, 0.05490196, 0, 1,
-2.245035, 0.08343653, -1.397098, 1, 0.05882353, 0, 1,
-2.239059, -3.148308, -4.456563, 1, 0.06666667, 0, 1,
-2.230775, -0.3885113, -2.896253, 1, 0.07058824, 0, 1,
-2.226881, -1.042881, -0.9809787, 1, 0.07843138, 0, 1,
-2.216639, 0.6113599, -1.969059, 1, 0.08235294, 0, 1,
-2.202497, -1.503331, -2.424521, 1, 0.09019608, 0, 1,
-2.192358, 1.25697, -0.1333909, 1, 0.09411765, 0, 1,
-2.189686, 0.2942377, -0.6690612, 1, 0.1019608, 0, 1,
-2.133661, -0.5353369, -0.9987199, 1, 0.1098039, 0, 1,
-2.113204, -1.047456, -2.395061, 1, 0.1137255, 0, 1,
-2.103703, -0.128006, -1.936824, 1, 0.1215686, 0, 1,
-2.101616, 1.097525, -3.510256, 1, 0.1254902, 0, 1,
-2.080519, 0.3219281, -1.283534, 1, 0.1333333, 0, 1,
-2.071416, 1.175484, -0.6532221, 1, 0.1372549, 0, 1,
-1.982942, -1.163208, -1.773437, 1, 0.145098, 0, 1,
-1.978099, 1.08616, 0.02349076, 1, 0.1490196, 0, 1,
-1.965527, 0.7359397, -1.514714, 1, 0.1568628, 0, 1,
-1.953358, -0.3653341, -1.539777, 1, 0.1607843, 0, 1,
-1.946736, 0.1394399, -1.433879, 1, 0.1686275, 0, 1,
-1.936225, -0.03235488, -1.289759, 1, 0.172549, 0, 1,
-1.913236, -0.1517575, -3.127153, 1, 0.1803922, 0, 1,
-1.902931, 0.9734406, -1.73271, 1, 0.1843137, 0, 1,
-1.898077, -1.846556, -2.693628, 1, 0.1921569, 0, 1,
-1.853424, -0.05408324, -2.339932, 1, 0.1960784, 0, 1,
-1.84852, 0.9145425, -1.781471, 1, 0.2039216, 0, 1,
-1.827937, -0.9674885, -1.378166, 1, 0.2117647, 0, 1,
-1.812356, -0.3909626, -1.51775, 1, 0.2156863, 0, 1,
-1.812142, 0.1032495, -0.4125442, 1, 0.2235294, 0, 1,
-1.804113, 1.750364, -1.209596, 1, 0.227451, 0, 1,
-1.784373, 0.7547449, -0.7271224, 1, 0.2352941, 0, 1,
-1.775515, -0.636414, -0.8546954, 1, 0.2392157, 0, 1,
-1.754058, -0.4717615, -2.984643, 1, 0.2470588, 0, 1,
-1.733904, -1.390851, -2.405646, 1, 0.2509804, 0, 1,
-1.733001, 0.2529274, -1.694241, 1, 0.2588235, 0, 1,
-1.727693, -0.6241663, -1.992118, 1, 0.2627451, 0, 1,
-1.638936, -0.08423737, -0.6780441, 1, 0.2705882, 0, 1,
-1.638444, -1.182802, -0.5835537, 1, 0.2745098, 0, 1,
-1.630168, 0.9651936, -2.247839, 1, 0.282353, 0, 1,
-1.624319, -1.22516, -3.301184, 1, 0.2862745, 0, 1,
-1.621874, -0.1179168, -3.183362, 1, 0.2941177, 0, 1,
-1.610425, 0.9634739, -0.3504511, 1, 0.3019608, 0, 1,
-1.608248, 0.6368413, -1.360153, 1, 0.3058824, 0, 1,
-1.596238, 1.243037, 2.084142, 1, 0.3137255, 0, 1,
-1.594362, 0.8948972, -1.086208, 1, 0.3176471, 0, 1,
-1.57537, 1.112782, -0.1634654, 1, 0.3254902, 0, 1,
-1.574993, -0.9192941, -1.350701, 1, 0.3294118, 0, 1,
-1.555786, 0.3036954, 0.1940963, 1, 0.3372549, 0, 1,
-1.545804, 0.4764305, -1.8188, 1, 0.3411765, 0, 1,
-1.535916, 0.05132922, -0.04291398, 1, 0.3490196, 0, 1,
-1.532103, 0.1059329, -2.26613, 1, 0.3529412, 0, 1,
-1.531494, 0.1808753, -0.6577057, 1, 0.3607843, 0, 1,
-1.529892, -0.8829536, -2.218106, 1, 0.3647059, 0, 1,
-1.528421, -0.05697994, -1.124474, 1, 0.372549, 0, 1,
-1.522188, -0.1028924, -2.189758, 1, 0.3764706, 0, 1,
-1.511734, -1.04314, -1.057157, 1, 0.3843137, 0, 1,
-1.486311, 0.5751653, -1.430672, 1, 0.3882353, 0, 1,
-1.484745, -0.2595538, 0.05702425, 1, 0.3960784, 0, 1,
-1.470725, -1.351957, -3.430256, 1, 0.4039216, 0, 1,
-1.46727, 0.08113153, -2.546239, 1, 0.4078431, 0, 1,
-1.446418, 1.414476, -1.887394, 1, 0.4156863, 0, 1,
-1.426558, 0.9302122, -1.279583, 1, 0.4196078, 0, 1,
-1.419659, 0.4351282, -1.368758, 1, 0.427451, 0, 1,
-1.407969, 0.6163806, -1.074967, 1, 0.4313726, 0, 1,
-1.403261, 1.063173, 1.307414, 1, 0.4392157, 0, 1,
-1.400261, -0.414592, -2.502085, 1, 0.4431373, 0, 1,
-1.390565, -0.1720346, -1.002114, 1, 0.4509804, 0, 1,
-1.384052, -1.478142, -3.707032, 1, 0.454902, 0, 1,
-1.382511, 0.7836962, -1.104886, 1, 0.4627451, 0, 1,
-1.381035, 0.7003914, -0.7981526, 1, 0.4666667, 0, 1,
-1.377055, -0.9235578, -3.76689, 1, 0.4745098, 0, 1,
-1.365262, 1.744697, -0.5918835, 1, 0.4784314, 0, 1,
-1.36109, 0.5947885, 0.7857395, 1, 0.4862745, 0, 1,
-1.349101, -0.1018523, -1.944687, 1, 0.4901961, 0, 1,
-1.339968, -0.4500147, -2.417936, 1, 0.4980392, 0, 1,
-1.31945, -0.7066116, -1.058739, 1, 0.5058824, 0, 1,
-1.314152, -1.559841, -0.6427332, 1, 0.509804, 0, 1,
-1.310471, 0.3097818, -0.3622546, 1, 0.5176471, 0, 1,
-1.31031, 1.047465, -0.8207605, 1, 0.5215687, 0, 1,
-1.293286, -0.001019477, -0.7420393, 1, 0.5294118, 0, 1,
-1.291265, 1.376272, -0.05431296, 1, 0.5333334, 0, 1,
-1.28594, 1.141229, -1.082927, 1, 0.5411765, 0, 1,
-1.277634, 0.4370348, -2.569165, 1, 0.5450981, 0, 1,
-1.274431, -1.653277, -2.542658, 1, 0.5529412, 0, 1,
-1.273281, -0.3058619, -0.8666648, 1, 0.5568628, 0, 1,
-1.269367, -0.8553178, -1.449379, 1, 0.5647059, 0, 1,
-1.268035, 0.6158935, -0.5108571, 1, 0.5686275, 0, 1,
-1.266802, -0.1230197, -0.4159087, 1, 0.5764706, 0, 1,
-1.260924, -0.1938707, -1.207705, 1, 0.5803922, 0, 1,
-1.257261, -1.105564, -2.268232, 1, 0.5882353, 0, 1,
-1.247218, 0.7345095, -1.184132, 1, 0.5921569, 0, 1,
-1.243913, -0.06917375, -1.216046, 1, 0.6, 0, 1,
-1.24337, 0.3831076, -0.4008763, 1, 0.6078432, 0, 1,
-1.235101, 1.19941, -1.612332, 1, 0.6117647, 0, 1,
-1.232745, 1.870548, -0.2333556, 1, 0.6196079, 0, 1,
-1.23063, 0.7689855, -1.318488, 1, 0.6235294, 0, 1,
-1.230485, -0.1274785, -2.698857, 1, 0.6313726, 0, 1,
-1.222258, 0.8645457, -1.58221, 1, 0.6352941, 0, 1,
-1.211295, -0.1403034, -1.716019, 1, 0.6431373, 0, 1,
-1.210567, 0.009674455, -0.8586114, 1, 0.6470588, 0, 1,
-1.208568, -0.6870171, -0.1253981, 1, 0.654902, 0, 1,
-1.206965, -0.2489378, -0.4551147, 1, 0.6588235, 0, 1,
-1.206052, -0.7267869, -4.119968, 1, 0.6666667, 0, 1,
-1.20277, -0.05990554, -2.209766, 1, 0.6705883, 0, 1,
-1.196447, 0.9898355, -1.712744, 1, 0.6784314, 0, 1,
-1.194456, 1.441129, 0.5523067, 1, 0.682353, 0, 1,
-1.181758, 0.3471337, -1.320982, 1, 0.6901961, 0, 1,
-1.181633, -1.253186, -3.991988, 1, 0.6941177, 0, 1,
-1.180583, -0.2028628, -0.7570432, 1, 0.7019608, 0, 1,
-1.167114, -0.5479748, -0.6570783, 1, 0.7098039, 0, 1,
-1.164994, -1.480157, -3.174449, 1, 0.7137255, 0, 1,
-1.163902, -0.7628901, -2.535991, 1, 0.7215686, 0, 1,
-1.16188, -0.06594633, -1.779687, 1, 0.7254902, 0, 1,
-1.161261, -1.31686, -2.434898, 1, 0.7333333, 0, 1,
-1.151845, -0.7442631, -2.472719, 1, 0.7372549, 0, 1,
-1.151628, -0.006178661, -1.108002, 1, 0.7450981, 0, 1,
-1.15136, -0.1945657, -4.003858, 1, 0.7490196, 0, 1,
-1.148664, 0.1120367, -1.921238, 1, 0.7568628, 0, 1,
-1.148392, 0.09580976, -0.363606, 1, 0.7607843, 0, 1,
-1.146503, -0.3852095, -3.944319, 1, 0.7686275, 0, 1,
-1.141656, 1.15854, -2.091877, 1, 0.772549, 0, 1,
-1.141427, -0.3642982, -1.268949, 1, 0.7803922, 0, 1,
-1.125224, 2.040597, -0.3496353, 1, 0.7843137, 0, 1,
-1.123711, -0.5129366, -2.476566, 1, 0.7921569, 0, 1,
-1.121916, -1.076234, -2.640892, 1, 0.7960784, 0, 1,
-1.11093, 0.7427166, -0.6830078, 1, 0.8039216, 0, 1,
-1.103662, 1.271706, -0.5096265, 1, 0.8117647, 0, 1,
-1.094702, -0.376118, -2.647936, 1, 0.8156863, 0, 1,
-1.086099, -1.503101, -3.67508, 1, 0.8235294, 0, 1,
-1.084017, 0.2602562, -1.903676, 1, 0.827451, 0, 1,
-1.079408, 2.179658, -0.327594, 1, 0.8352941, 0, 1,
-1.078515, 1.022622, 0.6896783, 1, 0.8392157, 0, 1,
-1.076748, -0.009357276, -1.657013, 1, 0.8470588, 0, 1,
-1.064628, -1.583711, -2.134522, 1, 0.8509804, 0, 1,
-1.063218, -1.663524, -2.853605, 1, 0.8588235, 0, 1,
-1.055034, -0.9710303, -0.6163875, 1, 0.8627451, 0, 1,
-1.045072, -0.1778189, -2.12411, 1, 0.8705882, 0, 1,
-1.038444, 0.002913319, 0.06989249, 1, 0.8745098, 0, 1,
-1.004064, 0.008517855, -2.032669, 1, 0.8823529, 0, 1,
-0.9995708, -1.67449, -0.2302903, 1, 0.8862745, 0, 1,
-0.9976876, 0.1715916, -2.98449, 1, 0.8941177, 0, 1,
-0.9930139, -0.401167, -1.411941, 1, 0.8980392, 0, 1,
-0.9925892, -1.110458, -2.896597, 1, 0.9058824, 0, 1,
-0.9873083, 0.7795672, -0.09215668, 1, 0.9137255, 0, 1,
-0.9856081, 0.1403085, -1.624666, 1, 0.9176471, 0, 1,
-0.9852007, -0.0297618, -1.788643, 1, 0.9254902, 0, 1,
-0.9847798, 0.3877091, -0.3680843, 1, 0.9294118, 0, 1,
-0.9722782, 0.6486604, -2.626928, 1, 0.9372549, 0, 1,
-0.9661238, -1.186051, -2.95005, 1, 0.9411765, 0, 1,
-0.9661027, 0.7102432, -1.280847, 1, 0.9490196, 0, 1,
-0.9634894, 0.6543612, -1.438956, 1, 0.9529412, 0, 1,
-0.9591023, 0.7732731, -2.192135, 1, 0.9607843, 0, 1,
-0.9587631, 0.315543, 0.2125369, 1, 0.9647059, 0, 1,
-0.9564224, -0.8616969, -1.642902, 1, 0.972549, 0, 1,
-0.9454846, -0.5810373, -2.2972, 1, 0.9764706, 0, 1,
-0.9431631, -0.6349571, -2.632574, 1, 0.9843137, 0, 1,
-0.9296874, 2.084145, 0.2998575, 1, 0.9882353, 0, 1,
-0.9246234, 0.9755502, 0.1852575, 1, 0.9960784, 0, 1,
-0.9191907, -0.6534769, -1.209448, 0.9960784, 1, 0, 1,
-0.9167141, -0.415511, -1.559491, 0.9921569, 1, 0, 1,
-0.9116994, 0.1570423, -0.5031323, 0.9843137, 1, 0, 1,
-0.9043447, 0.2644942, -1.965563, 0.9803922, 1, 0, 1,
-0.9028118, -0.8282785, -1.301262, 0.972549, 1, 0, 1,
-0.8996921, -0.8485909, -1.269924, 0.9686275, 1, 0, 1,
-0.896781, -0.04589253, -1.710358, 0.9607843, 1, 0, 1,
-0.8949615, -0.0698013, -2.193026, 0.9568627, 1, 0, 1,
-0.8938114, 0.47249, -0.5564947, 0.9490196, 1, 0, 1,
-0.8909045, 0.3799585, -2.092063, 0.945098, 1, 0, 1,
-0.8906697, 0.271656, -1.230952, 0.9372549, 1, 0, 1,
-0.8888342, -0.1932602, -0.007439489, 0.9333333, 1, 0, 1,
-0.8846173, 1.052786, -0.8776542, 0.9254902, 1, 0, 1,
-0.8833982, 0.5131774, 0.3380586, 0.9215686, 1, 0, 1,
-0.8815972, -1.031691, -1.073817, 0.9137255, 1, 0, 1,
-0.8780507, 0.04413456, -0.4967312, 0.9098039, 1, 0, 1,
-0.8677973, 0.9014997, -0.1406753, 0.9019608, 1, 0, 1,
-0.8669525, -0.6127802, -1.15267, 0.8941177, 1, 0, 1,
-0.8650215, -0.8473228, -3.49433, 0.8901961, 1, 0, 1,
-0.8588955, 0.7381135, -0.3305292, 0.8823529, 1, 0, 1,
-0.8579677, -0.3151644, -2.35171, 0.8784314, 1, 0, 1,
-0.8552276, -1.940248, -3.962984, 0.8705882, 1, 0, 1,
-0.8548768, -0.2319039, -1.171083, 0.8666667, 1, 0, 1,
-0.8530878, 0.07176559, -2.186118, 0.8588235, 1, 0, 1,
-0.8503917, -0.06251647, -1.539213, 0.854902, 1, 0, 1,
-0.8498227, 0.5848387, -2.524182, 0.8470588, 1, 0, 1,
-0.844265, -1.440346, -1.78017, 0.8431373, 1, 0, 1,
-0.8413836, -0.6307776, -2.071696, 0.8352941, 1, 0, 1,
-0.8408446, -0.57804, -2.095413, 0.8313726, 1, 0, 1,
-0.83714, -0.2329829, -1.509592, 0.8235294, 1, 0, 1,
-0.834581, 2.405725, -2.217428, 0.8196079, 1, 0, 1,
-0.82966, -0.3079707, -1.412881, 0.8117647, 1, 0, 1,
-0.8260427, -1.067196, -1.898297, 0.8078431, 1, 0, 1,
-0.8209008, 1.40204, 0.7189323, 0.8, 1, 0, 1,
-0.8200406, -0.308552, -0.4800133, 0.7921569, 1, 0, 1,
-0.8197666, 1.955261, 1.0231, 0.7882353, 1, 0, 1,
-0.8196732, 0.9845205, -0.4248044, 0.7803922, 1, 0, 1,
-0.8128381, -1.209485, -4.89867, 0.7764706, 1, 0, 1,
-0.7996902, -0.1815794, -3.164678, 0.7686275, 1, 0, 1,
-0.7994795, 0.8058646, -0.4150352, 0.7647059, 1, 0, 1,
-0.7884279, 0.3124372, -0.3994805, 0.7568628, 1, 0, 1,
-0.7816471, 1.572742, -1.315445, 0.7529412, 1, 0, 1,
-0.7800443, -0.5474252, -2.69054, 0.7450981, 1, 0, 1,
-0.779605, -1.782426, -1.228715, 0.7411765, 1, 0, 1,
-0.7770015, -0.1412367, -0.479229, 0.7333333, 1, 0, 1,
-0.7694833, 2.201333, -0.5084196, 0.7294118, 1, 0, 1,
-0.7608091, 0.6019168, -0.459337, 0.7215686, 1, 0, 1,
-0.7581629, -0.05160454, -1.268297, 0.7176471, 1, 0, 1,
-0.7579329, -1.829209, -3.063607, 0.7098039, 1, 0, 1,
-0.7546015, 0.5642325, -0.8213174, 0.7058824, 1, 0, 1,
-0.7538332, -1.524632, -4.423916, 0.6980392, 1, 0, 1,
-0.7528562, -0.9713155, -3.102269, 0.6901961, 1, 0, 1,
-0.7449988, 1.383377, -2.123823, 0.6862745, 1, 0, 1,
-0.7415461, 0.377555, 0.04637102, 0.6784314, 1, 0, 1,
-0.7413133, 0.2020065, -1.15442, 0.6745098, 1, 0, 1,
-0.7393006, -0.9803414, -2.730979, 0.6666667, 1, 0, 1,
-0.7340283, -0.7661324, -2.736717, 0.6627451, 1, 0, 1,
-0.7324011, 0.9778696, -1.542729, 0.654902, 1, 0, 1,
-0.7195991, 0.5683135, -0.9791241, 0.6509804, 1, 0, 1,
-0.714954, -0.9583457, -3.771418, 0.6431373, 1, 0, 1,
-0.7137864, -1.462246, -1.769789, 0.6392157, 1, 0, 1,
-0.7097975, -1.161408, -3.380618, 0.6313726, 1, 0, 1,
-0.709255, -0.7925313, -1.941903, 0.627451, 1, 0, 1,
-0.6998017, 1.261784, -1.93058, 0.6196079, 1, 0, 1,
-0.6930816, 0.9285906, -1.603528, 0.6156863, 1, 0, 1,
-0.6850819, -0.05099733, -0.7417552, 0.6078432, 1, 0, 1,
-0.6766596, 1.126809, -2.728391, 0.6039216, 1, 0, 1,
-0.6679342, -0.5175763, -2.811784, 0.5960785, 1, 0, 1,
-0.6649875, 0.5164818, -0.6288933, 0.5882353, 1, 0, 1,
-0.6608984, -0.7726652, -2.603745, 0.5843138, 1, 0, 1,
-0.650197, -0.6991965, -2.575268, 0.5764706, 1, 0, 1,
-0.6466276, 0.4880838, -1.194017, 0.572549, 1, 0, 1,
-0.6351224, 0.1478552, -0.7460362, 0.5647059, 1, 0, 1,
-0.6337643, 0.3178348, -0.7264296, 0.5607843, 1, 0, 1,
-0.6298153, 0.3107683, -1.1697, 0.5529412, 1, 0, 1,
-0.6297324, -0.4930057, -2.890858, 0.5490196, 1, 0, 1,
-0.6205624, -0.3024665, -1.414781, 0.5411765, 1, 0, 1,
-0.6175127, -1.525198, -3.568087, 0.5372549, 1, 0, 1,
-0.5905609, -0.001024166, -1.771438, 0.5294118, 1, 0, 1,
-0.5884046, 0.6274477, -1.005567, 0.5254902, 1, 0, 1,
-0.5813154, -0.1733403, -1.906137, 0.5176471, 1, 0, 1,
-0.5787138, 0.3644788, -1.217883, 0.5137255, 1, 0, 1,
-0.5722186, 1.034423, -1.022497, 0.5058824, 1, 0, 1,
-0.5652618, -1.648136, -1.114287, 0.5019608, 1, 0, 1,
-0.5613683, 1.224009, -0.2008431, 0.4941176, 1, 0, 1,
-0.5584088, 0.9668847, -0.3670697, 0.4862745, 1, 0, 1,
-0.5567313, -1.55079, -2.079207, 0.4823529, 1, 0, 1,
-0.5562866, 1.54791, -1.875923, 0.4745098, 1, 0, 1,
-0.5560297, 0.392286, -0.8861105, 0.4705882, 1, 0, 1,
-0.5524835, 1.379915, 0.4976458, 0.4627451, 1, 0, 1,
-0.5493154, 0.359681, -0.4342698, 0.4588235, 1, 0, 1,
-0.5473907, 0.1818689, -2.754458, 0.4509804, 1, 0, 1,
-0.5470689, -0.3867475, -3.328584, 0.4470588, 1, 0, 1,
-0.5458823, 0.6644269, -0.4394474, 0.4392157, 1, 0, 1,
-0.5279202, 0.4765138, -0.7749593, 0.4352941, 1, 0, 1,
-0.5226579, 1.743735, -0.5783621, 0.427451, 1, 0, 1,
-0.5217621, -0.01530857, -1.785437, 0.4235294, 1, 0, 1,
-0.5217377, -2.897155, -2.03306, 0.4156863, 1, 0, 1,
-0.5205748, 1.446653, -1.59833, 0.4117647, 1, 0, 1,
-0.5150695, 0.1437265, -2.130872, 0.4039216, 1, 0, 1,
-0.5149279, -0.1471848, -2.976913, 0.3960784, 1, 0, 1,
-0.5145029, 0.7421454, -1.548186, 0.3921569, 1, 0, 1,
-0.5107453, 0.3632798, -2.099849, 0.3843137, 1, 0, 1,
-0.5093696, -1.531003, -2.243414, 0.3803922, 1, 0, 1,
-0.5058508, 0.589899, -0.3491104, 0.372549, 1, 0, 1,
-0.5052106, -0.3652211, -2.473085, 0.3686275, 1, 0, 1,
-0.5050167, -0.4254105, -2.185612, 0.3607843, 1, 0, 1,
-0.5041643, -1.225718, -1.422693, 0.3568628, 1, 0, 1,
-0.5032274, -1.777269, -0.4386197, 0.3490196, 1, 0, 1,
-0.502264, -1.506503, -4.630337, 0.345098, 1, 0, 1,
-0.4985802, 0.4085664, -0.7905473, 0.3372549, 1, 0, 1,
-0.4976697, 0.8244686, -0.5625941, 0.3333333, 1, 0, 1,
-0.4975103, 0.7402132, -0.5016407, 0.3254902, 1, 0, 1,
-0.4893005, -0.4694607, -2.110045, 0.3215686, 1, 0, 1,
-0.488907, 1.243814, 2.063904, 0.3137255, 1, 0, 1,
-0.4881043, -1.27607, -4.057118, 0.3098039, 1, 0, 1,
-0.4868248, -0.7023821, -1.397457, 0.3019608, 1, 0, 1,
-0.4840193, -1.402463, -2.664113, 0.2941177, 1, 0, 1,
-0.4807121, 0.9767187, 0.4472037, 0.2901961, 1, 0, 1,
-0.4801474, 1.843063, -1.601361, 0.282353, 1, 0, 1,
-0.4789369, -0.8349048, -1.925444, 0.2784314, 1, 0, 1,
-0.4773526, 2.03155, 0.2542095, 0.2705882, 1, 0, 1,
-0.4757815, -0.787376, -4.904885, 0.2666667, 1, 0, 1,
-0.4726317, -0.5115072, -3.189795, 0.2588235, 1, 0, 1,
-0.4698831, 0.8340269, -0.372716, 0.254902, 1, 0, 1,
-0.4690071, -0.5034893, -2.690745, 0.2470588, 1, 0, 1,
-0.4689503, 0.1526818, -1.331579, 0.2431373, 1, 0, 1,
-0.4648519, 0.4433742, -0.6617342, 0.2352941, 1, 0, 1,
-0.4640749, 1.42222, -1.644968, 0.2313726, 1, 0, 1,
-0.4604072, 0.7628315, 0.124852, 0.2235294, 1, 0, 1,
-0.4569148, 0.4217294, 0.4946459, 0.2196078, 1, 0, 1,
-0.4481634, 0.525642, -0.1444644, 0.2117647, 1, 0, 1,
-0.4384403, 1.169393, -1.746343, 0.2078431, 1, 0, 1,
-0.4332823, -0.9576531, -1.248716, 0.2, 1, 0, 1,
-0.4253948, -0.725042, -1.072147, 0.1921569, 1, 0, 1,
-0.4175972, -0.2851517, -2.048508, 0.1882353, 1, 0, 1,
-0.4172757, -0.1629353, -2.992905, 0.1803922, 1, 0, 1,
-0.4083989, -0.7283774, -2.979839, 0.1764706, 1, 0, 1,
-0.4083261, 0.7517361, -0.2816695, 0.1686275, 1, 0, 1,
-0.4058872, -0.158325, -2.029534, 0.1647059, 1, 0, 1,
-0.404159, -0.1862071, -1.339209, 0.1568628, 1, 0, 1,
-0.4028763, 0.5467708, -0.8913063, 0.1529412, 1, 0, 1,
-0.4028741, -0.6999414, -2.75942, 0.145098, 1, 0, 1,
-0.4003105, -0.5617303, -1.44943, 0.1411765, 1, 0, 1,
-0.3994961, 0.7670661, 0.2017937, 0.1333333, 1, 0, 1,
-0.3927063, -0.07076066, -1.880742, 0.1294118, 1, 0, 1,
-0.3821805, -0.9267523, -3.976646, 0.1215686, 1, 0, 1,
-0.3818771, -0.5838862, -4.058537, 0.1176471, 1, 0, 1,
-0.3814414, 1.480059, -0.8854268, 0.1098039, 1, 0, 1,
-0.3670951, -1.070884, -2.900296, 0.1058824, 1, 0, 1,
-0.3666043, -1.23451, -0.4912505, 0.09803922, 1, 0, 1,
-0.3664807, -0.9813175, -1.738352, 0.09019608, 1, 0, 1,
-0.3635151, 1.25399, -0.2566971, 0.08627451, 1, 0, 1,
-0.3623502, -0.5604302, -3.141974, 0.07843138, 1, 0, 1,
-0.3598381, -0.5377096, -2.51006, 0.07450981, 1, 0, 1,
-0.3594412, 0.5425693, -2.454184, 0.06666667, 1, 0, 1,
-0.3546261, 1.00634, -0.9355494, 0.0627451, 1, 0, 1,
-0.3529512, 1.293947, -1.812755, 0.05490196, 1, 0, 1,
-0.3524837, 0.2232037, -0.9650975, 0.05098039, 1, 0, 1,
-0.3523036, 1.586592, -0.3572112, 0.04313726, 1, 0, 1,
-0.351242, 1.141862, -0.4685175, 0.03921569, 1, 0, 1,
-0.3511083, 0.5976889, -0.390846, 0.03137255, 1, 0, 1,
-0.3491464, 0.09474038, -2.712055, 0.02745098, 1, 0, 1,
-0.3489796, -0.1818376, -2.718851, 0.01960784, 1, 0, 1,
-0.3473873, -0.5247554, -4.107156, 0.01568628, 1, 0, 1,
-0.3435768, 0.5871966, 0.6513988, 0.007843138, 1, 0, 1,
-0.3425871, -1.78782, -2.664417, 0.003921569, 1, 0, 1,
-0.3425218, -0.9166352, -2.010769, 0, 1, 0.003921569, 1,
-0.3407182, -0.09921748, -2.744025, 0, 1, 0.01176471, 1,
-0.3395256, -0.4027016, -1.759138, 0, 1, 0.01568628, 1,
-0.3359617, -0.7493631, -2.568944, 0, 1, 0.02352941, 1,
-0.3289569, -1.052668, -3.320301, 0, 1, 0.02745098, 1,
-0.3280326, -0.280304, -2.663823, 0, 1, 0.03529412, 1,
-0.3211481, 0.196781, -1.472155, 0, 1, 0.03921569, 1,
-0.3206971, -0.3911396, -2.901459, 0, 1, 0.04705882, 1,
-0.3167035, 1.893777, 1.395917, 0, 1, 0.05098039, 1,
-0.3129914, 1.051674, -1.424222, 0, 1, 0.05882353, 1,
-0.308275, -0.2563913, -3.094064, 0, 1, 0.0627451, 1,
-0.3069544, 1.115118, -0.5645945, 0, 1, 0.07058824, 1,
-0.3023064, 0.956865, 1.737889, 0, 1, 0.07450981, 1,
-0.3019383, 0.5376897, -1.127363, 0, 1, 0.08235294, 1,
-0.2950661, 0.1339203, -2.965975, 0, 1, 0.08627451, 1,
-0.2948092, -0.6413641, -2.592103, 0, 1, 0.09411765, 1,
-0.2926992, 1.592852, -1.206774, 0, 1, 0.1019608, 1,
-0.2921934, 1.590054, 0.1125053, 0, 1, 0.1058824, 1,
-0.2899004, 0.9827543, -1.476873, 0, 1, 0.1137255, 1,
-0.2881017, 1.177402, 0.03592724, 0, 1, 0.1176471, 1,
-0.2796771, -0.01963615, -1.68221, 0, 1, 0.1254902, 1,
-0.2778299, 0.04356531, -0.5231632, 0, 1, 0.1294118, 1,
-0.2767688, 1.042699, 0.3645387, 0, 1, 0.1372549, 1,
-0.27676, 0.06218883, -0.877831, 0, 1, 0.1411765, 1,
-0.2756218, -0.8114522, -4.799737, 0, 1, 0.1490196, 1,
-0.2721069, 0.03414471, -0.4513404, 0, 1, 0.1529412, 1,
-0.2712601, -0.2730127, -2.845598, 0, 1, 0.1607843, 1,
-0.269528, 1.723074, -1.323688, 0, 1, 0.1647059, 1,
-0.2689208, 0.3902864, -1.347856, 0, 1, 0.172549, 1,
-0.2687985, 0.9305717, -1.957947, 0, 1, 0.1764706, 1,
-0.2687654, 1.775424, -1.140396, 0, 1, 0.1843137, 1,
-0.2687446, 0.8576062, 0.5676916, 0, 1, 0.1882353, 1,
-0.268042, 0.8709396, -2.328523, 0, 1, 0.1960784, 1,
-0.262659, -1.696055, -2.457483, 0, 1, 0.2039216, 1,
-0.2526003, -0.9296404, -3.211076, 0, 1, 0.2078431, 1,
-0.2505146, 0.2925103, -0.9603049, 0, 1, 0.2156863, 1,
-0.2484239, 0.5784213, -1.492195, 0, 1, 0.2196078, 1,
-0.2397097, -1.244296, -3.786438, 0, 1, 0.227451, 1,
-0.2379684, -2.262965, -5.521664, 0, 1, 0.2313726, 1,
-0.236659, -0.6596707, -1.778805, 0, 1, 0.2392157, 1,
-0.2354933, 1.31114, 0.8076889, 0, 1, 0.2431373, 1,
-0.232969, -0.8487253, -3.768912, 0, 1, 0.2509804, 1,
-0.2311675, 0.5839805, 0.4817192, 0, 1, 0.254902, 1,
-0.2309254, 2.169942, 0.6775106, 0, 1, 0.2627451, 1,
-0.2307802, -1.50177, -2.354936, 0, 1, 0.2666667, 1,
-0.2295204, 0.8662911, 0.4427249, 0, 1, 0.2745098, 1,
-0.2285673, 1.098665, -0.8844728, 0, 1, 0.2784314, 1,
-0.2283913, 1.10642, 0.5289625, 0, 1, 0.2862745, 1,
-0.225862, 0.6454532, -0.6859446, 0, 1, 0.2901961, 1,
-0.2252404, -0.3264005, -0.7900758, 0, 1, 0.2980392, 1,
-0.2182076, 1.895542, -0.1380874, 0, 1, 0.3058824, 1,
-0.2080101, -0.3475125, -4.410789, 0, 1, 0.3098039, 1,
-0.2077007, -0.3407513, -4.327049, 0, 1, 0.3176471, 1,
-0.2075091, -0.5467278, -3.121167, 0, 1, 0.3215686, 1,
-0.2044088, -0.24483, -1.312859, 0, 1, 0.3294118, 1,
-0.2023785, 2.141271, 0.08910069, 0, 1, 0.3333333, 1,
-0.2011635, 0.5051696, -1.705407, 0, 1, 0.3411765, 1,
-0.1971716, 0.5856555, -1.067041, 0, 1, 0.345098, 1,
-0.1936324, 0.6007894, 0.2808118, 0, 1, 0.3529412, 1,
-0.1917736, 0.8821095, 0.04029288, 0, 1, 0.3568628, 1,
-0.1894239, -1.867467, -2.651681, 0, 1, 0.3647059, 1,
-0.1873432, 0.3786162, 0.4814586, 0, 1, 0.3686275, 1,
-0.1855252, -0.7713306, -3.941717, 0, 1, 0.3764706, 1,
-0.1843946, 0.0302267, -1.737077, 0, 1, 0.3803922, 1,
-0.1806293, 0.4848692, 1.096411, 0, 1, 0.3882353, 1,
-0.1795909, 0.5930901, -0.492016, 0, 1, 0.3921569, 1,
-0.1793264, 0.6038373, -0.1581374, 0, 1, 0.4, 1,
-0.1780198, 0.8769593, 0.6837485, 0, 1, 0.4078431, 1,
-0.1739929, -0.0003678171, -1.479967, 0, 1, 0.4117647, 1,
-0.1716935, -0.7287381, -2.918019, 0, 1, 0.4196078, 1,
-0.170505, -0.1313729, -1.018633, 0, 1, 0.4235294, 1,
-0.1694989, 0.5005128, -1.945477, 0, 1, 0.4313726, 1,
-0.1621743, -0.8539326, -2.038467, 0, 1, 0.4352941, 1,
-0.1617826, -0.8469961, -3.169808, 0, 1, 0.4431373, 1,
-0.1617125, -0.6902, -3.938897, 0, 1, 0.4470588, 1,
-0.1601553, 0.5276924, -0.09360919, 0, 1, 0.454902, 1,
-0.1595267, 0.2086547, -1.093693, 0, 1, 0.4588235, 1,
-0.1584175, -0.8661484, -3.515175, 0, 1, 0.4666667, 1,
-0.1557838, -0.791407, -2.865565, 0, 1, 0.4705882, 1,
-0.1508525, 0.2088171, -1.450623, 0, 1, 0.4784314, 1,
-0.1484392, -1.753906, -3.484016, 0, 1, 0.4823529, 1,
-0.1415915, 0.05978442, -1.009495, 0, 1, 0.4901961, 1,
-0.1398814, 0.5166699, -2.086616, 0, 1, 0.4941176, 1,
-0.1380085, -0.2423307, -3.717949, 0, 1, 0.5019608, 1,
-0.1345655, -1.423452, -2.93588, 0, 1, 0.509804, 1,
-0.1313097, 0.6570983, 0.4611446, 0, 1, 0.5137255, 1,
-0.1307874, -1.469465, -2.58293, 0, 1, 0.5215687, 1,
-0.1285257, -0.6726623, -2.749938, 0, 1, 0.5254902, 1,
-0.1267119, 1.998627, -0.2231467, 0, 1, 0.5333334, 1,
-0.1262635, -0.5765033, -3.966834, 0, 1, 0.5372549, 1,
-0.1253379, 1.5652, -0.5594244, 0, 1, 0.5450981, 1,
-0.1204393, 1.561413, 0.3598898, 0, 1, 0.5490196, 1,
-0.1154785, 0.4610876, 0.02347915, 0, 1, 0.5568628, 1,
-0.1130364, -0.07961491, -1.080659, 0, 1, 0.5607843, 1,
-0.1108186, 0.2778977, 0.7893044, 0, 1, 0.5686275, 1,
-0.1100559, 0.2212715, -0.6931256, 0, 1, 0.572549, 1,
-0.1066402, 0.9539227, -2.152331, 0, 1, 0.5803922, 1,
-0.1061874, -1.489634, -2.982759, 0, 1, 0.5843138, 1,
-0.105905, -0.6166689, -3.052231, 0, 1, 0.5921569, 1,
-0.1020036, -0.1305437, -0.7136269, 0, 1, 0.5960785, 1,
-0.09981774, -1.318739, -3.098295, 0, 1, 0.6039216, 1,
-0.09868631, -0.922142, -2.302233, 0, 1, 0.6117647, 1,
-0.09828106, 1.012427, 0.6895306, 0, 1, 0.6156863, 1,
-0.0973032, -1.269349, -4.286228, 0, 1, 0.6235294, 1,
-0.09634584, -0.8172621, -2.538147, 0, 1, 0.627451, 1,
-0.09523813, -1.497587, -3.496107, 0, 1, 0.6352941, 1,
-0.0927471, -0.7485399, -4.739259, 0, 1, 0.6392157, 1,
-0.09266952, -0.1532532, -4.549825, 0, 1, 0.6470588, 1,
-0.0925708, 1.351405, -0.4715833, 0, 1, 0.6509804, 1,
-0.09072403, -1.300256, -3.136067, 0, 1, 0.6588235, 1,
-0.08925121, 1.33432, -0.1794115, 0, 1, 0.6627451, 1,
-0.08739914, -1.016522, -1.016774, 0, 1, 0.6705883, 1,
-0.08734225, -0.9382309, -4.362751, 0, 1, 0.6745098, 1,
-0.08599658, 0.4646534, -1.163607, 0, 1, 0.682353, 1,
-0.08305299, 0.6456109, 0.2015248, 0, 1, 0.6862745, 1,
-0.08056867, -0.099493, -2.769938, 0, 1, 0.6941177, 1,
-0.07822139, -1.073816, -2.863433, 0, 1, 0.7019608, 1,
-0.07539519, -0.3617954, -2.961709, 0, 1, 0.7058824, 1,
-0.07377787, 0.4704761, -1.985242, 0, 1, 0.7137255, 1,
-0.07230579, 0.9346591, -0.6883175, 0, 1, 0.7176471, 1,
-0.06903732, 0.7145218, 1.738265, 0, 1, 0.7254902, 1,
-0.06854167, 1.3093, -0.1155018, 0, 1, 0.7294118, 1,
-0.06812897, 0.50078, -0.597622, 0, 1, 0.7372549, 1,
-0.05655207, -1.625919, -3.496879, 0, 1, 0.7411765, 1,
-0.05587191, 0.887815, -1.26684, 0, 1, 0.7490196, 1,
-0.05508272, -2.019294, -1.791285, 0, 1, 0.7529412, 1,
-0.05329189, -0.4273216, -2.54924, 0, 1, 0.7607843, 1,
-0.05186298, -0.09014458, -1.033003, 0, 1, 0.7647059, 1,
-0.05048779, -0.8977858, -4.009372, 0, 1, 0.772549, 1,
-0.04720116, -0.6869406, -2.845149, 0, 1, 0.7764706, 1,
-0.04717957, 0.5441441, -1.626915, 0, 1, 0.7843137, 1,
-0.04566133, -0.03448112, -1.55445, 0, 1, 0.7882353, 1,
-0.0417289, 1.328802, -1.212344, 0, 1, 0.7960784, 1,
-0.04069584, -1.154414, -3.240833, 0, 1, 0.8039216, 1,
-0.03243389, -0.3474329, -1.999197, 0, 1, 0.8078431, 1,
-0.03101573, 0.3193341, -1.970029, 0, 1, 0.8156863, 1,
-0.03023544, -0.189497, -2.034612, 0, 1, 0.8196079, 1,
-0.02740387, 2.62974, 0.559382, 0, 1, 0.827451, 1,
-0.027013, -1.410461, -3.266802, 0, 1, 0.8313726, 1,
-0.02537574, -0.01914801, -2.354365, 0, 1, 0.8392157, 1,
-0.02532937, -0.4303857, -2.248598, 0, 1, 0.8431373, 1,
-0.02297091, 0.04488094, -0.2944382, 0, 1, 0.8509804, 1,
-0.02225341, 1.435603, 1.407694, 0, 1, 0.854902, 1,
-0.01744591, -0.3559942, -4.231759, 0, 1, 0.8627451, 1,
-0.01335452, 1.139937, 1.106165, 0, 1, 0.8666667, 1,
-0.01115734, -0.3022986, -2.700904, 0, 1, 0.8745098, 1,
-0.01075032, -1.915232, -3.11712, 0, 1, 0.8784314, 1,
-0.008605259, 0.1442937, 0.2825079, 0, 1, 0.8862745, 1,
-0.008294334, -0.03947386, -2.188372, 0, 1, 0.8901961, 1,
-0.008140416, 1.288362, 0.4060234, 0, 1, 0.8980392, 1,
-0.005864196, 0.7888929, -0.1261704, 0, 1, 0.9058824, 1,
-0.000838251, 0.1120861, -0.1906257, 0, 1, 0.9098039, 1,
0.00113505, -1.827162, 3.618274, 0, 1, 0.9176471, 1,
0.002173345, -0.1488052, 3.300071, 0, 1, 0.9215686, 1,
0.002235761, 1.523043, 1.447026, 0, 1, 0.9294118, 1,
0.002653453, 0.5657437, 0.6538065, 0, 1, 0.9333333, 1,
0.003856867, 0.3313683, -0.9087946, 0, 1, 0.9411765, 1,
0.01078582, -2.489873, 2.098637, 0, 1, 0.945098, 1,
0.01176223, -0.1850122, 2.551286, 0, 1, 0.9529412, 1,
0.0119263, 1.47977, 2.179669, 0, 1, 0.9568627, 1,
0.01199859, 0.1075693, -1.244932, 0, 1, 0.9647059, 1,
0.01387052, 0.5808595, 0.4325997, 0, 1, 0.9686275, 1,
0.02264957, 0.1799522, -1.115158, 0, 1, 0.9764706, 1,
0.0241925, 1.679007, 0.6761258, 0, 1, 0.9803922, 1,
0.03294423, 0.9571008, -0.2223539, 0, 1, 0.9882353, 1,
0.03514041, 1.341103, -0.03270375, 0, 1, 0.9921569, 1,
0.03553519, -1.042711, 1.827333, 0, 1, 1, 1,
0.03772131, -0.03195847, 0.3661941, 0, 0.9921569, 1, 1,
0.04045986, -1.662852, 3.213959, 0, 0.9882353, 1, 1,
0.04091944, 0.05342723, 1.753451, 0, 0.9803922, 1, 1,
0.04244688, 0.0984226, 1.173473, 0, 0.9764706, 1, 1,
0.0446244, 0.1607468, 0.04676333, 0, 0.9686275, 1, 1,
0.04515518, -0.2093074, 2.986118, 0, 0.9647059, 1, 1,
0.04878315, 0.4790689, 0.4040608, 0, 0.9568627, 1, 1,
0.04878424, 0.1552759, 0.2655283, 0, 0.9529412, 1, 1,
0.0509396, -0.8508309, 3.6923, 0, 0.945098, 1, 1,
0.05944961, -0.1336654, 3.219928, 0, 0.9411765, 1, 1,
0.06067226, -0.2075759, 1.823744, 0, 0.9333333, 1, 1,
0.06068018, 0.3758611, 2.045413, 0, 0.9294118, 1, 1,
0.06323467, -0.7975278, 3.402572, 0, 0.9215686, 1, 1,
0.06412399, 0.6082479, -0.5345725, 0, 0.9176471, 1, 1,
0.066081, 0.2118486, 1.47163, 0, 0.9098039, 1, 1,
0.07010057, -2.819667, 1.59474, 0, 0.9058824, 1, 1,
0.070599, 1.218751, 0.8105683, 0, 0.8980392, 1, 1,
0.07318591, 0.4526763, -0.7304757, 0, 0.8901961, 1, 1,
0.07321002, 0.3441754, -0.4318821, 0, 0.8862745, 1, 1,
0.08328938, 1.532079, 0.2941923, 0, 0.8784314, 1, 1,
0.08409802, -0.9969916, 2.197884, 0, 0.8745098, 1, 1,
0.08524188, 1.219624, -0.4916375, 0, 0.8666667, 1, 1,
0.08807312, 0.6372023, 0.0631876, 0, 0.8627451, 1, 1,
0.09105542, 1.403563, 0.009611314, 0, 0.854902, 1, 1,
0.09249172, -0.1901359, 3.006582, 0, 0.8509804, 1, 1,
0.09439502, -0.5309049, 2.079201, 0, 0.8431373, 1, 1,
0.1067308, 0.5322152, -0.5980893, 0, 0.8392157, 1, 1,
0.1118095, -2.113173, 2.834165, 0, 0.8313726, 1, 1,
0.1133564, 0.2011259, 0.2665786, 0, 0.827451, 1, 1,
0.1157133, -1.296833, 2.161167, 0, 0.8196079, 1, 1,
0.1172692, -1.272901, 2.209569, 0, 0.8156863, 1, 1,
0.1213706, 0.7436807, -0.6445173, 0, 0.8078431, 1, 1,
0.1222719, 0.2074664, -0.5642363, 0, 0.8039216, 1, 1,
0.1297799, 0.6049179, 1.530257, 0, 0.7960784, 1, 1,
0.1330906, 0.276994, -0.3240593, 0, 0.7882353, 1, 1,
0.1344587, -0.1394096, 1.77401, 0, 0.7843137, 1, 1,
0.1358954, 0.9714433, 2.006041, 0, 0.7764706, 1, 1,
0.1359432, 0.2152658, -0.7313194, 0, 0.772549, 1, 1,
0.1411638, -1.027416, 2.989866, 0, 0.7647059, 1, 1,
0.141659, -2.288239, 4.25578, 0, 0.7607843, 1, 1,
0.14497, -0.2468911, 3.094794, 0, 0.7529412, 1, 1,
0.1480027, 0.6697822, 0.2710429, 0, 0.7490196, 1, 1,
0.1501061, -0.04186486, 2.017636, 0, 0.7411765, 1, 1,
0.1503564, 0.1090284, 2.015362, 0, 0.7372549, 1, 1,
0.1542312, 1.770136, 0.01852179, 0, 0.7294118, 1, 1,
0.1544242, 0.706139, -0.9926558, 0, 0.7254902, 1, 1,
0.1553553, -0.6022707, 4.18658, 0, 0.7176471, 1, 1,
0.1614173, -0.5841776, 2.200923, 0, 0.7137255, 1, 1,
0.1624543, 0.0557055, 1.950925, 0, 0.7058824, 1, 1,
0.1626719, -1.318678, 5.122435, 0, 0.6980392, 1, 1,
0.1632925, -1.130061, 2.750516, 0, 0.6941177, 1, 1,
0.180267, 0.4962425, 0.7047465, 0, 0.6862745, 1, 1,
0.1823709, 0.2156299, -0.5092679, 0, 0.682353, 1, 1,
0.1828071, -0.5472339, 1.865435, 0, 0.6745098, 1, 1,
0.1845077, 0.7798758, 0.9161204, 0, 0.6705883, 1, 1,
0.1849757, 2.158184, -0.1177533, 0, 0.6627451, 1, 1,
0.186141, 0.3808452, 1.29943, 0, 0.6588235, 1, 1,
0.186606, 1.160096, 0.7041082, 0, 0.6509804, 1, 1,
0.1883554, -0.494172, 3.214553, 0, 0.6470588, 1, 1,
0.1919843, -1.384835, 3.702402, 0, 0.6392157, 1, 1,
0.1944067, 1.109871, -1.097532, 0, 0.6352941, 1, 1,
0.1974462, -0.1660944, 0.9556289, 0, 0.627451, 1, 1,
0.197761, -0.1193409, 2.734948, 0, 0.6235294, 1, 1,
0.1981648, -1.097606, 3.746705, 0, 0.6156863, 1, 1,
0.198575, 1.899758, 0.4356851, 0, 0.6117647, 1, 1,
0.2018173, -0.8196912, 3.836987, 0, 0.6039216, 1, 1,
0.206558, 2.379544, 1.122083, 0, 0.5960785, 1, 1,
0.2149229, 1.419719, 0.3875831, 0, 0.5921569, 1, 1,
0.2159064, -0.3802986, 2.427953, 0, 0.5843138, 1, 1,
0.2196866, -0.1565706, 1.313025, 0, 0.5803922, 1, 1,
0.221604, 0.2632651, 0.5790616, 0, 0.572549, 1, 1,
0.2220013, -0.6702653, 2.001194, 0, 0.5686275, 1, 1,
0.222133, -0.4116578, 2.135146, 0, 0.5607843, 1, 1,
0.2240709, -0.7702504, 1.425574, 0, 0.5568628, 1, 1,
0.2290861, 1.473897, 0.658227, 0, 0.5490196, 1, 1,
0.2293461, 0.05952912, 2.64914, 0, 0.5450981, 1, 1,
0.2356923, 0.4058908, -0.343679, 0, 0.5372549, 1, 1,
0.2381685, -0.3139969, 2.264646, 0, 0.5333334, 1, 1,
0.2391236, -0.3212054, 2.460898, 0, 0.5254902, 1, 1,
0.2403709, -0.1345084, 2.260218, 0, 0.5215687, 1, 1,
0.2424463, -1.55469, 2.563723, 0, 0.5137255, 1, 1,
0.2500365, -0.9258281, 3.588043, 0, 0.509804, 1, 1,
0.2500891, -1.89383, 3.092796, 0, 0.5019608, 1, 1,
0.2580799, 0.8516992, 2.132981, 0, 0.4941176, 1, 1,
0.261621, 0.2359602, 0.3961653, 0, 0.4901961, 1, 1,
0.2620097, 0.4539033, 0.8859639, 0, 0.4823529, 1, 1,
0.2631878, 2.135387, -0.2399407, 0, 0.4784314, 1, 1,
0.2649364, 1.797755, -0.653698, 0, 0.4705882, 1, 1,
0.265355, -0.190912, 3.494958, 0, 0.4666667, 1, 1,
0.265672, 0.463365, -0.701443, 0, 0.4588235, 1, 1,
0.2692682, 1.057015, 2.229453, 0, 0.454902, 1, 1,
0.2694394, 0.4283243, 0.3885463, 0, 0.4470588, 1, 1,
0.2741986, -0.4646555, 3.540009, 0, 0.4431373, 1, 1,
0.2809977, -1.608017, 3.539458, 0, 0.4352941, 1, 1,
0.2847528, -0.8844392, 3.598391, 0, 0.4313726, 1, 1,
0.2883687, 0.5653362, -0.02124076, 0, 0.4235294, 1, 1,
0.2914781, -1.066911, 2.676309, 0, 0.4196078, 1, 1,
0.2938423, 0.4915677, 0.4552767, 0, 0.4117647, 1, 1,
0.3024167, 0.8020591, 0.201442, 0, 0.4078431, 1, 1,
0.3111984, -0.53548, 4.040221, 0, 0.4, 1, 1,
0.312214, -0.5563051, 2.330576, 0, 0.3921569, 1, 1,
0.3171061, 0.746366, -1.091476, 0, 0.3882353, 1, 1,
0.3199125, -0.02781408, 2.766932, 0, 0.3803922, 1, 1,
0.3232266, -0.5124866, 2.8984, 0, 0.3764706, 1, 1,
0.3242332, 1.684529, 0.06029141, 0, 0.3686275, 1, 1,
0.3273589, 0.7272829, 0.4712442, 0, 0.3647059, 1, 1,
0.3325819, 0.7026314, 1.912033, 0, 0.3568628, 1, 1,
0.3343, 0.09902, 1.185275, 0, 0.3529412, 1, 1,
0.3353368, -1.360524, 4.059615, 0, 0.345098, 1, 1,
0.3402102, -0.9546624, 0.9753419, 0, 0.3411765, 1, 1,
0.3404194, -0.5086398, 2.670894, 0, 0.3333333, 1, 1,
0.3409866, 1.028028, -0.4947734, 0, 0.3294118, 1, 1,
0.343523, -1.734773, 2.547457, 0, 0.3215686, 1, 1,
0.3453123, -0.5456251, 1.367475, 0, 0.3176471, 1, 1,
0.3484263, 0.7034469, 0.940755, 0, 0.3098039, 1, 1,
0.3530445, -2.26623, 3.44278, 0, 0.3058824, 1, 1,
0.3535658, 0.3637349, -0.3769277, 0, 0.2980392, 1, 1,
0.3543223, 0.7907876, -0.3256807, 0, 0.2901961, 1, 1,
0.3562438, 0.9286051, -0.6620673, 0, 0.2862745, 1, 1,
0.3611859, -1.98566, 1.742727, 0, 0.2784314, 1, 1,
0.3613429, 0.4881482, 1.786016, 0, 0.2745098, 1, 1,
0.367759, 1.126746, 1.562399, 0, 0.2666667, 1, 1,
0.37117, -1.760143, -0.4405506, 0, 0.2627451, 1, 1,
0.3740107, -1.961037, 1.359163, 0, 0.254902, 1, 1,
0.3778193, -0.6143709, 3.238857, 0, 0.2509804, 1, 1,
0.3791554, -0.3523403, 3.65226, 0, 0.2431373, 1, 1,
0.3803548, 0.9964911, 1.201025, 0, 0.2392157, 1, 1,
0.3809477, -0.8043305, 2.389203, 0, 0.2313726, 1, 1,
0.3812824, -0.136623, 3.418393, 0, 0.227451, 1, 1,
0.384001, 0.8736431, 2.137992, 0, 0.2196078, 1, 1,
0.3895812, 1.165654, 1.052968, 0, 0.2156863, 1, 1,
0.3913418, 0.7344208, 0.8027778, 0, 0.2078431, 1, 1,
0.397137, 0.6131638, 0.5154878, 0, 0.2039216, 1, 1,
0.3984241, -0.2820261, 0.8787617, 0, 0.1960784, 1, 1,
0.3997746, 1.54223, 0.5099341, 0, 0.1882353, 1, 1,
0.406848, -1.486725, 5.361122, 0, 0.1843137, 1, 1,
0.4073832, 1.569731, -0.7071621, 0, 0.1764706, 1, 1,
0.4078013, -0.8125001, 3.14583, 0, 0.172549, 1, 1,
0.4078018, -1.123591, 3.623408, 0, 0.1647059, 1, 1,
0.4089873, 0.2736891, 2.036635, 0, 0.1607843, 1, 1,
0.4104466, 0.7916728, -1.453778, 0, 0.1529412, 1, 1,
0.4177908, -1.769279, 2.091213, 0, 0.1490196, 1, 1,
0.4229619, 0.2688035, 0.3158427, 0, 0.1411765, 1, 1,
0.4248737, -0.3771344, 1.382571, 0, 0.1372549, 1, 1,
0.4263352, 0.8861552, 2.024221, 0, 0.1294118, 1, 1,
0.4337723, 0.1630319, 1.130904, 0, 0.1254902, 1, 1,
0.4357497, 0.3945246, 0.1928743, 0, 0.1176471, 1, 1,
0.4369293, -0.3267817, 1.627689, 0, 0.1137255, 1, 1,
0.442406, -0.04960146, 0.09989908, 0, 0.1058824, 1, 1,
0.4445028, 1.191855, 0.03782225, 0, 0.09803922, 1, 1,
0.4530421, 0.5498393, -0.2310988, 0, 0.09411765, 1, 1,
0.4556101, -0.5026443, 3.147427, 0, 0.08627451, 1, 1,
0.4574161, -0.5688421, 3.293429, 0, 0.08235294, 1, 1,
0.457949, 0.3997166, 2.27996, 0, 0.07450981, 1, 1,
0.4600879, -0.246162, 2.153308, 0, 0.07058824, 1, 1,
0.4639093, -0.7017955, 2.625468, 0, 0.0627451, 1, 1,
0.4712683, -0.6626315, 1.463601, 0, 0.05882353, 1, 1,
0.4734967, -0.4609848, 2.300586, 0, 0.05098039, 1, 1,
0.4737993, 1.147409, -0.2462665, 0, 0.04705882, 1, 1,
0.4759176, -1.186339, 2.907727, 0, 0.03921569, 1, 1,
0.4775893, 0.9858288, 0.5984195, 0, 0.03529412, 1, 1,
0.4804233, 1.62263, -1.330533, 0, 0.02745098, 1, 1,
0.4811772, -0.1293396, 2.574039, 0, 0.02352941, 1, 1,
0.4913154, -0.956036, 4.480984, 0, 0.01568628, 1, 1,
0.4932527, 0.3809875, 0.8871711, 0, 0.01176471, 1, 1,
0.493365, -0.6199691, 1.76706, 0, 0.003921569, 1, 1,
0.4955628, 1.37713, -0.4468468, 0.003921569, 0, 1, 1,
0.4962233, 0.3231575, 2.403933, 0.007843138, 0, 1, 1,
0.4977193, 2.180851, -0.2060594, 0.01568628, 0, 1, 1,
0.4989911, -1.827689, 4.75173, 0.01960784, 0, 1, 1,
0.5009372, 1.241086, 1.269277, 0.02745098, 0, 1, 1,
0.5015349, -0.0236657, 1.4768, 0.03137255, 0, 1, 1,
0.5018252, -0.2704604, 1.914854, 0.03921569, 0, 1, 1,
0.5027224, -0.2409052, 3.294991, 0.04313726, 0, 1, 1,
0.5058817, -0.2975643, 2.901296, 0.05098039, 0, 1, 1,
0.5159064, 0.9366342, -0.5069295, 0.05490196, 0, 1, 1,
0.5209605, -0.04872831, 0.6628651, 0.0627451, 0, 1, 1,
0.5222949, 0.1620486, 1.937125, 0.06666667, 0, 1, 1,
0.5294443, 0.3185385, 0.8336157, 0.07450981, 0, 1, 1,
0.5335955, 1.028396, 0.8155215, 0.07843138, 0, 1, 1,
0.5426226, 0.7161262, 1.801728, 0.08627451, 0, 1, 1,
0.5461362, -0.9195294, 2.840622, 0.09019608, 0, 1, 1,
0.5505407, -0.05945122, 0.7685287, 0.09803922, 0, 1, 1,
0.5529617, -1.088217, 3.75513, 0.1058824, 0, 1, 1,
0.5559421, 0.4646412, 0.8391027, 0.1098039, 0, 1, 1,
0.5602088, 0.1672308, 1.685532, 0.1176471, 0, 1, 1,
0.5605648, 0.6411291, 0.1926535, 0.1215686, 0, 1, 1,
0.5655108, -2.009817, 1.514563, 0.1294118, 0, 1, 1,
0.5673605, 0.6106926, 2.207459, 0.1333333, 0, 1, 1,
0.5687809, 1.682558, 0.0126938, 0.1411765, 0, 1, 1,
0.5741064, -1.820125, 4.06917, 0.145098, 0, 1, 1,
0.5744469, -0.1490335, 1.417763, 0.1529412, 0, 1, 1,
0.5791838, 0.6667833, 1.354692, 0.1568628, 0, 1, 1,
0.5797622, -0.9475733, 1.368836, 0.1647059, 0, 1, 1,
0.5825668, -0.3950473, 1.815594, 0.1686275, 0, 1, 1,
0.598358, 1.272239, 0.4187952, 0.1764706, 0, 1, 1,
0.6037759, -0.9897805, 1.87505, 0.1803922, 0, 1, 1,
0.6048492, 2.062606, -0.1335438, 0.1882353, 0, 1, 1,
0.6066079, 0.9152676, 1.072178, 0.1921569, 0, 1, 1,
0.6086742, -0.1728526, 3.233073, 0.2, 0, 1, 1,
0.6103037, 0.7547017, -0.6142105, 0.2078431, 0, 1, 1,
0.6132818, -1.131548, 2.425265, 0.2117647, 0, 1, 1,
0.6139129, 0.9168727, 0.3687184, 0.2196078, 0, 1, 1,
0.6178715, -0.1612385, 2.313012, 0.2235294, 0, 1, 1,
0.6293689, 0.273877, 1.813161, 0.2313726, 0, 1, 1,
0.6342487, -0.1340013, 1.86649, 0.2352941, 0, 1, 1,
0.6351388, -0.9547378, 3.134769, 0.2431373, 0, 1, 1,
0.637201, 1.216498, 0.6607873, 0.2470588, 0, 1, 1,
0.6376191, -0.3855808, -0.770627, 0.254902, 0, 1, 1,
0.6381876, -0.4492495, 0.9277106, 0.2588235, 0, 1, 1,
0.6425197, 0.8465795, 0.9889292, 0.2666667, 0, 1, 1,
0.643159, -0.4784821, 2.618353, 0.2705882, 0, 1, 1,
0.6468239, -0.6486814, 1.35471, 0.2784314, 0, 1, 1,
0.652042, -1.967384, 0.7456765, 0.282353, 0, 1, 1,
0.6533435, -0.8717545, 2.126164, 0.2901961, 0, 1, 1,
0.6544205, -0.8045888, 3.48735, 0.2941177, 0, 1, 1,
0.6567721, -1.079088, 2.590799, 0.3019608, 0, 1, 1,
0.6568571, 0.1941149, 0.248219, 0.3098039, 0, 1, 1,
0.658281, 2.831174, 0.252453, 0.3137255, 0, 1, 1,
0.6702272, -0.9422892, 3.072566, 0.3215686, 0, 1, 1,
0.6716344, -0.7952687, 1.634352, 0.3254902, 0, 1, 1,
0.6726406, -0.8452342, -0.8912303, 0.3333333, 0, 1, 1,
0.6728644, 1.833387, 0.1114948, 0.3372549, 0, 1, 1,
0.6754987, 2.230344, 0.7996753, 0.345098, 0, 1, 1,
0.6756428, -0.8327236, 1.368528, 0.3490196, 0, 1, 1,
0.6793237, 1.016688, 0.4258417, 0.3568628, 0, 1, 1,
0.6821473, 0.4529591, 0.9846015, 0.3607843, 0, 1, 1,
0.6925128, -1.573066, 1.607341, 0.3686275, 0, 1, 1,
0.694272, 0.01354991, 2.543983, 0.372549, 0, 1, 1,
0.7005694, 0.7043989, 0.3633325, 0.3803922, 0, 1, 1,
0.7049813, -0.2078704, 1.749296, 0.3843137, 0, 1, 1,
0.7064588, 0.5411054, -1.454152, 0.3921569, 0, 1, 1,
0.710348, -0.1664461, 1.9797, 0.3960784, 0, 1, 1,
0.7109658, 1.148237, 0.3197739, 0.4039216, 0, 1, 1,
0.7226174, 0.8579629, 1.055778, 0.4117647, 0, 1, 1,
0.7226597, -1.662122, 2.689797, 0.4156863, 0, 1, 1,
0.7288135, -0.1646882, 1.999041, 0.4235294, 0, 1, 1,
0.7292625, -1.421714, 2.022172, 0.427451, 0, 1, 1,
0.7302115, -0.539215, 2.365368, 0.4352941, 0, 1, 1,
0.7302271, 1.608191, 0.6978201, 0.4392157, 0, 1, 1,
0.7314573, -1.069913, 3.170504, 0.4470588, 0, 1, 1,
0.7346542, 0.1819796, 1.885788, 0.4509804, 0, 1, 1,
0.7384937, -0.4070097, 1.970385, 0.4588235, 0, 1, 1,
0.7407875, -0.09142357, 1.321461, 0.4627451, 0, 1, 1,
0.741447, -0.2011382, 1.94305, 0.4705882, 0, 1, 1,
0.7419236, -1.450342, 2.770823, 0.4745098, 0, 1, 1,
0.7428067, -1.268443, 3.464165, 0.4823529, 0, 1, 1,
0.7441222, 1.145447, 0.9379137, 0.4862745, 0, 1, 1,
0.7474793, 1.189902, 1.437496, 0.4941176, 0, 1, 1,
0.7483022, -1.014143, 3.331826, 0.5019608, 0, 1, 1,
0.7506686, -1.112324, 1.799005, 0.5058824, 0, 1, 1,
0.7575696, 0.2106293, 1.778875, 0.5137255, 0, 1, 1,
0.7635642, 1.713688, 1.373097, 0.5176471, 0, 1, 1,
0.767708, -1.859713, 2.876324, 0.5254902, 0, 1, 1,
0.7734739, 1.925309, 1.054488, 0.5294118, 0, 1, 1,
0.7748134, 1.115671, 1.757753, 0.5372549, 0, 1, 1,
0.7757654, -1.095955, 2.844289, 0.5411765, 0, 1, 1,
0.7802934, -0.5475083, 0.7136651, 0.5490196, 0, 1, 1,
0.7803585, 0.0239168, 0.06987739, 0.5529412, 0, 1, 1,
0.7823008, -0.6379762, 2.138455, 0.5607843, 0, 1, 1,
0.7893796, 0.9168094, 1.141792, 0.5647059, 0, 1, 1,
0.7926202, -0.6463975, 1.246804, 0.572549, 0, 1, 1,
0.7958497, -0.4125923, 1.497821, 0.5764706, 0, 1, 1,
0.8029835, 1.276302, 0.4188541, 0.5843138, 0, 1, 1,
0.8040912, -0.4685424, 1.702577, 0.5882353, 0, 1, 1,
0.8061776, -1.394825, 1.116325, 0.5960785, 0, 1, 1,
0.8080508, 1.254952, 0.1449688, 0.6039216, 0, 1, 1,
0.8096025, -0.379516, 1.756172, 0.6078432, 0, 1, 1,
0.8120782, -1.195124, 1.661768, 0.6156863, 0, 1, 1,
0.8129553, -0.3957508, 2.731679, 0.6196079, 0, 1, 1,
0.8177741, -1.534671, 2.649379, 0.627451, 0, 1, 1,
0.8217055, -0.7330346, 2.583535, 0.6313726, 0, 1, 1,
0.8267139, -1.249451, 3.693631, 0.6392157, 0, 1, 1,
0.8275844, 0.4863704, 1.836618, 0.6431373, 0, 1, 1,
0.8299368, 0.5149805, 3.163181, 0.6509804, 0, 1, 1,
0.8364133, 0.4525624, 0.997909, 0.654902, 0, 1, 1,
0.8380182, 0.2379458, 3.231341, 0.6627451, 0, 1, 1,
0.8400831, -1.786927, 3.294423, 0.6666667, 0, 1, 1,
0.8404948, -1.604036, 3.445075, 0.6745098, 0, 1, 1,
0.8496823, 0.09342684, 1.007748, 0.6784314, 0, 1, 1,
0.85039, -0.3417231, 2.345657, 0.6862745, 0, 1, 1,
0.8510324, -1.040415, 2.048542, 0.6901961, 0, 1, 1,
0.8512971, 0.0422408, 2.539968, 0.6980392, 0, 1, 1,
0.8569607, 0.1019827, 0.471932, 0.7058824, 0, 1, 1,
0.8578872, -2.033985, 3.146833, 0.7098039, 0, 1, 1,
0.8583838, -0.6459017, 1.666463, 0.7176471, 0, 1, 1,
0.8641473, -0.6464443, 4.014032, 0.7215686, 0, 1, 1,
0.8648097, -1.932561, 2.019531, 0.7294118, 0, 1, 1,
0.8664506, -0.1962127, 2.797093, 0.7333333, 0, 1, 1,
0.8760049, -0.2142858, 1.846721, 0.7411765, 0, 1, 1,
0.8801875, -0.7674972, 3.371425, 0.7450981, 0, 1, 1,
0.8826783, -0.5600984, 2.245807, 0.7529412, 0, 1, 1,
0.8848923, -0.7087615, 2.417104, 0.7568628, 0, 1, 1,
0.8849384, 0.8792093, 1.152393, 0.7647059, 0, 1, 1,
0.8872377, -1.211548, 2.720297, 0.7686275, 0, 1, 1,
0.8969331, -0.002383274, 1.420644, 0.7764706, 0, 1, 1,
0.9040583, -1.346471, 2.407376, 0.7803922, 0, 1, 1,
0.907056, -0.04497817, 2.293291, 0.7882353, 0, 1, 1,
0.9112305, -1.278371, 2.430954, 0.7921569, 0, 1, 1,
0.9113128, -0.8140934, 3.313558, 0.8, 0, 1, 1,
0.9143364, 0.6428112, 1.662322, 0.8078431, 0, 1, 1,
0.918118, -1.127562, 1.346764, 0.8117647, 0, 1, 1,
0.9181902, 1.341578, 0.2339191, 0.8196079, 0, 1, 1,
0.9189181, -1.473829, 2.913312, 0.8235294, 0, 1, 1,
0.9209483, -0.02073166, 1.423596, 0.8313726, 0, 1, 1,
0.9243019, 0.6462612, 1.068669, 0.8352941, 0, 1, 1,
0.927084, 0.1687802, 1.638106, 0.8431373, 0, 1, 1,
0.9285384, -1.459485, 3.292918, 0.8470588, 0, 1, 1,
0.9323643, -0.3085495, 2.862748, 0.854902, 0, 1, 1,
0.9343837, -0.6212232, 2.883007, 0.8588235, 0, 1, 1,
0.9402496, -0.3847684, 2.139055, 0.8666667, 0, 1, 1,
0.9406406, -0.644446, 2.457155, 0.8705882, 0, 1, 1,
0.9409457, 0.6127315, 0.6682653, 0.8784314, 0, 1, 1,
0.9410117, -1.687962, 1.159317, 0.8823529, 0, 1, 1,
0.9426565, 0.7528712, 1.162361, 0.8901961, 0, 1, 1,
0.9432932, -0.02005986, 1.876227, 0.8941177, 0, 1, 1,
0.9440546, 2.044185, -0.7013794, 0.9019608, 0, 1, 1,
0.9443662, -0.05643237, 2.004894, 0.9098039, 0, 1, 1,
0.945205, 1.933054, -0.4980115, 0.9137255, 0, 1, 1,
0.9496053, 0.125962, 0.7972378, 0.9215686, 0, 1, 1,
0.955705, -0.3294306, 1.866535, 0.9254902, 0, 1, 1,
0.9589047, -1.247014, 2.146969, 0.9333333, 0, 1, 1,
0.9593995, 0.6593332, 0.8507391, 0.9372549, 0, 1, 1,
0.9597206, 1.729412, 0.9491656, 0.945098, 0, 1, 1,
0.9640456, -0.8902555, 2.032902, 0.9490196, 0, 1, 1,
0.9647113, 0.6189088, 1.811775, 0.9568627, 0, 1, 1,
0.9682584, 2.278477, 0.1121076, 0.9607843, 0, 1, 1,
0.9688945, 0.1918546, 0.9745987, 0.9686275, 0, 1, 1,
0.97156, 0.6221524, 1.931813, 0.972549, 0, 1, 1,
0.977774, -1.173753, 2.440066, 0.9803922, 0, 1, 1,
0.9852497, 0.213043, 0.8449387, 0.9843137, 0, 1, 1,
0.9889171, -0.1902647, 1.528155, 0.9921569, 0, 1, 1,
0.9898856, -0.6928388, 3.024289, 0.9960784, 0, 1, 1,
0.9974227, 1.523398, -0.624886, 1, 0, 0.9960784, 1,
1.009372, 0.4682156, -0.4282237, 1, 0, 0.9882353, 1,
1.01039, 2.001411, 1.182812, 1, 0, 0.9843137, 1,
1.014051, -0.06687886, 0.4122002, 1, 0, 0.9764706, 1,
1.014133, 0.5931512, 0.1451501, 1, 0, 0.972549, 1,
1.023368, -1.497401, 3.736224, 1, 0, 0.9647059, 1,
1.025423, -0.1827084, 1.648149, 1, 0, 0.9607843, 1,
1.028234, -0.5694851, -0.08916985, 1, 0, 0.9529412, 1,
1.028305, 0.1199646, -0.8695717, 1, 0, 0.9490196, 1,
1.030867, 0.651002, 0.1145315, 1, 0, 0.9411765, 1,
1.037384, 2.271995, -0.9673457, 1, 0, 0.9372549, 1,
1.043203, 0.3288401, 1.023317, 1, 0, 0.9294118, 1,
1.044698, 0.5204118, 1.674953, 1, 0, 0.9254902, 1,
1.051212, 0.7825605, 0.4378617, 1, 0, 0.9176471, 1,
1.055229, -0.0118913, 2.381575, 1, 0, 0.9137255, 1,
1.057456, -0.4155712, 1.506967, 1, 0, 0.9058824, 1,
1.059876, 0.8290361, 0.06198144, 1, 0, 0.9019608, 1,
1.064484, -0.1912436, 0.3810871, 1, 0, 0.8941177, 1,
1.065423, -0.1113223, 2.657679, 1, 0, 0.8862745, 1,
1.067764, -1.489607, 2.554165, 1, 0, 0.8823529, 1,
1.068276, -0.05076246, 1.552965, 1, 0, 0.8745098, 1,
1.072791, -2.384413, 2.654025, 1, 0, 0.8705882, 1,
1.079603, -0.4535554, 0.3281768, 1, 0, 0.8627451, 1,
1.080951, -0.2351199, 2.122041, 1, 0, 0.8588235, 1,
1.091725, -0.7237885, 0.5295284, 1, 0, 0.8509804, 1,
1.092145, 0.06841646, 1.452412, 1, 0, 0.8470588, 1,
1.092749, 0.5368432, 0.5480157, 1, 0, 0.8392157, 1,
1.103056, 0.922346, -0.2006227, 1, 0, 0.8352941, 1,
1.108598, 0.7183, -0.2472895, 1, 0, 0.827451, 1,
1.113551, 1.053007, 3.443242, 1, 0, 0.8235294, 1,
1.119739, 0.5345376, 2.391591, 1, 0, 0.8156863, 1,
1.11995, 2.443609, -0.2792492, 1, 0, 0.8117647, 1,
1.125843, 0.2754357, 3.063768, 1, 0, 0.8039216, 1,
1.129311, -0.2937498, 2.540022, 1, 0, 0.7960784, 1,
1.132465, -0.6405755, -0.2302196, 1, 0, 0.7921569, 1,
1.133259, 0.5189764, 1.25363, 1, 0, 0.7843137, 1,
1.146774, -1.000346, 3.445251, 1, 0, 0.7803922, 1,
1.150739, -1.100837, 2.501697, 1, 0, 0.772549, 1,
1.152132, 0.9065138, 1.049028, 1, 0, 0.7686275, 1,
1.152852, 0.06579915, 1.021185, 1, 0, 0.7607843, 1,
1.162129, 0.4780522, -0.1209979, 1, 0, 0.7568628, 1,
1.162775, -0.7702805, 3.182551, 1, 0, 0.7490196, 1,
1.170931, 0.1992166, 0.3417976, 1, 0, 0.7450981, 1,
1.17564, 0.5372863, -1.801713, 1, 0, 0.7372549, 1,
1.177691, -0.768957, 1.593667, 1, 0, 0.7333333, 1,
1.178293, 0.6163368, 0.2706122, 1, 0, 0.7254902, 1,
1.184686, 1.62917, 1.511878, 1, 0, 0.7215686, 1,
1.18977, 0.01387868, 2.638299, 1, 0, 0.7137255, 1,
1.198691, -1.822516, 3.350589, 1, 0, 0.7098039, 1,
1.202564, 1.564425, 0.3407731, 1, 0, 0.7019608, 1,
1.20287, 0.2299205, 1.870265, 1, 0, 0.6941177, 1,
1.206142, -1.034921, 0.9913704, 1, 0, 0.6901961, 1,
1.209879, 1.096203, 1.570337, 1, 0, 0.682353, 1,
1.218463, -0.2145067, 2.679698, 1, 0, 0.6784314, 1,
1.230839, 0.9869101, -0.04804718, 1, 0, 0.6705883, 1,
1.252527, -0.4267088, 2.921197, 1, 0, 0.6666667, 1,
1.255657, 1.799583, 0.3017107, 1, 0, 0.6588235, 1,
1.257795, -0.6907479, 2.011614, 1, 0, 0.654902, 1,
1.259004, -1.454123, 2.113966, 1, 0, 0.6470588, 1,
1.264434, 2.153195, 0.1927474, 1, 0, 0.6431373, 1,
1.270984, 1.337576, 1.339117, 1, 0, 0.6352941, 1,
1.284112, 1.072006, 0.6785537, 1, 0, 0.6313726, 1,
1.28485, -0.250435, 1.719262, 1, 0, 0.6235294, 1,
1.286558, -0.3718738, 0.5465823, 1, 0, 0.6196079, 1,
1.295447, -1.461621, 1.72889, 1, 0, 0.6117647, 1,
1.305147, 0.4694558, 1.478515, 1, 0, 0.6078432, 1,
1.310143, 1.56687, 0.7753629, 1, 0, 0.6, 1,
1.31142, -0.5406403, 1.041417, 1, 0, 0.5921569, 1,
1.320094, 0.188961, 1.490705, 1, 0, 0.5882353, 1,
1.322885, 0.09737065, 1.761673, 1, 0, 0.5803922, 1,
1.326228, 1.436831, 0.2990617, 1, 0, 0.5764706, 1,
1.337995, -0.3261621, 1.470937, 1, 0, 0.5686275, 1,
1.345765, 1.2972, -0.2676432, 1, 0, 0.5647059, 1,
1.349035, 0.4887247, 0.4997765, 1, 0, 0.5568628, 1,
1.376344, -0.09693611, 0.5505731, 1, 0, 0.5529412, 1,
1.382251, 0.9587555, 0.4238624, 1, 0, 0.5450981, 1,
1.391489, -0.4475482, 1.41395, 1, 0, 0.5411765, 1,
1.402052, 1.418656, -0.2392141, 1, 0, 0.5333334, 1,
1.404245, 1.951021, 1.426883, 1, 0, 0.5294118, 1,
1.406546, -0.7001055, 2.952325, 1, 0, 0.5215687, 1,
1.410179, -0.5713693, 3.197696, 1, 0, 0.5176471, 1,
1.410272, 0.2961742, 1.266606, 1, 0, 0.509804, 1,
1.416264, -0.1834513, 0.5788698, 1, 0, 0.5058824, 1,
1.428388, 0.1375637, 3.208953, 1, 0, 0.4980392, 1,
1.428599, 2.125893, 2.409098, 1, 0, 0.4901961, 1,
1.435527, 0.3492115, 0.9051986, 1, 0, 0.4862745, 1,
1.446912, 0.3175524, 1.480135, 1, 0, 0.4784314, 1,
1.449556, -0.542699, 2.520742, 1, 0, 0.4745098, 1,
1.460081, 0.7716101, 0.7970724, 1, 0, 0.4666667, 1,
1.462005, -0.2173598, 1.261871, 1, 0, 0.4627451, 1,
1.463848, -1.758564, 1.220519, 1, 0, 0.454902, 1,
1.471274, -0.6701621, 1.703513, 1, 0, 0.4509804, 1,
1.472431, 0.7349288, 1.68064, 1, 0, 0.4431373, 1,
1.472656, 1.424159, 1.401804, 1, 0, 0.4392157, 1,
1.473572, 1.467183, -0.9739047, 1, 0, 0.4313726, 1,
1.476896, -1.056005, 2.48383, 1, 0, 0.427451, 1,
1.477058, 1.311733, -0.6587286, 1, 0, 0.4196078, 1,
1.48436, -0.1158103, 2.053689, 1, 0, 0.4156863, 1,
1.486645, -1.008184, -0.1686638, 1, 0, 0.4078431, 1,
1.504292, -0.02265207, 0.8097007, 1, 0, 0.4039216, 1,
1.504984, -0.1399092, 3.029078, 1, 0, 0.3960784, 1,
1.509534, -0.2556739, 0.9812728, 1, 0, 0.3882353, 1,
1.514057, 0.7496729, 1.138149, 1, 0, 0.3843137, 1,
1.532516, 0.5285187, 0.0363162, 1, 0, 0.3764706, 1,
1.535879, -1.601382, 3.39701, 1, 0, 0.372549, 1,
1.561761, 1.296649, 2.262013, 1, 0, 0.3647059, 1,
1.571157, 0.6058767, 0.7295659, 1, 0, 0.3607843, 1,
1.587492, -0.6340169, 3.745655, 1, 0, 0.3529412, 1,
1.610205, -0.228852, 2.171924, 1, 0, 0.3490196, 1,
1.628312, 0.3066102, 0.5520515, 1, 0, 0.3411765, 1,
1.637765, -0.550688, 1.618021, 1, 0, 0.3372549, 1,
1.645386, 0.9343095, 1.590349, 1, 0, 0.3294118, 1,
1.647691, -0.1232095, 2.764106, 1, 0, 0.3254902, 1,
1.650375, -1.917525, 2.198193, 1, 0, 0.3176471, 1,
1.651528, 0.7017627, 2.420899, 1, 0, 0.3137255, 1,
1.662958, 0.9097371, 1.025598, 1, 0, 0.3058824, 1,
1.666271, -0.1252648, 1.413408, 1, 0, 0.2980392, 1,
1.67375, -0.9891767, 2.513154, 1, 0, 0.2941177, 1,
1.69717, -0.1416031, 0.7430712, 1, 0, 0.2862745, 1,
1.703174, -1.934573, 1.110531, 1, 0, 0.282353, 1,
1.705102, 0.9879861, 0.6617634, 1, 0, 0.2745098, 1,
1.707554, -1.072156, 1.70195, 1, 0, 0.2705882, 1,
1.723, -0.5363274, 3.717151, 1, 0, 0.2627451, 1,
1.724148, 0.6089576, 1.489832, 1, 0, 0.2588235, 1,
1.743361, -0.1673277, 2.656393, 1, 0, 0.2509804, 1,
1.761894, 0.1713035, 1.813254, 1, 0, 0.2470588, 1,
1.763106, 1.268691, 1.720251, 1, 0, 0.2392157, 1,
1.777388, -0.4773395, 2.258217, 1, 0, 0.2352941, 1,
1.781819, -2.028593, 1.378865, 1, 0, 0.227451, 1,
1.782417, -0.9787095, 2.769439, 1, 0, 0.2235294, 1,
1.786153, 0.2342647, 1.189795, 1, 0, 0.2156863, 1,
1.795662, -0.4542446, 0.9978197, 1, 0, 0.2117647, 1,
1.820689, 1.238666, -0.5892299, 1, 0, 0.2039216, 1,
1.836689, -0.9376174, 3.286111, 1, 0, 0.1960784, 1,
1.861858, -1.013936, 1.834022, 1, 0, 0.1921569, 1,
1.878106, -0.4605052, 0.8576446, 1, 0, 0.1843137, 1,
1.885701, 0.4372495, 0.777784, 1, 0, 0.1803922, 1,
1.903375, -0.8216358, 3.031663, 1, 0, 0.172549, 1,
1.926395, -1.074376, 3.178637, 1, 0, 0.1686275, 1,
1.944662, 1.118706, -1.533264, 1, 0, 0.1607843, 1,
1.968656, -1.123317, 2.582919, 1, 0, 0.1568628, 1,
1.993364, 1.952684, -0.1807351, 1, 0, 0.1490196, 1,
2.002274, 0.8056072, 1.819366, 1, 0, 0.145098, 1,
2.005699, 0.1673729, 1.776665, 1, 0, 0.1372549, 1,
2.018816, -2.069054, 2.384758, 1, 0, 0.1333333, 1,
2.026571, -0.6988649, 1.572405, 1, 0, 0.1254902, 1,
2.07913, 0.9924309, 3.520354, 1, 0, 0.1215686, 1,
2.097869, -1.298679, 0.7843835, 1, 0, 0.1137255, 1,
2.107272, -0.07242458, 0.7178766, 1, 0, 0.1098039, 1,
2.155627, -0.1796729, 2.490979, 1, 0, 0.1019608, 1,
2.181219, 0.4300543, 3.013821, 1, 0, 0.09411765, 1,
2.202334, -0.4246491, 2.55617, 1, 0, 0.09019608, 1,
2.231312, 0.7256824, 1.600434, 1, 0, 0.08235294, 1,
2.38957, -0.7642266, 2.623715, 1, 0, 0.07843138, 1,
2.427277, 0.5463874, 0.7216488, 1, 0, 0.07058824, 1,
2.44522, -0.9553591, 0.9727971, 1, 0, 0.06666667, 1,
2.565866, -0.1586804, 1.316893, 1, 0, 0.05882353, 1,
2.602693, -1.274546, 1.90072, 1, 0, 0.05490196, 1,
2.695112, -0.7799803, 2.488203, 1, 0, 0.04705882, 1,
2.734357, -0.2383071, 1.746903, 1, 0, 0.04313726, 1,
2.74983, 1.534977, 1.263715, 1, 0, 0.03529412, 1,
2.89336, 1.520064, -0.5289783, 1, 0, 0.03137255, 1,
2.94789, 0.5158116, 1.243158, 1, 0, 0.02352941, 1,
2.960871, -0.2727084, 2.583194, 1, 0, 0.01960784, 1,
2.983772, 0.782016, 1.212396, 1, 0, 0.01176471, 1,
3.253046, 1.268951, 1.858729, 1, 0, 0.007843138, 1
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
-0.230786, -4.16183, -7.366296, 0, -0.5, 0.5, 0.5,
-0.230786, -4.16183, -7.366296, 1, -0.5, 0.5, 0.5,
-0.230786, -4.16183, -7.366296, 1, 1.5, 0.5, 0.5,
-0.230786, -4.16183, -7.366296, 0, 1.5, 0.5, 0.5
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
-4.895637, -0.158567, -7.366296, 0, -0.5, 0.5, 0.5,
-4.895637, -0.158567, -7.366296, 1, -0.5, 0.5, 0.5,
-4.895637, -0.158567, -7.366296, 1, 1.5, 0.5, 0.5,
-4.895637, -0.158567, -7.366296, 0, 1.5, 0.5, 0.5
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
-4.895637, -4.16183, -0.08027077, 0, -0.5, 0.5, 0.5,
-4.895637, -4.16183, -0.08027077, 1, -0.5, 0.5, 0.5,
-4.895637, -4.16183, -0.08027077, 1, 1.5, 0.5, 0.5,
-4.895637, -4.16183, -0.08027077, 0, 1.5, 0.5, 0.5
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
-3, -3.238001, -5.684906,
3, -3.238001, -5.684906,
-3, -3.238001, -5.684906,
-3, -3.391972, -5.965137,
-2, -3.238001, -5.684906,
-2, -3.391972, -5.965137,
-1, -3.238001, -5.684906,
-1, -3.391972, -5.965137,
0, -3.238001, -5.684906,
0, -3.391972, -5.965137,
1, -3.238001, -5.684906,
1, -3.391972, -5.965137,
2, -3.238001, -5.684906,
2, -3.391972, -5.965137,
3, -3.238001, -5.684906,
3, -3.391972, -5.965137
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
-3, -3.699916, -6.5256, 0, -0.5, 0.5, 0.5,
-3, -3.699916, -6.5256, 1, -0.5, 0.5, 0.5,
-3, -3.699916, -6.5256, 1, 1.5, 0.5, 0.5,
-3, -3.699916, -6.5256, 0, 1.5, 0.5, 0.5,
-2, -3.699916, -6.5256, 0, -0.5, 0.5, 0.5,
-2, -3.699916, -6.5256, 1, -0.5, 0.5, 0.5,
-2, -3.699916, -6.5256, 1, 1.5, 0.5, 0.5,
-2, -3.699916, -6.5256, 0, 1.5, 0.5, 0.5,
-1, -3.699916, -6.5256, 0, -0.5, 0.5, 0.5,
-1, -3.699916, -6.5256, 1, -0.5, 0.5, 0.5,
-1, -3.699916, -6.5256, 1, 1.5, 0.5, 0.5,
-1, -3.699916, -6.5256, 0, 1.5, 0.5, 0.5,
0, -3.699916, -6.5256, 0, -0.5, 0.5, 0.5,
0, -3.699916, -6.5256, 1, -0.5, 0.5, 0.5,
0, -3.699916, -6.5256, 1, 1.5, 0.5, 0.5,
0, -3.699916, -6.5256, 0, 1.5, 0.5, 0.5,
1, -3.699916, -6.5256, 0, -0.5, 0.5, 0.5,
1, -3.699916, -6.5256, 1, -0.5, 0.5, 0.5,
1, -3.699916, -6.5256, 1, 1.5, 0.5, 0.5,
1, -3.699916, -6.5256, 0, 1.5, 0.5, 0.5,
2, -3.699916, -6.5256, 0, -0.5, 0.5, 0.5,
2, -3.699916, -6.5256, 1, -0.5, 0.5, 0.5,
2, -3.699916, -6.5256, 1, 1.5, 0.5, 0.5,
2, -3.699916, -6.5256, 0, 1.5, 0.5, 0.5,
3, -3.699916, -6.5256, 0, -0.5, 0.5, 0.5,
3, -3.699916, -6.5256, 1, -0.5, 0.5, 0.5,
3, -3.699916, -6.5256, 1, 1.5, 0.5, 0.5,
3, -3.699916, -6.5256, 0, 1.5, 0.5, 0.5
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
-3.819132, -3, -5.684906,
-3.819132, 2, -5.684906,
-3.819132, -3, -5.684906,
-3.99855, -3, -5.965137,
-3.819132, -2, -5.684906,
-3.99855, -2, -5.965137,
-3.819132, -1, -5.684906,
-3.99855, -1, -5.965137,
-3.819132, 0, -5.684906,
-3.99855, 0, -5.965137,
-3.819132, 1, -5.684906,
-3.99855, 1, -5.965137,
-3.819132, 2, -5.684906,
-3.99855, 2, -5.965137
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
-4.357384, -3, -6.5256, 0, -0.5, 0.5, 0.5,
-4.357384, -3, -6.5256, 1, -0.5, 0.5, 0.5,
-4.357384, -3, -6.5256, 1, 1.5, 0.5, 0.5,
-4.357384, -3, -6.5256, 0, 1.5, 0.5, 0.5,
-4.357384, -2, -6.5256, 0, -0.5, 0.5, 0.5,
-4.357384, -2, -6.5256, 1, -0.5, 0.5, 0.5,
-4.357384, -2, -6.5256, 1, 1.5, 0.5, 0.5,
-4.357384, -2, -6.5256, 0, 1.5, 0.5, 0.5,
-4.357384, -1, -6.5256, 0, -0.5, 0.5, 0.5,
-4.357384, -1, -6.5256, 1, -0.5, 0.5, 0.5,
-4.357384, -1, -6.5256, 1, 1.5, 0.5, 0.5,
-4.357384, -1, -6.5256, 0, 1.5, 0.5, 0.5,
-4.357384, 0, -6.5256, 0, -0.5, 0.5, 0.5,
-4.357384, 0, -6.5256, 1, -0.5, 0.5, 0.5,
-4.357384, 0, -6.5256, 1, 1.5, 0.5, 0.5,
-4.357384, 0, -6.5256, 0, 1.5, 0.5, 0.5,
-4.357384, 1, -6.5256, 0, -0.5, 0.5, 0.5,
-4.357384, 1, -6.5256, 1, -0.5, 0.5, 0.5,
-4.357384, 1, -6.5256, 1, 1.5, 0.5, 0.5,
-4.357384, 1, -6.5256, 0, 1.5, 0.5, 0.5,
-4.357384, 2, -6.5256, 0, -0.5, 0.5, 0.5,
-4.357384, 2, -6.5256, 1, -0.5, 0.5, 0.5,
-4.357384, 2, -6.5256, 1, 1.5, 0.5, 0.5,
-4.357384, 2, -6.5256, 0, 1.5, 0.5, 0.5
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
-3.819132, -3.238001, -4,
-3.819132, -3.238001, 4,
-3.819132, -3.238001, -4,
-3.99855, -3.391972, -4,
-3.819132, -3.238001, -2,
-3.99855, -3.391972, -2,
-3.819132, -3.238001, 0,
-3.99855, -3.391972, 0,
-3.819132, -3.238001, 2,
-3.99855, -3.391972, 2,
-3.819132, -3.238001, 4,
-3.99855, -3.391972, 4
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
-4.357384, -3.699916, -4, 0, -0.5, 0.5, 0.5,
-4.357384, -3.699916, -4, 1, -0.5, 0.5, 0.5,
-4.357384, -3.699916, -4, 1, 1.5, 0.5, 0.5,
-4.357384, -3.699916, -4, 0, 1.5, 0.5, 0.5,
-4.357384, -3.699916, -2, 0, -0.5, 0.5, 0.5,
-4.357384, -3.699916, -2, 1, -0.5, 0.5, 0.5,
-4.357384, -3.699916, -2, 1, 1.5, 0.5, 0.5,
-4.357384, -3.699916, -2, 0, 1.5, 0.5, 0.5,
-4.357384, -3.699916, 0, 0, -0.5, 0.5, 0.5,
-4.357384, -3.699916, 0, 1, -0.5, 0.5, 0.5,
-4.357384, -3.699916, 0, 1, 1.5, 0.5, 0.5,
-4.357384, -3.699916, 0, 0, 1.5, 0.5, 0.5,
-4.357384, -3.699916, 2, 0, -0.5, 0.5, 0.5,
-4.357384, -3.699916, 2, 1, -0.5, 0.5, 0.5,
-4.357384, -3.699916, 2, 1, 1.5, 0.5, 0.5,
-4.357384, -3.699916, 2, 0, 1.5, 0.5, 0.5,
-4.357384, -3.699916, 4, 0, -0.5, 0.5, 0.5,
-4.357384, -3.699916, 4, 1, -0.5, 0.5, 0.5,
-4.357384, -3.699916, 4, 1, 1.5, 0.5, 0.5,
-4.357384, -3.699916, 4, 0, 1.5, 0.5, 0.5
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
-3.819132, -3.238001, -5.684906,
-3.819132, 2.920867, -5.684906,
-3.819132, -3.238001, 5.524364,
-3.819132, 2.920867, 5.524364,
-3.819132, -3.238001, -5.684906,
-3.819132, -3.238001, 5.524364,
-3.819132, 2.920867, -5.684906,
-3.819132, 2.920867, 5.524364,
-3.819132, -3.238001, -5.684906,
3.35756, -3.238001, -5.684906,
-3.819132, -3.238001, 5.524364,
3.35756, -3.238001, 5.524364,
-3.819132, 2.920867, -5.684906,
3.35756, 2.920867, -5.684906,
-3.819132, 2.920867, 5.524364,
3.35756, 2.920867, 5.524364,
3.35756, -3.238001, -5.684906,
3.35756, 2.920867, -5.684906,
3.35756, -3.238001, 5.524364,
3.35756, 2.920867, 5.524364,
3.35756, -3.238001, -5.684906,
3.35756, -3.238001, 5.524364,
3.35756, 2.920867, -5.684906,
3.35756, 2.920867, 5.524364
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
var radius = 7.831227;
var distance = 34.84201;
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
mvMatrix.translate( 0.230786, 0.158567, 0.08027077 );
mvMatrix.scale( 1.17983, 1.374811, 0.7553816 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.84201);
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
sulphur<-read.table("sulphur.xyz")
```

```
## Error in read.table("sulphur.xyz"): no lines available in input
```

```r
x<-sulphur$V2
```

```
## Error in eval(expr, envir, enclos): object 'sulphur' not found
```

```r
y<-sulphur$V3
```

```
## Error in eval(expr, envir, enclos): object 'sulphur' not found
```

```r
z<-sulphur$V4
```

```
## Error in eval(expr, envir, enclos): object 'sulphur' not found
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
-3.714617, 0.07888647, -1.042844, 0, 0, 1, 1, 1,
-2.882425, 0.6212283, 0.8536232, 1, 0, 0, 1, 1,
-2.739377, 0.1934127, -3.671378, 1, 0, 0, 1, 1,
-2.622656, 0.08453195, -2.24169, 1, 0, 0, 1, 1,
-2.568755, 0.248201, -1.437144, 1, 0, 0, 1, 1,
-2.407731, -0.1904669, -2.818165, 1, 0, 0, 1, 1,
-2.404823, 2.350703, -0.978485, 0, 0, 0, 1, 1,
-2.356193, -0.8194537, -2.312791, 0, 0, 0, 1, 1,
-2.308104, -0.7192861, -0.7642333, 0, 0, 0, 1, 1,
-2.29324, -1.23241, -3.592395, 0, 0, 0, 1, 1,
-2.245035, 0.08343653, -1.397098, 0, 0, 0, 1, 1,
-2.239059, -3.148308, -4.456563, 0, 0, 0, 1, 1,
-2.230775, -0.3885113, -2.896253, 0, 0, 0, 1, 1,
-2.226881, -1.042881, -0.9809787, 1, 1, 1, 1, 1,
-2.216639, 0.6113599, -1.969059, 1, 1, 1, 1, 1,
-2.202497, -1.503331, -2.424521, 1, 1, 1, 1, 1,
-2.192358, 1.25697, -0.1333909, 1, 1, 1, 1, 1,
-2.189686, 0.2942377, -0.6690612, 1, 1, 1, 1, 1,
-2.133661, -0.5353369, -0.9987199, 1, 1, 1, 1, 1,
-2.113204, -1.047456, -2.395061, 1, 1, 1, 1, 1,
-2.103703, -0.128006, -1.936824, 1, 1, 1, 1, 1,
-2.101616, 1.097525, -3.510256, 1, 1, 1, 1, 1,
-2.080519, 0.3219281, -1.283534, 1, 1, 1, 1, 1,
-2.071416, 1.175484, -0.6532221, 1, 1, 1, 1, 1,
-1.982942, -1.163208, -1.773437, 1, 1, 1, 1, 1,
-1.978099, 1.08616, 0.02349076, 1, 1, 1, 1, 1,
-1.965527, 0.7359397, -1.514714, 1, 1, 1, 1, 1,
-1.953358, -0.3653341, -1.539777, 1, 1, 1, 1, 1,
-1.946736, 0.1394399, -1.433879, 0, 0, 1, 1, 1,
-1.936225, -0.03235488, -1.289759, 1, 0, 0, 1, 1,
-1.913236, -0.1517575, -3.127153, 1, 0, 0, 1, 1,
-1.902931, 0.9734406, -1.73271, 1, 0, 0, 1, 1,
-1.898077, -1.846556, -2.693628, 1, 0, 0, 1, 1,
-1.853424, -0.05408324, -2.339932, 1, 0, 0, 1, 1,
-1.84852, 0.9145425, -1.781471, 0, 0, 0, 1, 1,
-1.827937, -0.9674885, -1.378166, 0, 0, 0, 1, 1,
-1.812356, -0.3909626, -1.51775, 0, 0, 0, 1, 1,
-1.812142, 0.1032495, -0.4125442, 0, 0, 0, 1, 1,
-1.804113, 1.750364, -1.209596, 0, 0, 0, 1, 1,
-1.784373, 0.7547449, -0.7271224, 0, 0, 0, 1, 1,
-1.775515, -0.636414, -0.8546954, 0, 0, 0, 1, 1,
-1.754058, -0.4717615, -2.984643, 1, 1, 1, 1, 1,
-1.733904, -1.390851, -2.405646, 1, 1, 1, 1, 1,
-1.733001, 0.2529274, -1.694241, 1, 1, 1, 1, 1,
-1.727693, -0.6241663, -1.992118, 1, 1, 1, 1, 1,
-1.638936, -0.08423737, -0.6780441, 1, 1, 1, 1, 1,
-1.638444, -1.182802, -0.5835537, 1, 1, 1, 1, 1,
-1.630168, 0.9651936, -2.247839, 1, 1, 1, 1, 1,
-1.624319, -1.22516, -3.301184, 1, 1, 1, 1, 1,
-1.621874, -0.1179168, -3.183362, 1, 1, 1, 1, 1,
-1.610425, 0.9634739, -0.3504511, 1, 1, 1, 1, 1,
-1.608248, 0.6368413, -1.360153, 1, 1, 1, 1, 1,
-1.596238, 1.243037, 2.084142, 1, 1, 1, 1, 1,
-1.594362, 0.8948972, -1.086208, 1, 1, 1, 1, 1,
-1.57537, 1.112782, -0.1634654, 1, 1, 1, 1, 1,
-1.574993, -0.9192941, -1.350701, 1, 1, 1, 1, 1,
-1.555786, 0.3036954, 0.1940963, 0, 0, 1, 1, 1,
-1.545804, 0.4764305, -1.8188, 1, 0, 0, 1, 1,
-1.535916, 0.05132922, -0.04291398, 1, 0, 0, 1, 1,
-1.532103, 0.1059329, -2.26613, 1, 0, 0, 1, 1,
-1.531494, 0.1808753, -0.6577057, 1, 0, 0, 1, 1,
-1.529892, -0.8829536, -2.218106, 1, 0, 0, 1, 1,
-1.528421, -0.05697994, -1.124474, 0, 0, 0, 1, 1,
-1.522188, -0.1028924, -2.189758, 0, 0, 0, 1, 1,
-1.511734, -1.04314, -1.057157, 0, 0, 0, 1, 1,
-1.486311, 0.5751653, -1.430672, 0, 0, 0, 1, 1,
-1.484745, -0.2595538, 0.05702425, 0, 0, 0, 1, 1,
-1.470725, -1.351957, -3.430256, 0, 0, 0, 1, 1,
-1.46727, 0.08113153, -2.546239, 0, 0, 0, 1, 1,
-1.446418, 1.414476, -1.887394, 1, 1, 1, 1, 1,
-1.426558, 0.9302122, -1.279583, 1, 1, 1, 1, 1,
-1.419659, 0.4351282, -1.368758, 1, 1, 1, 1, 1,
-1.407969, 0.6163806, -1.074967, 1, 1, 1, 1, 1,
-1.403261, 1.063173, 1.307414, 1, 1, 1, 1, 1,
-1.400261, -0.414592, -2.502085, 1, 1, 1, 1, 1,
-1.390565, -0.1720346, -1.002114, 1, 1, 1, 1, 1,
-1.384052, -1.478142, -3.707032, 1, 1, 1, 1, 1,
-1.382511, 0.7836962, -1.104886, 1, 1, 1, 1, 1,
-1.381035, 0.7003914, -0.7981526, 1, 1, 1, 1, 1,
-1.377055, -0.9235578, -3.76689, 1, 1, 1, 1, 1,
-1.365262, 1.744697, -0.5918835, 1, 1, 1, 1, 1,
-1.36109, 0.5947885, 0.7857395, 1, 1, 1, 1, 1,
-1.349101, -0.1018523, -1.944687, 1, 1, 1, 1, 1,
-1.339968, -0.4500147, -2.417936, 1, 1, 1, 1, 1,
-1.31945, -0.7066116, -1.058739, 0, 0, 1, 1, 1,
-1.314152, -1.559841, -0.6427332, 1, 0, 0, 1, 1,
-1.310471, 0.3097818, -0.3622546, 1, 0, 0, 1, 1,
-1.31031, 1.047465, -0.8207605, 1, 0, 0, 1, 1,
-1.293286, -0.001019477, -0.7420393, 1, 0, 0, 1, 1,
-1.291265, 1.376272, -0.05431296, 1, 0, 0, 1, 1,
-1.28594, 1.141229, -1.082927, 0, 0, 0, 1, 1,
-1.277634, 0.4370348, -2.569165, 0, 0, 0, 1, 1,
-1.274431, -1.653277, -2.542658, 0, 0, 0, 1, 1,
-1.273281, -0.3058619, -0.8666648, 0, 0, 0, 1, 1,
-1.269367, -0.8553178, -1.449379, 0, 0, 0, 1, 1,
-1.268035, 0.6158935, -0.5108571, 0, 0, 0, 1, 1,
-1.266802, -0.1230197, -0.4159087, 0, 0, 0, 1, 1,
-1.260924, -0.1938707, -1.207705, 1, 1, 1, 1, 1,
-1.257261, -1.105564, -2.268232, 1, 1, 1, 1, 1,
-1.247218, 0.7345095, -1.184132, 1, 1, 1, 1, 1,
-1.243913, -0.06917375, -1.216046, 1, 1, 1, 1, 1,
-1.24337, 0.3831076, -0.4008763, 1, 1, 1, 1, 1,
-1.235101, 1.19941, -1.612332, 1, 1, 1, 1, 1,
-1.232745, 1.870548, -0.2333556, 1, 1, 1, 1, 1,
-1.23063, 0.7689855, -1.318488, 1, 1, 1, 1, 1,
-1.230485, -0.1274785, -2.698857, 1, 1, 1, 1, 1,
-1.222258, 0.8645457, -1.58221, 1, 1, 1, 1, 1,
-1.211295, -0.1403034, -1.716019, 1, 1, 1, 1, 1,
-1.210567, 0.009674455, -0.8586114, 1, 1, 1, 1, 1,
-1.208568, -0.6870171, -0.1253981, 1, 1, 1, 1, 1,
-1.206965, -0.2489378, -0.4551147, 1, 1, 1, 1, 1,
-1.206052, -0.7267869, -4.119968, 1, 1, 1, 1, 1,
-1.20277, -0.05990554, -2.209766, 0, 0, 1, 1, 1,
-1.196447, 0.9898355, -1.712744, 1, 0, 0, 1, 1,
-1.194456, 1.441129, 0.5523067, 1, 0, 0, 1, 1,
-1.181758, 0.3471337, -1.320982, 1, 0, 0, 1, 1,
-1.181633, -1.253186, -3.991988, 1, 0, 0, 1, 1,
-1.180583, -0.2028628, -0.7570432, 1, 0, 0, 1, 1,
-1.167114, -0.5479748, -0.6570783, 0, 0, 0, 1, 1,
-1.164994, -1.480157, -3.174449, 0, 0, 0, 1, 1,
-1.163902, -0.7628901, -2.535991, 0, 0, 0, 1, 1,
-1.16188, -0.06594633, -1.779687, 0, 0, 0, 1, 1,
-1.161261, -1.31686, -2.434898, 0, 0, 0, 1, 1,
-1.151845, -0.7442631, -2.472719, 0, 0, 0, 1, 1,
-1.151628, -0.006178661, -1.108002, 0, 0, 0, 1, 1,
-1.15136, -0.1945657, -4.003858, 1, 1, 1, 1, 1,
-1.148664, 0.1120367, -1.921238, 1, 1, 1, 1, 1,
-1.148392, 0.09580976, -0.363606, 1, 1, 1, 1, 1,
-1.146503, -0.3852095, -3.944319, 1, 1, 1, 1, 1,
-1.141656, 1.15854, -2.091877, 1, 1, 1, 1, 1,
-1.141427, -0.3642982, -1.268949, 1, 1, 1, 1, 1,
-1.125224, 2.040597, -0.3496353, 1, 1, 1, 1, 1,
-1.123711, -0.5129366, -2.476566, 1, 1, 1, 1, 1,
-1.121916, -1.076234, -2.640892, 1, 1, 1, 1, 1,
-1.11093, 0.7427166, -0.6830078, 1, 1, 1, 1, 1,
-1.103662, 1.271706, -0.5096265, 1, 1, 1, 1, 1,
-1.094702, -0.376118, -2.647936, 1, 1, 1, 1, 1,
-1.086099, -1.503101, -3.67508, 1, 1, 1, 1, 1,
-1.084017, 0.2602562, -1.903676, 1, 1, 1, 1, 1,
-1.079408, 2.179658, -0.327594, 1, 1, 1, 1, 1,
-1.078515, 1.022622, 0.6896783, 0, 0, 1, 1, 1,
-1.076748, -0.009357276, -1.657013, 1, 0, 0, 1, 1,
-1.064628, -1.583711, -2.134522, 1, 0, 0, 1, 1,
-1.063218, -1.663524, -2.853605, 1, 0, 0, 1, 1,
-1.055034, -0.9710303, -0.6163875, 1, 0, 0, 1, 1,
-1.045072, -0.1778189, -2.12411, 1, 0, 0, 1, 1,
-1.038444, 0.002913319, 0.06989249, 0, 0, 0, 1, 1,
-1.004064, 0.008517855, -2.032669, 0, 0, 0, 1, 1,
-0.9995708, -1.67449, -0.2302903, 0, 0, 0, 1, 1,
-0.9976876, 0.1715916, -2.98449, 0, 0, 0, 1, 1,
-0.9930139, -0.401167, -1.411941, 0, 0, 0, 1, 1,
-0.9925892, -1.110458, -2.896597, 0, 0, 0, 1, 1,
-0.9873083, 0.7795672, -0.09215668, 0, 0, 0, 1, 1,
-0.9856081, 0.1403085, -1.624666, 1, 1, 1, 1, 1,
-0.9852007, -0.0297618, -1.788643, 1, 1, 1, 1, 1,
-0.9847798, 0.3877091, -0.3680843, 1, 1, 1, 1, 1,
-0.9722782, 0.6486604, -2.626928, 1, 1, 1, 1, 1,
-0.9661238, -1.186051, -2.95005, 1, 1, 1, 1, 1,
-0.9661027, 0.7102432, -1.280847, 1, 1, 1, 1, 1,
-0.9634894, 0.6543612, -1.438956, 1, 1, 1, 1, 1,
-0.9591023, 0.7732731, -2.192135, 1, 1, 1, 1, 1,
-0.9587631, 0.315543, 0.2125369, 1, 1, 1, 1, 1,
-0.9564224, -0.8616969, -1.642902, 1, 1, 1, 1, 1,
-0.9454846, -0.5810373, -2.2972, 1, 1, 1, 1, 1,
-0.9431631, -0.6349571, -2.632574, 1, 1, 1, 1, 1,
-0.9296874, 2.084145, 0.2998575, 1, 1, 1, 1, 1,
-0.9246234, 0.9755502, 0.1852575, 1, 1, 1, 1, 1,
-0.9191907, -0.6534769, -1.209448, 1, 1, 1, 1, 1,
-0.9167141, -0.415511, -1.559491, 0, 0, 1, 1, 1,
-0.9116994, 0.1570423, -0.5031323, 1, 0, 0, 1, 1,
-0.9043447, 0.2644942, -1.965563, 1, 0, 0, 1, 1,
-0.9028118, -0.8282785, -1.301262, 1, 0, 0, 1, 1,
-0.8996921, -0.8485909, -1.269924, 1, 0, 0, 1, 1,
-0.896781, -0.04589253, -1.710358, 1, 0, 0, 1, 1,
-0.8949615, -0.0698013, -2.193026, 0, 0, 0, 1, 1,
-0.8938114, 0.47249, -0.5564947, 0, 0, 0, 1, 1,
-0.8909045, 0.3799585, -2.092063, 0, 0, 0, 1, 1,
-0.8906697, 0.271656, -1.230952, 0, 0, 0, 1, 1,
-0.8888342, -0.1932602, -0.007439489, 0, 0, 0, 1, 1,
-0.8846173, 1.052786, -0.8776542, 0, 0, 0, 1, 1,
-0.8833982, 0.5131774, 0.3380586, 0, 0, 0, 1, 1,
-0.8815972, -1.031691, -1.073817, 1, 1, 1, 1, 1,
-0.8780507, 0.04413456, -0.4967312, 1, 1, 1, 1, 1,
-0.8677973, 0.9014997, -0.1406753, 1, 1, 1, 1, 1,
-0.8669525, -0.6127802, -1.15267, 1, 1, 1, 1, 1,
-0.8650215, -0.8473228, -3.49433, 1, 1, 1, 1, 1,
-0.8588955, 0.7381135, -0.3305292, 1, 1, 1, 1, 1,
-0.8579677, -0.3151644, -2.35171, 1, 1, 1, 1, 1,
-0.8552276, -1.940248, -3.962984, 1, 1, 1, 1, 1,
-0.8548768, -0.2319039, -1.171083, 1, 1, 1, 1, 1,
-0.8530878, 0.07176559, -2.186118, 1, 1, 1, 1, 1,
-0.8503917, -0.06251647, -1.539213, 1, 1, 1, 1, 1,
-0.8498227, 0.5848387, -2.524182, 1, 1, 1, 1, 1,
-0.844265, -1.440346, -1.78017, 1, 1, 1, 1, 1,
-0.8413836, -0.6307776, -2.071696, 1, 1, 1, 1, 1,
-0.8408446, -0.57804, -2.095413, 1, 1, 1, 1, 1,
-0.83714, -0.2329829, -1.509592, 0, 0, 1, 1, 1,
-0.834581, 2.405725, -2.217428, 1, 0, 0, 1, 1,
-0.82966, -0.3079707, -1.412881, 1, 0, 0, 1, 1,
-0.8260427, -1.067196, -1.898297, 1, 0, 0, 1, 1,
-0.8209008, 1.40204, 0.7189323, 1, 0, 0, 1, 1,
-0.8200406, -0.308552, -0.4800133, 1, 0, 0, 1, 1,
-0.8197666, 1.955261, 1.0231, 0, 0, 0, 1, 1,
-0.8196732, 0.9845205, -0.4248044, 0, 0, 0, 1, 1,
-0.8128381, -1.209485, -4.89867, 0, 0, 0, 1, 1,
-0.7996902, -0.1815794, -3.164678, 0, 0, 0, 1, 1,
-0.7994795, 0.8058646, -0.4150352, 0, 0, 0, 1, 1,
-0.7884279, 0.3124372, -0.3994805, 0, 0, 0, 1, 1,
-0.7816471, 1.572742, -1.315445, 0, 0, 0, 1, 1,
-0.7800443, -0.5474252, -2.69054, 1, 1, 1, 1, 1,
-0.779605, -1.782426, -1.228715, 1, 1, 1, 1, 1,
-0.7770015, -0.1412367, -0.479229, 1, 1, 1, 1, 1,
-0.7694833, 2.201333, -0.5084196, 1, 1, 1, 1, 1,
-0.7608091, 0.6019168, -0.459337, 1, 1, 1, 1, 1,
-0.7581629, -0.05160454, -1.268297, 1, 1, 1, 1, 1,
-0.7579329, -1.829209, -3.063607, 1, 1, 1, 1, 1,
-0.7546015, 0.5642325, -0.8213174, 1, 1, 1, 1, 1,
-0.7538332, -1.524632, -4.423916, 1, 1, 1, 1, 1,
-0.7528562, -0.9713155, -3.102269, 1, 1, 1, 1, 1,
-0.7449988, 1.383377, -2.123823, 1, 1, 1, 1, 1,
-0.7415461, 0.377555, 0.04637102, 1, 1, 1, 1, 1,
-0.7413133, 0.2020065, -1.15442, 1, 1, 1, 1, 1,
-0.7393006, -0.9803414, -2.730979, 1, 1, 1, 1, 1,
-0.7340283, -0.7661324, -2.736717, 1, 1, 1, 1, 1,
-0.7324011, 0.9778696, -1.542729, 0, 0, 1, 1, 1,
-0.7195991, 0.5683135, -0.9791241, 1, 0, 0, 1, 1,
-0.714954, -0.9583457, -3.771418, 1, 0, 0, 1, 1,
-0.7137864, -1.462246, -1.769789, 1, 0, 0, 1, 1,
-0.7097975, -1.161408, -3.380618, 1, 0, 0, 1, 1,
-0.709255, -0.7925313, -1.941903, 1, 0, 0, 1, 1,
-0.6998017, 1.261784, -1.93058, 0, 0, 0, 1, 1,
-0.6930816, 0.9285906, -1.603528, 0, 0, 0, 1, 1,
-0.6850819, -0.05099733, -0.7417552, 0, 0, 0, 1, 1,
-0.6766596, 1.126809, -2.728391, 0, 0, 0, 1, 1,
-0.6679342, -0.5175763, -2.811784, 0, 0, 0, 1, 1,
-0.6649875, 0.5164818, -0.6288933, 0, 0, 0, 1, 1,
-0.6608984, -0.7726652, -2.603745, 0, 0, 0, 1, 1,
-0.650197, -0.6991965, -2.575268, 1, 1, 1, 1, 1,
-0.6466276, 0.4880838, -1.194017, 1, 1, 1, 1, 1,
-0.6351224, 0.1478552, -0.7460362, 1, 1, 1, 1, 1,
-0.6337643, 0.3178348, -0.7264296, 1, 1, 1, 1, 1,
-0.6298153, 0.3107683, -1.1697, 1, 1, 1, 1, 1,
-0.6297324, -0.4930057, -2.890858, 1, 1, 1, 1, 1,
-0.6205624, -0.3024665, -1.414781, 1, 1, 1, 1, 1,
-0.6175127, -1.525198, -3.568087, 1, 1, 1, 1, 1,
-0.5905609, -0.001024166, -1.771438, 1, 1, 1, 1, 1,
-0.5884046, 0.6274477, -1.005567, 1, 1, 1, 1, 1,
-0.5813154, -0.1733403, -1.906137, 1, 1, 1, 1, 1,
-0.5787138, 0.3644788, -1.217883, 1, 1, 1, 1, 1,
-0.5722186, 1.034423, -1.022497, 1, 1, 1, 1, 1,
-0.5652618, -1.648136, -1.114287, 1, 1, 1, 1, 1,
-0.5613683, 1.224009, -0.2008431, 1, 1, 1, 1, 1,
-0.5584088, 0.9668847, -0.3670697, 0, 0, 1, 1, 1,
-0.5567313, -1.55079, -2.079207, 1, 0, 0, 1, 1,
-0.5562866, 1.54791, -1.875923, 1, 0, 0, 1, 1,
-0.5560297, 0.392286, -0.8861105, 1, 0, 0, 1, 1,
-0.5524835, 1.379915, 0.4976458, 1, 0, 0, 1, 1,
-0.5493154, 0.359681, -0.4342698, 1, 0, 0, 1, 1,
-0.5473907, 0.1818689, -2.754458, 0, 0, 0, 1, 1,
-0.5470689, -0.3867475, -3.328584, 0, 0, 0, 1, 1,
-0.5458823, 0.6644269, -0.4394474, 0, 0, 0, 1, 1,
-0.5279202, 0.4765138, -0.7749593, 0, 0, 0, 1, 1,
-0.5226579, 1.743735, -0.5783621, 0, 0, 0, 1, 1,
-0.5217621, -0.01530857, -1.785437, 0, 0, 0, 1, 1,
-0.5217377, -2.897155, -2.03306, 0, 0, 0, 1, 1,
-0.5205748, 1.446653, -1.59833, 1, 1, 1, 1, 1,
-0.5150695, 0.1437265, -2.130872, 1, 1, 1, 1, 1,
-0.5149279, -0.1471848, -2.976913, 1, 1, 1, 1, 1,
-0.5145029, 0.7421454, -1.548186, 1, 1, 1, 1, 1,
-0.5107453, 0.3632798, -2.099849, 1, 1, 1, 1, 1,
-0.5093696, -1.531003, -2.243414, 1, 1, 1, 1, 1,
-0.5058508, 0.589899, -0.3491104, 1, 1, 1, 1, 1,
-0.5052106, -0.3652211, -2.473085, 1, 1, 1, 1, 1,
-0.5050167, -0.4254105, -2.185612, 1, 1, 1, 1, 1,
-0.5041643, -1.225718, -1.422693, 1, 1, 1, 1, 1,
-0.5032274, -1.777269, -0.4386197, 1, 1, 1, 1, 1,
-0.502264, -1.506503, -4.630337, 1, 1, 1, 1, 1,
-0.4985802, 0.4085664, -0.7905473, 1, 1, 1, 1, 1,
-0.4976697, 0.8244686, -0.5625941, 1, 1, 1, 1, 1,
-0.4975103, 0.7402132, -0.5016407, 1, 1, 1, 1, 1,
-0.4893005, -0.4694607, -2.110045, 0, 0, 1, 1, 1,
-0.488907, 1.243814, 2.063904, 1, 0, 0, 1, 1,
-0.4881043, -1.27607, -4.057118, 1, 0, 0, 1, 1,
-0.4868248, -0.7023821, -1.397457, 1, 0, 0, 1, 1,
-0.4840193, -1.402463, -2.664113, 1, 0, 0, 1, 1,
-0.4807121, 0.9767187, 0.4472037, 1, 0, 0, 1, 1,
-0.4801474, 1.843063, -1.601361, 0, 0, 0, 1, 1,
-0.4789369, -0.8349048, -1.925444, 0, 0, 0, 1, 1,
-0.4773526, 2.03155, 0.2542095, 0, 0, 0, 1, 1,
-0.4757815, -0.787376, -4.904885, 0, 0, 0, 1, 1,
-0.4726317, -0.5115072, -3.189795, 0, 0, 0, 1, 1,
-0.4698831, 0.8340269, -0.372716, 0, 0, 0, 1, 1,
-0.4690071, -0.5034893, -2.690745, 0, 0, 0, 1, 1,
-0.4689503, 0.1526818, -1.331579, 1, 1, 1, 1, 1,
-0.4648519, 0.4433742, -0.6617342, 1, 1, 1, 1, 1,
-0.4640749, 1.42222, -1.644968, 1, 1, 1, 1, 1,
-0.4604072, 0.7628315, 0.124852, 1, 1, 1, 1, 1,
-0.4569148, 0.4217294, 0.4946459, 1, 1, 1, 1, 1,
-0.4481634, 0.525642, -0.1444644, 1, 1, 1, 1, 1,
-0.4384403, 1.169393, -1.746343, 1, 1, 1, 1, 1,
-0.4332823, -0.9576531, -1.248716, 1, 1, 1, 1, 1,
-0.4253948, -0.725042, -1.072147, 1, 1, 1, 1, 1,
-0.4175972, -0.2851517, -2.048508, 1, 1, 1, 1, 1,
-0.4172757, -0.1629353, -2.992905, 1, 1, 1, 1, 1,
-0.4083989, -0.7283774, -2.979839, 1, 1, 1, 1, 1,
-0.4083261, 0.7517361, -0.2816695, 1, 1, 1, 1, 1,
-0.4058872, -0.158325, -2.029534, 1, 1, 1, 1, 1,
-0.404159, -0.1862071, -1.339209, 1, 1, 1, 1, 1,
-0.4028763, 0.5467708, -0.8913063, 0, 0, 1, 1, 1,
-0.4028741, -0.6999414, -2.75942, 1, 0, 0, 1, 1,
-0.4003105, -0.5617303, -1.44943, 1, 0, 0, 1, 1,
-0.3994961, 0.7670661, 0.2017937, 1, 0, 0, 1, 1,
-0.3927063, -0.07076066, -1.880742, 1, 0, 0, 1, 1,
-0.3821805, -0.9267523, -3.976646, 1, 0, 0, 1, 1,
-0.3818771, -0.5838862, -4.058537, 0, 0, 0, 1, 1,
-0.3814414, 1.480059, -0.8854268, 0, 0, 0, 1, 1,
-0.3670951, -1.070884, -2.900296, 0, 0, 0, 1, 1,
-0.3666043, -1.23451, -0.4912505, 0, 0, 0, 1, 1,
-0.3664807, -0.9813175, -1.738352, 0, 0, 0, 1, 1,
-0.3635151, 1.25399, -0.2566971, 0, 0, 0, 1, 1,
-0.3623502, -0.5604302, -3.141974, 0, 0, 0, 1, 1,
-0.3598381, -0.5377096, -2.51006, 1, 1, 1, 1, 1,
-0.3594412, 0.5425693, -2.454184, 1, 1, 1, 1, 1,
-0.3546261, 1.00634, -0.9355494, 1, 1, 1, 1, 1,
-0.3529512, 1.293947, -1.812755, 1, 1, 1, 1, 1,
-0.3524837, 0.2232037, -0.9650975, 1, 1, 1, 1, 1,
-0.3523036, 1.586592, -0.3572112, 1, 1, 1, 1, 1,
-0.351242, 1.141862, -0.4685175, 1, 1, 1, 1, 1,
-0.3511083, 0.5976889, -0.390846, 1, 1, 1, 1, 1,
-0.3491464, 0.09474038, -2.712055, 1, 1, 1, 1, 1,
-0.3489796, -0.1818376, -2.718851, 1, 1, 1, 1, 1,
-0.3473873, -0.5247554, -4.107156, 1, 1, 1, 1, 1,
-0.3435768, 0.5871966, 0.6513988, 1, 1, 1, 1, 1,
-0.3425871, -1.78782, -2.664417, 1, 1, 1, 1, 1,
-0.3425218, -0.9166352, -2.010769, 1, 1, 1, 1, 1,
-0.3407182, -0.09921748, -2.744025, 1, 1, 1, 1, 1,
-0.3395256, -0.4027016, -1.759138, 0, 0, 1, 1, 1,
-0.3359617, -0.7493631, -2.568944, 1, 0, 0, 1, 1,
-0.3289569, -1.052668, -3.320301, 1, 0, 0, 1, 1,
-0.3280326, -0.280304, -2.663823, 1, 0, 0, 1, 1,
-0.3211481, 0.196781, -1.472155, 1, 0, 0, 1, 1,
-0.3206971, -0.3911396, -2.901459, 1, 0, 0, 1, 1,
-0.3167035, 1.893777, 1.395917, 0, 0, 0, 1, 1,
-0.3129914, 1.051674, -1.424222, 0, 0, 0, 1, 1,
-0.308275, -0.2563913, -3.094064, 0, 0, 0, 1, 1,
-0.3069544, 1.115118, -0.5645945, 0, 0, 0, 1, 1,
-0.3023064, 0.956865, 1.737889, 0, 0, 0, 1, 1,
-0.3019383, 0.5376897, -1.127363, 0, 0, 0, 1, 1,
-0.2950661, 0.1339203, -2.965975, 0, 0, 0, 1, 1,
-0.2948092, -0.6413641, -2.592103, 1, 1, 1, 1, 1,
-0.2926992, 1.592852, -1.206774, 1, 1, 1, 1, 1,
-0.2921934, 1.590054, 0.1125053, 1, 1, 1, 1, 1,
-0.2899004, 0.9827543, -1.476873, 1, 1, 1, 1, 1,
-0.2881017, 1.177402, 0.03592724, 1, 1, 1, 1, 1,
-0.2796771, -0.01963615, -1.68221, 1, 1, 1, 1, 1,
-0.2778299, 0.04356531, -0.5231632, 1, 1, 1, 1, 1,
-0.2767688, 1.042699, 0.3645387, 1, 1, 1, 1, 1,
-0.27676, 0.06218883, -0.877831, 1, 1, 1, 1, 1,
-0.2756218, -0.8114522, -4.799737, 1, 1, 1, 1, 1,
-0.2721069, 0.03414471, -0.4513404, 1, 1, 1, 1, 1,
-0.2712601, -0.2730127, -2.845598, 1, 1, 1, 1, 1,
-0.269528, 1.723074, -1.323688, 1, 1, 1, 1, 1,
-0.2689208, 0.3902864, -1.347856, 1, 1, 1, 1, 1,
-0.2687985, 0.9305717, -1.957947, 1, 1, 1, 1, 1,
-0.2687654, 1.775424, -1.140396, 0, 0, 1, 1, 1,
-0.2687446, 0.8576062, 0.5676916, 1, 0, 0, 1, 1,
-0.268042, 0.8709396, -2.328523, 1, 0, 0, 1, 1,
-0.262659, -1.696055, -2.457483, 1, 0, 0, 1, 1,
-0.2526003, -0.9296404, -3.211076, 1, 0, 0, 1, 1,
-0.2505146, 0.2925103, -0.9603049, 1, 0, 0, 1, 1,
-0.2484239, 0.5784213, -1.492195, 0, 0, 0, 1, 1,
-0.2397097, -1.244296, -3.786438, 0, 0, 0, 1, 1,
-0.2379684, -2.262965, -5.521664, 0, 0, 0, 1, 1,
-0.236659, -0.6596707, -1.778805, 0, 0, 0, 1, 1,
-0.2354933, 1.31114, 0.8076889, 0, 0, 0, 1, 1,
-0.232969, -0.8487253, -3.768912, 0, 0, 0, 1, 1,
-0.2311675, 0.5839805, 0.4817192, 0, 0, 0, 1, 1,
-0.2309254, 2.169942, 0.6775106, 1, 1, 1, 1, 1,
-0.2307802, -1.50177, -2.354936, 1, 1, 1, 1, 1,
-0.2295204, 0.8662911, 0.4427249, 1, 1, 1, 1, 1,
-0.2285673, 1.098665, -0.8844728, 1, 1, 1, 1, 1,
-0.2283913, 1.10642, 0.5289625, 1, 1, 1, 1, 1,
-0.225862, 0.6454532, -0.6859446, 1, 1, 1, 1, 1,
-0.2252404, -0.3264005, -0.7900758, 1, 1, 1, 1, 1,
-0.2182076, 1.895542, -0.1380874, 1, 1, 1, 1, 1,
-0.2080101, -0.3475125, -4.410789, 1, 1, 1, 1, 1,
-0.2077007, -0.3407513, -4.327049, 1, 1, 1, 1, 1,
-0.2075091, -0.5467278, -3.121167, 1, 1, 1, 1, 1,
-0.2044088, -0.24483, -1.312859, 1, 1, 1, 1, 1,
-0.2023785, 2.141271, 0.08910069, 1, 1, 1, 1, 1,
-0.2011635, 0.5051696, -1.705407, 1, 1, 1, 1, 1,
-0.1971716, 0.5856555, -1.067041, 1, 1, 1, 1, 1,
-0.1936324, 0.6007894, 0.2808118, 0, 0, 1, 1, 1,
-0.1917736, 0.8821095, 0.04029288, 1, 0, 0, 1, 1,
-0.1894239, -1.867467, -2.651681, 1, 0, 0, 1, 1,
-0.1873432, 0.3786162, 0.4814586, 1, 0, 0, 1, 1,
-0.1855252, -0.7713306, -3.941717, 1, 0, 0, 1, 1,
-0.1843946, 0.0302267, -1.737077, 1, 0, 0, 1, 1,
-0.1806293, 0.4848692, 1.096411, 0, 0, 0, 1, 1,
-0.1795909, 0.5930901, -0.492016, 0, 0, 0, 1, 1,
-0.1793264, 0.6038373, -0.1581374, 0, 0, 0, 1, 1,
-0.1780198, 0.8769593, 0.6837485, 0, 0, 0, 1, 1,
-0.1739929, -0.0003678171, -1.479967, 0, 0, 0, 1, 1,
-0.1716935, -0.7287381, -2.918019, 0, 0, 0, 1, 1,
-0.170505, -0.1313729, -1.018633, 0, 0, 0, 1, 1,
-0.1694989, 0.5005128, -1.945477, 1, 1, 1, 1, 1,
-0.1621743, -0.8539326, -2.038467, 1, 1, 1, 1, 1,
-0.1617826, -0.8469961, -3.169808, 1, 1, 1, 1, 1,
-0.1617125, -0.6902, -3.938897, 1, 1, 1, 1, 1,
-0.1601553, 0.5276924, -0.09360919, 1, 1, 1, 1, 1,
-0.1595267, 0.2086547, -1.093693, 1, 1, 1, 1, 1,
-0.1584175, -0.8661484, -3.515175, 1, 1, 1, 1, 1,
-0.1557838, -0.791407, -2.865565, 1, 1, 1, 1, 1,
-0.1508525, 0.2088171, -1.450623, 1, 1, 1, 1, 1,
-0.1484392, -1.753906, -3.484016, 1, 1, 1, 1, 1,
-0.1415915, 0.05978442, -1.009495, 1, 1, 1, 1, 1,
-0.1398814, 0.5166699, -2.086616, 1, 1, 1, 1, 1,
-0.1380085, -0.2423307, -3.717949, 1, 1, 1, 1, 1,
-0.1345655, -1.423452, -2.93588, 1, 1, 1, 1, 1,
-0.1313097, 0.6570983, 0.4611446, 1, 1, 1, 1, 1,
-0.1307874, -1.469465, -2.58293, 0, 0, 1, 1, 1,
-0.1285257, -0.6726623, -2.749938, 1, 0, 0, 1, 1,
-0.1267119, 1.998627, -0.2231467, 1, 0, 0, 1, 1,
-0.1262635, -0.5765033, -3.966834, 1, 0, 0, 1, 1,
-0.1253379, 1.5652, -0.5594244, 1, 0, 0, 1, 1,
-0.1204393, 1.561413, 0.3598898, 1, 0, 0, 1, 1,
-0.1154785, 0.4610876, 0.02347915, 0, 0, 0, 1, 1,
-0.1130364, -0.07961491, -1.080659, 0, 0, 0, 1, 1,
-0.1108186, 0.2778977, 0.7893044, 0, 0, 0, 1, 1,
-0.1100559, 0.2212715, -0.6931256, 0, 0, 0, 1, 1,
-0.1066402, 0.9539227, -2.152331, 0, 0, 0, 1, 1,
-0.1061874, -1.489634, -2.982759, 0, 0, 0, 1, 1,
-0.105905, -0.6166689, -3.052231, 0, 0, 0, 1, 1,
-0.1020036, -0.1305437, -0.7136269, 1, 1, 1, 1, 1,
-0.09981774, -1.318739, -3.098295, 1, 1, 1, 1, 1,
-0.09868631, -0.922142, -2.302233, 1, 1, 1, 1, 1,
-0.09828106, 1.012427, 0.6895306, 1, 1, 1, 1, 1,
-0.0973032, -1.269349, -4.286228, 1, 1, 1, 1, 1,
-0.09634584, -0.8172621, -2.538147, 1, 1, 1, 1, 1,
-0.09523813, -1.497587, -3.496107, 1, 1, 1, 1, 1,
-0.0927471, -0.7485399, -4.739259, 1, 1, 1, 1, 1,
-0.09266952, -0.1532532, -4.549825, 1, 1, 1, 1, 1,
-0.0925708, 1.351405, -0.4715833, 1, 1, 1, 1, 1,
-0.09072403, -1.300256, -3.136067, 1, 1, 1, 1, 1,
-0.08925121, 1.33432, -0.1794115, 1, 1, 1, 1, 1,
-0.08739914, -1.016522, -1.016774, 1, 1, 1, 1, 1,
-0.08734225, -0.9382309, -4.362751, 1, 1, 1, 1, 1,
-0.08599658, 0.4646534, -1.163607, 1, 1, 1, 1, 1,
-0.08305299, 0.6456109, 0.2015248, 0, 0, 1, 1, 1,
-0.08056867, -0.099493, -2.769938, 1, 0, 0, 1, 1,
-0.07822139, -1.073816, -2.863433, 1, 0, 0, 1, 1,
-0.07539519, -0.3617954, -2.961709, 1, 0, 0, 1, 1,
-0.07377787, 0.4704761, -1.985242, 1, 0, 0, 1, 1,
-0.07230579, 0.9346591, -0.6883175, 1, 0, 0, 1, 1,
-0.06903732, 0.7145218, 1.738265, 0, 0, 0, 1, 1,
-0.06854167, 1.3093, -0.1155018, 0, 0, 0, 1, 1,
-0.06812897, 0.50078, -0.597622, 0, 0, 0, 1, 1,
-0.05655207, -1.625919, -3.496879, 0, 0, 0, 1, 1,
-0.05587191, 0.887815, -1.26684, 0, 0, 0, 1, 1,
-0.05508272, -2.019294, -1.791285, 0, 0, 0, 1, 1,
-0.05329189, -0.4273216, -2.54924, 0, 0, 0, 1, 1,
-0.05186298, -0.09014458, -1.033003, 1, 1, 1, 1, 1,
-0.05048779, -0.8977858, -4.009372, 1, 1, 1, 1, 1,
-0.04720116, -0.6869406, -2.845149, 1, 1, 1, 1, 1,
-0.04717957, 0.5441441, -1.626915, 1, 1, 1, 1, 1,
-0.04566133, -0.03448112, -1.55445, 1, 1, 1, 1, 1,
-0.0417289, 1.328802, -1.212344, 1, 1, 1, 1, 1,
-0.04069584, -1.154414, -3.240833, 1, 1, 1, 1, 1,
-0.03243389, -0.3474329, -1.999197, 1, 1, 1, 1, 1,
-0.03101573, 0.3193341, -1.970029, 1, 1, 1, 1, 1,
-0.03023544, -0.189497, -2.034612, 1, 1, 1, 1, 1,
-0.02740387, 2.62974, 0.559382, 1, 1, 1, 1, 1,
-0.027013, -1.410461, -3.266802, 1, 1, 1, 1, 1,
-0.02537574, -0.01914801, -2.354365, 1, 1, 1, 1, 1,
-0.02532937, -0.4303857, -2.248598, 1, 1, 1, 1, 1,
-0.02297091, 0.04488094, -0.2944382, 1, 1, 1, 1, 1,
-0.02225341, 1.435603, 1.407694, 0, 0, 1, 1, 1,
-0.01744591, -0.3559942, -4.231759, 1, 0, 0, 1, 1,
-0.01335452, 1.139937, 1.106165, 1, 0, 0, 1, 1,
-0.01115734, -0.3022986, -2.700904, 1, 0, 0, 1, 1,
-0.01075032, -1.915232, -3.11712, 1, 0, 0, 1, 1,
-0.008605259, 0.1442937, 0.2825079, 1, 0, 0, 1, 1,
-0.008294334, -0.03947386, -2.188372, 0, 0, 0, 1, 1,
-0.008140416, 1.288362, 0.4060234, 0, 0, 0, 1, 1,
-0.005864196, 0.7888929, -0.1261704, 0, 0, 0, 1, 1,
-0.000838251, 0.1120861, -0.1906257, 0, 0, 0, 1, 1,
0.00113505, -1.827162, 3.618274, 0, 0, 0, 1, 1,
0.002173345, -0.1488052, 3.300071, 0, 0, 0, 1, 1,
0.002235761, 1.523043, 1.447026, 0, 0, 0, 1, 1,
0.002653453, 0.5657437, 0.6538065, 1, 1, 1, 1, 1,
0.003856867, 0.3313683, -0.9087946, 1, 1, 1, 1, 1,
0.01078582, -2.489873, 2.098637, 1, 1, 1, 1, 1,
0.01176223, -0.1850122, 2.551286, 1, 1, 1, 1, 1,
0.0119263, 1.47977, 2.179669, 1, 1, 1, 1, 1,
0.01199859, 0.1075693, -1.244932, 1, 1, 1, 1, 1,
0.01387052, 0.5808595, 0.4325997, 1, 1, 1, 1, 1,
0.02264957, 0.1799522, -1.115158, 1, 1, 1, 1, 1,
0.0241925, 1.679007, 0.6761258, 1, 1, 1, 1, 1,
0.03294423, 0.9571008, -0.2223539, 1, 1, 1, 1, 1,
0.03514041, 1.341103, -0.03270375, 1, 1, 1, 1, 1,
0.03553519, -1.042711, 1.827333, 1, 1, 1, 1, 1,
0.03772131, -0.03195847, 0.3661941, 1, 1, 1, 1, 1,
0.04045986, -1.662852, 3.213959, 1, 1, 1, 1, 1,
0.04091944, 0.05342723, 1.753451, 1, 1, 1, 1, 1,
0.04244688, 0.0984226, 1.173473, 0, 0, 1, 1, 1,
0.0446244, 0.1607468, 0.04676333, 1, 0, 0, 1, 1,
0.04515518, -0.2093074, 2.986118, 1, 0, 0, 1, 1,
0.04878315, 0.4790689, 0.4040608, 1, 0, 0, 1, 1,
0.04878424, 0.1552759, 0.2655283, 1, 0, 0, 1, 1,
0.0509396, -0.8508309, 3.6923, 1, 0, 0, 1, 1,
0.05944961, -0.1336654, 3.219928, 0, 0, 0, 1, 1,
0.06067226, -0.2075759, 1.823744, 0, 0, 0, 1, 1,
0.06068018, 0.3758611, 2.045413, 0, 0, 0, 1, 1,
0.06323467, -0.7975278, 3.402572, 0, 0, 0, 1, 1,
0.06412399, 0.6082479, -0.5345725, 0, 0, 0, 1, 1,
0.066081, 0.2118486, 1.47163, 0, 0, 0, 1, 1,
0.07010057, -2.819667, 1.59474, 0, 0, 0, 1, 1,
0.070599, 1.218751, 0.8105683, 1, 1, 1, 1, 1,
0.07318591, 0.4526763, -0.7304757, 1, 1, 1, 1, 1,
0.07321002, 0.3441754, -0.4318821, 1, 1, 1, 1, 1,
0.08328938, 1.532079, 0.2941923, 1, 1, 1, 1, 1,
0.08409802, -0.9969916, 2.197884, 1, 1, 1, 1, 1,
0.08524188, 1.219624, -0.4916375, 1, 1, 1, 1, 1,
0.08807312, 0.6372023, 0.0631876, 1, 1, 1, 1, 1,
0.09105542, 1.403563, 0.009611314, 1, 1, 1, 1, 1,
0.09249172, -0.1901359, 3.006582, 1, 1, 1, 1, 1,
0.09439502, -0.5309049, 2.079201, 1, 1, 1, 1, 1,
0.1067308, 0.5322152, -0.5980893, 1, 1, 1, 1, 1,
0.1118095, -2.113173, 2.834165, 1, 1, 1, 1, 1,
0.1133564, 0.2011259, 0.2665786, 1, 1, 1, 1, 1,
0.1157133, -1.296833, 2.161167, 1, 1, 1, 1, 1,
0.1172692, -1.272901, 2.209569, 1, 1, 1, 1, 1,
0.1213706, 0.7436807, -0.6445173, 0, 0, 1, 1, 1,
0.1222719, 0.2074664, -0.5642363, 1, 0, 0, 1, 1,
0.1297799, 0.6049179, 1.530257, 1, 0, 0, 1, 1,
0.1330906, 0.276994, -0.3240593, 1, 0, 0, 1, 1,
0.1344587, -0.1394096, 1.77401, 1, 0, 0, 1, 1,
0.1358954, 0.9714433, 2.006041, 1, 0, 0, 1, 1,
0.1359432, 0.2152658, -0.7313194, 0, 0, 0, 1, 1,
0.1411638, -1.027416, 2.989866, 0, 0, 0, 1, 1,
0.141659, -2.288239, 4.25578, 0, 0, 0, 1, 1,
0.14497, -0.2468911, 3.094794, 0, 0, 0, 1, 1,
0.1480027, 0.6697822, 0.2710429, 0, 0, 0, 1, 1,
0.1501061, -0.04186486, 2.017636, 0, 0, 0, 1, 1,
0.1503564, 0.1090284, 2.015362, 0, 0, 0, 1, 1,
0.1542312, 1.770136, 0.01852179, 1, 1, 1, 1, 1,
0.1544242, 0.706139, -0.9926558, 1, 1, 1, 1, 1,
0.1553553, -0.6022707, 4.18658, 1, 1, 1, 1, 1,
0.1614173, -0.5841776, 2.200923, 1, 1, 1, 1, 1,
0.1624543, 0.0557055, 1.950925, 1, 1, 1, 1, 1,
0.1626719, -1.318678, 5.122435, 1, 1, 1, 1, 1,
0.1632925, -1.130061, 2.750516, 1, 1, 1, 1, 1,
0.180267, 0.4962425, 0.7047465, 1, 1, 1, 1, 1,
0.1823709, 0.2156299, -0.5092679, 1, 1, 1, 1, 1,
0.1828071, -0.5472339, 1.865435, 1, 1, 1, 1, 1,
0.1845077, 0.7798758, 0.9161204, 1, 1, 1, 1, 1,
0.1849757, 2.158184, -0.1177533, 1, 1, 1, 1, 1,
0.186141, 0.3808452, 1.29943, 1, 1, 1, 1, 1,
0.186606, 1.160096, 0.7041082, 1, 1, 1, 1, 1,
0.1883554, -0.494172, 3.214553, 1, 1, 1, 1, 1,
0.1919843, -1.384835, 3.702402, 0, 0, 1, 1, 1,
0.1944067, 1.109871, -1.097532, 1, 0, 0, 1, 1,
0.1974462, -0.1660944, 0.9556289, 1, 0, 0, 1, 1,
0.197761, -0.1193409, 2.734948, 1, 0, 0, 1, 1,
0.1981648, -1.097606, 3.746705, 1, 0, 0, 1, 1,
0.198575, 1.899758, 0.4356851, 1, 0, 0, 1, 1,
0.2018173, -0.8196912, 3.836987, 0, 0, 0, 1, 1,
0.206558, 2.379544, 1.122083, 0, 0, 0, 1, 1,
0.2149229, 1.419719, 0.3875831, 0, 0, 0, 1, 1,
0.2159064, -0.3802986, 2.427953, 0, 0, 0, 1, 1,
0.2196866, -0.1565706, 1.313025, 0, 0, 0, 1, 1,
0.221604, 0.2632651, 0.5790616, 0, 0, 0, 1, 1,
0.2220013, -0.6702653, 2.001194, 0, 0, 0, 1, 1,
0.222133, -0.4116578, 2.135146, 1, 1, 1, 1, 1,
0.2240709, -0.7702504, 1.425574, 1, 1, 1, 1, 1,
0.2290861, 1.473897, 0.658227, 1, 1, 1, 1, 1,
0.2293461, 0.05952912, 2.64914, 1, 1, 1, 1, 1,
0.2356923, 0.4058908, -0.343679, 1, 1, 1, 1, 1,
0.2381685, -0.3139969, 2.264646, 1, 1, 1, 1, 1,
0.2391236, -0.3212054, 2.460898, 1, 1, 1, 1, 1,
0.2403709, -0.1345084, 2.260218, 1, 1, 1, 1, 1,
0.2424463, -1.55469, 2.563723, 1, 1, 1, 1, 1,
0.2500365, -0.9258281, 3.588043, 1, 1, 1, 1, 1,
0.2500891, -1.89383, 3.092796, 1, 1, 1, 1, 1,
0.2580799, 0.8516992, 2.132981, 1, 1, 1, 1, 1,
0.261621, 0.2359602, 0.3961653, 1, 1, 1, 1, 1,
0.2620097, 0.4539033, 0.8859639, 1, 1, 1, 1, 1,
0.2631878, 2.135387, -0.2399407, 1, 1, 1, 1, 1,
0.2649364, 1.797755, -0.653698, 0, 0, 1, 1, 1,
0.265355, -0.190912, 3.494958, 1, 0, 0, 1, 1,
0.265672, 0.463365, -0.701443, 1, 0, 0, 1, 1,
0.2692682, 1.057015, 2.229453, 1, 0, 0, 1, 1,
0.2694394, 0.4283243, 0.3885463, 1, 0, 0, 1, 1,
0.2741986, -0.4646555, 3.540009, 1, 0, 0, 1, 1,
0.2809977, -1.608017, 3.539458, 0, 0, 0, 1, 1,
0.2847528, -0.8844392, 3.598391, 0, 0, 0, 1, 1,
0.2883687, 0.5653362, -0.02124076, 0, 0, 0, 1, 1,
0.2914781, -1.066911, 2.676309, 0, 0, 0, 1, 1,
0.2938423, 0.4915677, 0.4552767, 0, 0, 0, 1, 1,
0.3024167, 0.8020591, 0.201442, 0, 0, 0, 1, 1,
0.3111984, -0.53548, 4.040221, 0, 0, 0, 1, 1,
0.312214, -0.5563051, 2.330576, 1, 1, 1, 1, 1,
0.3171061, 0.746366, -1.091476, 1, 1, 1, 1, 1,
0.3199125, -0.02781408, 2.766932, 1, 1, 1, 1, 1,
0.3232266, -0.5124866, 2.8984, 1, 1, 1, 1, 1,
0.3242332, 1.684529, 0.06029141, 1, 1, 1, 1, 1,
0.3273589, 0.7272829, 0.4712442, 1, 1, 1, 1, 1,
0.3325819, 0.7026314, 1.912033, 1, 1, 1, 1, 1,
0.3343, 0.09902, 1.185275, 1, 1, 1, 1, 1,
0.3353368, -1.360524, 4.059615, 1, 1, 1, 1, 1,
0.3402102, -0.9546624, 0.9753419, 1, 1, 1, 1, 1,
0.3404194, -0.5086398, 2.670894, 1, 1, 1, 1, 1,
0.3409866, 1.028028, -0.4947734, 1, 1, 1, 1, 1,
0.343523, -1.734773, 2.547457, 1, 1, 1, 1, 1,
0.3453123, -0.5456251, 1.367475, 1, 1, 1, 1, 1,
0.3484263, 0.7034469, 0.940755, 1, 1, 1, 1, 1,
0.3530445, -2.26623, 3.44278, 0, 0, 1, 1, 1,
0.3535658, 0.3637349, -0.3769277, 1, 0, 0, 1, 1,
0.3543223, 0.7907876, -0.3256807, 1, 0, 0, 1, 1,
0.3562438, 0.9286051, -0.6620673, 1, 0, 0, 1, 1,
0.3611859, -1.98566, 1.742727, 1, 0, 0, 1, 1,
0.3613429, 0.4881482, 1.786016, 1, 0, 0, 1, 1,
0.367759, 1.126746, 1.562399, 0, 0, 0, 1, 1,
0.37117, -1.760143, -0.4405506, 0, 0, 0, 1, 1,
0.3740107, -1.961037, 1.359163, 0, 0, 0, 1, 1,
0.3778193, -0.6143709, 3.238857, 0, 0, 0, 1, 1,
0.3791554, -0.3523403, 3.65226, 0, 0, 0, 1, 1,
0.3803548, 0.9964911, 1.201025, 0, 0, 0, 1, 1,
0.3809477, -0.8043305, 2.389203, 0, 0, 0, 1, 1,
0.3812824, -0.136623, 3.418393, 1, 1, 1, 1, 1,
0.384001, 0.8736431, 2.137992, 1, 1, 1, 1, 1,
0.3895812, 1.165654, 1.052968, 1, 1, 1, 1, 1,
0.3913418, 0.7344208, 0.8027778, 1, 1, 1, 1, 1,
0.397137, 0.6131638, 0.5154878, 1, 1, 1, 1, 1,
0.3984241, -0.2820261, 0.8787617, 1, 1, 1, 1, 1,
0.3997746, 1.54223, 0.5099341, 1, 1, 1, 1, 1,
0.406848, -1.486725, 5.361122, 1, 1, 1, 1, 1,
0.4073832, 1.569731, -0.7071621, 1, 1, 1, 1, 1,
0.4078013, -0.8125001, 3.14583, 1, 1, 1, 1, 1,
0.4078018, -1.123591, 3.623408, 1, 1, 1, 1, 1,
0.4089873, 0.2736891, 2.036635, 1, 1, 1, 1, 1,
0.4104466, 0.7916728, -1.453778, 1, 1, 1, 1, 1,
0.4177908, -1.769279, 2.091213, 1, 1, 1, 1, 1,
0.4229619, 0.2688035, 0.3158427, 1, 1, 1, 1, 1,
0.4248737, -0.3771344, 1.382571, 0, 0, 1, 1, 1,
0.4263352, 0.8861552, 2.024221, 1, 0, 0, 1, 1,
0.4337723, 0.1630319, 1.130904, 1, 0, 0, 1, 1,
0.4357497, 0.3945246, 0.1928743, 1, 0, 0, 1, 1,
0.4369293, -0.3267817, 1.627689, 1, 0, 0, 1, 1,
0.442406, -0.04960146, 0.09989908, 1, 0, 0, 1, 1,
0.4445028, 1.191855, 0.03782225, 0, 0, 0, 1, 1,
0.4530421, 0.5498393, -0.2310988, 0, 0, 0, 1, 1,
0.4556101, -0.5026443, 3.147427, 0, 0, 0, 1, 1,
0.4574161, -0.5688421, 3.293429, 0, 0, 0, 1, 1,
0.457949, 0.3997166, 2.27996, 0, 0, 0, 1, 1,
0.4600879, -0.246162, 2.153308, 0, 0, 0, 1, 1,
0.4639093, -0.7017955, 2.625468, 0, 0, 0, 1, 1,
0.4712683, -0.6626315, 1.463601, 1, 1, 1, 1, 1,
0.4734967, -0.4609848, 2.300586, 1, 1, 1, 1, 1,
0.4737993, 1.147409, -0.2462665, 1, 1, 1, 1, 1,
0.4759176, -1.186339, 2.907727, 1, 1, 1, 1, 1,
0.4775893, 0.9858288, 0.5984195, 1, 1, 1, 1, 1,
0.4804233, 1.62263, -1.330533, 1, 1, 1, 1, 1,
0.4811772, -0.1293396, 2.574039, 1, 1, 1, 1, 1,
0.4913154, -0.956036, 4.480984, 1, 1, 1, 1, 1,
0.4932527, 0.3809875, 0.8871711, 1, 1, 1, 1, 1,
0.493365, -0.6199691, 1.76706, 1, 1, 1, 1, 1,
0.4955628, 1.37713, -0.4468468, 1, 1, 1, 1, 1,
0.4962233, 0.3231575, 2.403933, 1, 1, 1, 1, 1,
0.4977193, 2.180851, -0.2060594, 1, 1, 1, 1, 1,
0.4989911, -1.827689, 4.75173, 1, 1, 1, 1, 1,
0.5009372, 1.241086, 1.269277, 1, 1, 1, 1, 1,
0.5015349, -0.0236657, 1.4768, 0, 0, 1, 1, 1,
0.5018252, -0.2704604, 1.914854, 1, 0, 0, 1, 1,
0.5027224, -0.2409052, 3.294991, 1, 0, 0, 1, 1,
0.5058817, -0.2975643, 2.901296, 1, 0, 0, 1, 1,
0.5159064, 0.9366342, -0.5069295, 1, 0, 0, 1, 1,
0.5209605, -0.04872831, 0.6628651, 1, 0, 0, 1, 1,
0.5222949, 0.1620486, 1.937125, 0, 0, 0, 1, 1,
0.5294443, 0.3185385, 0.8336157, 0, 0, 0, 1, 1,
0.5335955, 1.028396, 0.8155215, 0, 0, 0, 1, 1,
0.5426226, 0.7161262, 1.801728, 0, 0, 0, 1, 1,
0.5461362, -0.9195294, 2.840622, 0, 0, 0, 1, 1,
0.5505407, -0.05945122, 0.7685287, 0, 0, 0, 1, 1,
0.5529617, -1.088217, 3.75513, 0, 0, 0, 1, 1,
0.5559421, 0.4646412, 0.8391027, 1, 1, 1, 1, 1,
0.5602088, 0.1672308, 1.685532, 1, 1, 1, 1, 1,
0.5605648, 0.6411291, 0.1926535, 1, 1, 1, 1, 1,
0.5655108, -2.009817, 1.514563, 1, 1, 1, 1, 1,
0.5673605, 0.6106926, 2.207459, 1, 1, 1, 1, 1,
0.5687809, 1.682558, 0.0126938, 1, 1, 1, 1, 1,
0.5741064, -1.820125, 4.06917, 1, 1, 1, 1, 1,
0.5744469, -0.1490335, 1.417763, 1, 1, 1, 1, 1,
0.5791838, 0.6667833, 1.354692, 1, 1, 1, 1, 1,
0.5797622, -0.9475733, 1.368836, 1, 1, 1, 1, 1,
0.5825668, -0.3950473, 1.815594, 1, 1, 1, 1, 1,
0.598358, 1.272239, 0.4187952, 1, 1, 1, 1, 1,
0.6037759, -0.9897805, 1.87505, 1, 1, 1, 1, 1,
0.6048492, 2.062606, -0.1335438, 1, 1, 1, 1, 1,
0.6066079, 0.9152676, 1.072178, 1, 1, 1, 1, 1,
0.6086742, -0.1728526, 3.233073, 0, 0, 1, 1, 1,
0.6103037, 0.7547017, -0.6142105, 1, 0, 0, 1, 1,
0.6132818, -1.131548, 2.425265, 1, 0, 0, 1, 1,
0.6139129, 0.9168727, 0.3687184, 1, 0, 0, 1, 1,
0.6178715, -0.1612385, 2.313012, 1, 0, 0, 1, 1,
0.6293689, 0.273877, 1.813161, 1, 0, 0, 1, 1,
0.6342487, -0.1340013, 1.86649, 0, 0, 0, 1, 1,
0.6351388, -0.9547378, 3.134769, 0, 0, 0, 1, 1,
0.637201, 1.216498, 0.6607873, 0, 0, 0, 1, 1,
0.6376191, -0.3855808, -0.770627, 0, 0, 0, 1, 1,
0.6381876, -0.4492495, 0.9277106, 0, 0, 0, 1, 1,
0.6425197, 0.8465795, 0.9889292, 0, 0, 0, 1, 1,
0.643159, -0.4784821, 2.618353, 0, 0, 0, 1, 1,
0.6468239, -0.6486814, 1.35471, 1, 1, 1, 1, 1,
0.652042, -1.967384, 0.7456765, 1, 1, 1, 1, 1,
0.6533435, -0.8717545, 2.126164, 1, 1, 1, 1, 1,
0.6544205, -0.8045888, 3.48735, 1, 1, 1, 1, 1,
0.6567721, -1.079088, 2.590799, 1, 1, 1, 1, 1,
0.6568571, 0.1941149, 0.248219, 1, 1, 1, 1, 1,
0.658281, 2.831174, 0.252453, 1, 1, 1, 1, 1,
0.6702272, -0.9422892, 3.072566, 1, 1, 1, 1, 1,
0.6716344, -0.7952687, 1.634352, 1, 1, 1, 1, 1,
0.6726406, -0.8452342, -0.8912303, 1, 1, 1, 1, 1,
0.6728644, 1.833387, 0.1114948, 1, 1, 1, 1, 1,
0.6754987, 2.230344, 0.7996753, 1, 1, 1, 1, 1,
0.6756428, -0.8327236, 1.368528, 1, 1, 1, 1, 1,
0.6793237, 1.016688, 0.4258417, 1, 1, 1, 1, 1,
0.6821473, 0.4529591, 0.9846015, 1, 1, 1, 1, 1,
0.6925128, -1.573066, 1.607341, 0, 0, 1, 1, 1,
0.694272, 0.01354991, 2.543983, 1, 0, 0, 1, 1,
0.7005694, 0.7043989, 0.3633325, 1, 0, 0, 1, 1,
0.7049813, -0.2078704, 1.749296, 1, 0, 0, 1, 1,
0.7064588, 0.5411054, -1.454152, 1, 0, 0, 1, 1,
0.710348, -0.1664461, 1.9797, 1, 0, 0, 1, 1,
0.7109658, 1.148237, 0.3197739, 0, 0, 0, 1, 1,
0.7226174, 0.8579629, 1.055778, 0, 0, 0, 1, 1,
0.7226597, -1.662122, 2.689797, 0, 0, 0, 1, 1,
0.7288135, -0.1646882, 1.999041, 0, 0, 0, 1, 1,
0.7292625, -1.421714, 2.022172, 0, 0, 0, 1, 1,
0.7302115, -0.539215, 2.365368, 0, 0, 0, 1, 1,
0.7302271, 1.608191, 0.6978201, 0, 0, 0, 1, 1,
0.7314573, -1.069913, 3.170504, 1, 1, 1, 1, 1,
0.7346542, 0.1819796, 1.885788, 1, 1, 1, 1, 1,
0.7384937, -0.4070097, 1.970385, 1, 1, 1, 1, 1,
0.7407875, -0.09142357, 1.321461, 1, 1, 1, 1, 1,
0.741447, -0.2011382, 1.94305, 1, 1, 1, 1, 1,
0.7419236, -1.450342, 2.770823, 1, 1, 1, 1, 1,
0.7428067, -1.268443, 3.464165, 1, 1, 1, 1, 1,
0.7441222, 1.145447, 0.9379137, 1, 1, 1, 1, 1,
0.7474793, 1.189902, 1.437496, 1, 1, 1, 1, 1,
0.7483022, -1.014143, 3.331826, 1, 1, 1, 1, 1,
0.7506686, -1.112324, 1.799005, 1, 1, 1, 1, 1,
0.7575696, 0.2106293, 1.778875, 1, 1, 1, 1, 1,
0.7635642, 1.713688, 1.373097, 1, 1, 1, 1, 1,
0.767708, -1.859713, 2.876324, 1, 1, 1, 1, 1,
0.7734739, 1.925309, 1.054488, 1, 1, 1, 1, 1,
0.7748134, 1.115671, 1.757753, 0, 0, 1, 1, 1,
0.7757654, -1.095955, 2.844289, 1, 0, 0, 1, 1,
0.7802934, -0.5475083, 0.7136651, 1, 0, 0, 1, 1,
0.7803585, 0.0239168, 0.06987739, 1, 0, 0, 1, 1,
0.7823008, -0.6379762, 2.138455, 1, 0, 0, 1, 1,
0.7893796, 0.9168094, 1.141792, 1, 0, 0, 1, 1,
0.7926202, -0.6463975, 1.246804, 0, 0, 0, 1, 1,
0.7958497, -0.4125923, 1.497821, 0, 0, 0, 1, 1,
0.8029835, 1.276302, 0.4188541, 0, 0, 0, 1, 1,
0.8040912, -0.4685424, 1.702577, 0, 0, 0, 1, 1,
0.8061776, -1.394825, 1.116325, 0, 0, 0, 1, 1,
0.8080508, 1.254952, 0.1449688, 0, 0, 0, 1, 1,
0.8096025, -0.379516, 1.756172, 0, 0, 0, 1, 1,
0.8120782, -1.195124, 1.661768, 1, 1, 1, 1, 1,
0.8129553, -0.3957508, 2.731679, 1, 1, 1, 1, 1,
0.8177741, -1.534671, 2.649379, 1, 1, 1, 1, 1,
0.8217055, -0.7330346, 2.583535, 1, 1, 1, 1, 1,
0.8267139, -1.249451, 3.693631, 1, 1, 1, 1, 1,
0.8275844, 0.4863704, 1.836618, 1, 1, 1, 1, 1,
0.8299368, 0.5149805, 3.163181, 1, 1, 1, 1, 1,
0.8364133, 0.4525624, 0.997909, 1, 1, 1, 1, 1,
0.8380182, 0.2379458, 3.231341, 1, 1, 1, 1, 1,
0.8400831, -1.786927, 3.294423, 1, 1, 1, 1, 1,
0.8404948, -1.604036, 3.445075, 1, 1, 1, 1, 1,
0.8496823, 0.09342684, 1.007748, 1, 1, 1, 1, 1,
0.85039, -0.3417231, 2.345657, 1, 1, 1, 1, 1,
0.8510324, -1.040415, 2.048542, 1, 1, 1, 1, 1,
0.8512971, 0.0422408, 2.539968, 1, 1, 1, 1, 1,
0.8569607, 0.1019827, 0.471932, 0, 0, 1, 1, 1,
0.8578872, -2.033985, 3.146833, 1, 0, 0, 1, 1,
0.8583838, -0.6459017, 1.666463, 1, 0, 0, 1, 1,
0.8641473, -0.6464443, 4.014032, 1, 0, 0, 1, 1,
0.8648097, -1.932561, 2.019531, 1, 0, 0, 1, 1,
0.8664506, -0.1962127, 2.797093, 1, 0, 0, 1, 1,
0.8760049, -0.2142858, 1.846721, 0, 0, 0, 1, 1,
0.8801875, -0.7674972, 3.371425, 0, 0, 0, 1, 1,
0.8826783, -0.5600984, 2.245807, 0, 0, 0, 1, 1,
0.8848923, -0.7087615, 2.417104, 0, 0, 0, 1, 1,
0.8849384, 0.8792093, 1.152393, 0, 0, 0, 1, 1,
0.8872377, -1.211548, 2.720297, 0, 0, 0, 1, 1,
0.8969331, -0.002383274, 1.420644, 0, 0, 0, 1, 1,
0.9040583, -1.346471, 2.407376, 1, 1, 1, 1, 1,
0.907056, -0.04497817, 2.293291, 1, 1, 1, 1, 1,
0.9112305, -1.278371, 2.430954, 1, 1, 1, 1, 1,
0.9113128, -0.8140934, 3.313558, 1, 1, 1, 1, 1,
0.9143364, 0.6428112, 1.662322, 1, 1, 1, 1, 1,
0.918118, -1.127562, 1.346764, 1, 1, 1, 1, 1,
0.9181902, 1.341578, 0.2339191, 1, 1, 1, 1, 1,
0.9189181, -1.473829, 2.913312, 1, 1, 1, 1, 1,
0.9209483, -0.02073166, 1.423596, 1, 1, 1, 1, 1,
0.9243019, 0.6462612, 1.068669, 1, 1, 1, 1, 1,
0.927084, 0.1687802, 1.638106, 1, 1, 1, 1, 1,
0.9285384, -1.459485, 3.292918, 1, 1, 1, 1, 1,
0.9323643, -0.3085495, 2.862748, 1, 1, 1, 1, 1,
0.9343837, -0.6212232, 2.883007, 1, 1, 1, 1, 1,
0.9402496, -0.3847684, 2.139055, 1, 1, 1, 1, 1,
0.9406406, -0.644446, 2.457155, 0, 0, 1, 1, 1,
0.9409457, 0.6127315, 0.6682653, 1, 0, 0, 1, 1,
0.9410117, -1.687962, 1.159317, 1, 0, 0, 1, 1,
0.9426565, 0.7528712, 1.162361, 1, 0, 0, 1, 1,
0.9432932, -0.02005986, 1.876227, 1, 0, 0, 1, 1,
0.9440546, 2.044185, -0.7013794, 1, 0, 0, 1, 1,
0.9443662, -0.05643237, 2.004894, 0, 0, 0, 1, 1,
0.945205, 1.933054, -0.4980115, 0, 0, 0, 1, 1,
0.9496053, 0.125962, 0.7972378, 0, 0, 0, 1, 1,
0.955705, -0.3294306, 1.866535, 0, 0, 0, 1, 1,
0.9589047, -1.247014, 2.146969, 0, 0, 0, 1, 1,
0.9593995, 0.6593332, 0.8507391, 0, 0, 0, 1, 1,
0.9597206, 1.729412, 0.9491656, 0, 0, 0, 1, 1,
0.9640456, -0.8902555, 2.032902, 1, 1, 1, 1, 1,
0.9647113, 0.6189088, 1.811775, 1, 1, 1, 1, 1,
0.9682584, 2.278477, 0.1121076, 1, 1, 1, 1, 1,
0.9688945, 0.1918546, 0.9745987, 1, 1, 1, 1, 1,
0.97156, 0.6221524, 1.931813, 1, 1, 1, 1, 1,
0.977774, -1.173753, 2.440066, 1, 1, 1, 1, 1,
0.9852497, 0.213043, 0.8449387, 1, 1, 1, 1, 1,
0.9889171, -0.1902647, 1.528155, 1, 1, 1, 1, 1,
0.9898856, -0.6928388, 3.024289, 1, 1, 1, 1, 1,
0.9974227, 1.523398, -0.624886, 1, 1, 1, 1, 1,
1.009372, 0.4682156, -0.4282237, 1, 1, 1, 1, 1,
1.01039, 2.001411, 1.182812, 1, 1, 1, 1, 1,
1.014051, -0.06687886, 0.4122002, 1, 1, 1, 1, 1,
1.014133, 0.5931512, 0.1451501, 1, 1, 1, 1, 1,
1.023368, -1.497401, 3.736224, 1, 1, 1, 1, 1,
1.025423, -0.1827084, 1.648149, 0, 0, 1, 1, 1,
1.028234, -0.5694851, -0.08916985, 1, 0, 0, 1, 1,
1.028305, 0.1199646, -0.8695717, 1, 0, 0, 1, 1,
1.030867, 0.651002, 0.1145315, 1, 0, 0, 1, 1,
1.037384, 2.271995, -0.9673457, 1, 0, 0, 1, 1,
1.043203, 0.3288401, 1.023317, 1, 0, 0, 1, 1,
1.044698, 0.5204118, 1.674953, 0, 0, 0, 1, 1,
1.051212, 0.7825605, 0.4378617, 0, 0, 0, 1, 1,
1.055229, -0.0118913, 2.381575, 0, 0, 0, 1, 1,
1.057456, -0.4155712, 1.506967, 0, 0, 0, 1, 1,
1.059876, 0.8290361, 0.06198144, 0, 0, 0, 1, 1,
1.064484, -0.1912436, 0.3810871, 0, 0, 0, 1, 1,
1.065423, -0.1113223, 2.657679, 0, 0, 0, 1, 1,
1.067764, -1.489607, 2.554165, 1, 1, 1, 1, 1,
1.068276, -0.05076246, 1.552965, 1, 1, 1, 1, 1,
1.072791, -2.384413, 2.654025, 1, 1, 1, 1, 1,
1.079603, -0.4535554, 0.3281768, 1, 1, 1, 1, 1,
1.080951, -0.2351199, 2.122041, 1, 1, 1, 1, 1,
1.091725, -0.7237885, 0.5295284, 1, 1, 1, 1, 1,
1.092145, 0.06841646, 1.452412, 1, 1, 1, 1, 1,
1.092749, 0.5368432, 0.5480157, 1, 1, 1, 1, 1,
1.103056, 0.922346, -0.2006227, 1, 1, 1, 1, 1,
1.108598, 0.7183, -0.2472895, 1, 1, 1, 1, 1,
1.113551, 1.053007, 3.443242, 1, 1, 1, 1, 1,
1.119739, 0.5345376, 2.391591, 1, 1, 1, 1, 1,
1.11995, 2.443609, -0.2792492, 1, 1, 1, 1, 1,
1.125843, 0.2754357, 3.063768, 1, 1, 1, 1, 1,
1.129311, -0.2937498, 2.540022, 1, 1, 1, 1, 1,
1.132465, -0.6405755, -0.2302196, 0, 0, 1, 1, 1,
1.133259, 0.5189764, 1.25363, 1, 0, 0, 1, 1,
1.146774, -1.000346, 3.445251, 1, 0, 0, 1, 1,
1.150739, -1.100837, 2.501697, 1, 0, 0, 1, 1,
1.152132, 0.9065138, 1.049028, 1, 0, 0, 1, 1,
1.152852, 0.06579915, 1.021185, 1, 0, 0, 1, 1,
1.162129, 0.4780522, -0.1209979, 0, 0, 0, 1, 1,
1.162775, -0.7702805, 3.182551, 0, 0, 0, 1, 1,
1.170931, 0.1992166, 0.3417976, 0, 0, 0, 1, 1,
1.17564, 0.5372863, -1.801713, 0, 0, 0, 1, 1,
1.177691, -0.768957, 1.593667, 0, 0, 0, 1, 1,
1.178293, 0.6163368, 0.2706122, 0, 0, 0, 1, 1,
1.184686, 1.62917, 1.511878, 0, 0, 0, 1, 1,
1.18977, 0.01387868, 2.638299, 1, 1, 1, 1, 1,
1.198691, -1.822516, 3.350589, 1, 1, 1, 1, 1,
1.202564, 1.564425, 0.3407731, 1, 1, 1, 1, 1,
1.20287, 0.2299205, 1.870265, 1, 1, 1, 1, 1,
1.206142, -1.034921, 0.9913704, 1, 1, 1, 1, 1,
1.209879, 1.096203, 1.570337, 1, 1, 1, 1, 1,
1.218463, -0.2145067, 2.679698, 1, 1, 1, 1, 1,
1.230839, 0.9869101, -0.04804718, 1, 1, 1, 1, 1,
1.252527, -0.4267088, 2.921197, 1, 1, 1, 1, 1,
1.255657, 1.799583, 0.3017107, 1, 1, 1, 1, 1,
1.257795, -0.6907479, 2.011614, 1, 1, 1, 1, 1,
1.259004, -1.454123, 2.113966, 1, 1, 1, 1, 1,
1.264434, 2.153195, 0.1927474, 1, 1, 1, 1, 1,
1.270984, 1.337576, 1.339117, 1, 1, 1, 1, 1,
1.284112, 1.072006, 0.6785537, 1, 1, 1, 1, 1,
1.28485, -0.250435, 1.719262, 0, 0, 1, 1, 1,
1.286558, -0.3718738, 0.5465823, 1, 0, 0, 1, 1,
1.295447, -1.461621, 1.72889, 1, 0, 0, 1, 1,
1.305147, 0.4694558, 1.478515, 1, 0, 0, 1, 1,
1.310143, 1.56687, 0.7753629, 1, 0, 0, 1, 1,
1.31142, -0.5406403, 1.041417, 1, 0, 0, 1, 1,
1.320094, 0.188961, 1.490705, 0, 0, 0, 1, 1,
1.322885, 0.09737065, 1.761673, 0, 0, 0, 1, 1,
1.326228, 1.436831, 0.2990617, 0, 0, 0, 1, 1,
1.337995, -0.3261621, 1.470937, 0, 0, 0, 1, 1,
1.345765, 1.2972, -0.2676432, 0, 0, 0, 1, 1,
1.349035, 0.4887247, 0.4997765, 0, 0, 0, 1, 1,
1.376344, -0.09693611, 0.5505731, 0, 0, 0, 1, 1,
1.382251, 0.9587555, 0.4238624, 1, 1, 1, 1, 1,
1.391489, -0.4475482, 1.41395, 1, 1, 1, 1, 1,
1.402052, 1.418656, -0.2392141, 1, 1, 1, 1, 1,
1.404245, 1.951021, 1.426883, 1, 1, 1, 1, 1,
1.406546, -0.7001055, 2.952325, 1, 1, 1, 1, 1,
1.410179, -0.5713693, 3.197696, 1, 1, 1, 1, 1,
1.410272, 0.2961742, 1.266606, 1, 1, 1, 1, 1,
1.416264, -0.1834513, 0.5788698, 1, 1, 1, 1, 1,
1.428388, 0.1375637, 3.208953, 1, 1, 1, 1, 1,
1.428599, 2.125893, 2.409098, 1, 1, 1, 1, 1,
1.435527, 0.3492115, 0.9051986, 1, 1, 1, 1, 1,
1.446912, 0.3175524, 1.480135, 1, 1, 1, 1, 1,
1.449556, -0.542699, 2.520742, 1, 1, 1, 1, 1,
1.460081, 0.7716101, 0.7970724, 1, 1, 1, 1, 1,
1.462005, -0.2173598, 1.261871, 1, 1, 1, 1, 1,
1.463848, -1.758564, 1.220519, 0, 0, 1, 1, 1,
1.471274, -0.6701621, 1.703513, 1, 0, 0, 1, 1,
1.472431, 0.7349288, 1.68064, 1, 0, 0, 1, 1,
1.472656, 1.424159, 1.401804, 1, 0, 0, 1, 1,
1.473572, 1.467183, -0.9739047, 1, 0, 0, 1, 1,
1.476896, -1.056005, 2.48383, 1, 0, 0, 1, 1,
1.477058, 1.311733, -0.6587286, 0, 0, 0, 1, 1,
1.48436, -0.1158103, 2.053689, 0, 0, 0, 1, 1,
1.486645, -1.008184, -0.1686638, 0, 0, 0, 1, 1,
1.504292, -0.02265207, 0.8097007, 0, 0, 0, 1, 1,
1.504984, -0.1399092, 3.029078, 0, 0, 0, 1, 1,
1.509534, -0.2556739, 0.9812728, 0, 0, 0, 1, 1,
1.514057, 0.7496729, 1.138149, 0, 0, 0, 1, 1,
1.532516, 0.5285187, 0.0363162, 1, 1, 1, 1, 1,
1.535879, -1.601382, 3.39701, 1, 1, 1, 1, 1,
1.561761, 1.296649, 2.262013, 1, 1, 1, 1, 1,
1.571157, 0.6058767, 0.7295659, 1, 1, 1, 1, 1,
1.587492, -0.6340169, 3.745655, 1, 1, 1, 1, 1,
1.610205, -0.228852, 2.171924, 1, 1, 1, 1, 1,
1.628312, 0.3066102, 0.5520515, 1, 1, 1, 1, 1,
1.637765, -0.550688, 1.618021, 1, 1, 1, 1, 1,
1.645386, 0.9343095, 1.590349, 1, 1, 1, 1, 1,
1.647691, -0.1232095, 2.764106, 1, 1, 1, 1, 1,
1.650375, -1.917525, 2.198193, 1, 1, 1, 1, 1,
1.651528, 0.7017627, 2.420899, 1, 1, 1, 1, 1,
1.662958, 0.9097371, 1.025598, 1, 1, 1, 1, 1,
1.666271, -0.1252648, 1.413408, 1, 1, 1, 1, 1,
1.67375, -0.9891767, 2.513154, 1, 1, 1, 1, 1,
1.69717, -0.1416031, 0.7430712, 0, 0, 1, 1, 1,
1.703174, -1.934573, 1.110531, 1, 0, 0, 1, 1,
1.705102, 0.9879861, 0.6617634, 1, 0, 0, 1, 1,
1.707554, -1.072156, 1.70195, 1, 0, 0, 1, 1,
1.723, -0.5363274, 3.717151, 1, 0, 0, 1, 1,
1.724148, 0.6089576, 1.489832, 1, 0, 0, 1, 1,
1.743361, -0.1673277, 2.656393, 0, 0, 0, 1, 1,
1.761894, 0.1713035, 1.813254, 0, 0, 0, 1, 1,
1.763106, 1.268691, 1.720251, 0, 0, 0, 1, 1,
1.777388, -0.4773395, 2.258217, 0, 0, 0, 1, 1,
1.781819, -2.028593, 1.378865, 0, 0, 0, 1, 1,
1.782417, -0.9787095, 2.769439, 0, 0, 0, 1, 1,
1.786153, 0.2342647, 1.189795, 0, 0, 0, 1, 1,
1.795662, -0.4542446, 0.9978197, 1, 1, 1, 1, 1,
1.820689, 1.238666, -0.5892299, 1, 1, 1, 1, 1,
1.836689, -0.9376174, 3.286111, 1, 1, 1, 1, 1,
1.861858, -1.013936, 1.834022, 1, 1, 1, 1, 1,
1.878106, -0.4605052, 0.8576446, 1, 1, 1, 1, 1,
1.885701, 0.4372495, 0.777784, 1, 1, 1, 1, 1,
1.903375, -0.8216358, 3.031663, 1, 1, 1, 1, 1,
1.926395, -1.074376, 3.178637, 1, 1, 1, 1, 1,
1.944662, 1.118706, -1.533264, 1, 1, 1, 1, 1,
1.968656, -1.123317, 2.582919, 1, 1, 1, 1, 1,
1.993364, 1.952684, -0.1807351, 1, 1, 1, 1, 1,
2.002274, 0.8056072, 1.819366, 1, 1, 1, 1, 1,
2.005699, 0.1673729, 1.776665, 1, 1, 1, 1, 1,
2.018816, -2.069054, 2.384758, 1, 1, 1, 1, 1,
2.026571, -0.6988649, 1.572405, 1, 1, 1, 1, 1,
2.07913, 0.9924309, 3.520354, 0, 0, 1, 1, 1,
2.097869, -1.298679, 0.7843835, 1, 0, 0, 1, 1,
2.107272, -0.07242458, 0.7178766, 1, 0, 0, 1, 1,
2.155627, -0.1796729, 2.490979, 1, 0, 0, 1, 1,
2.181219, 0.4300543, 3.013821, 1, 0, 0, 1, 1,
2.202334, -0.4246491, 2.55617, 1, 0, 0, 1, 1,
2.231312, 0.7256824, 1.600434, 0, 0, 0, 1, 1,
2.38957, -0.7642266, 2.623715, 0, 0, 0, 1, 1,
2.427277, 0.5463874, 0.7216488, 0, 0, 0, 1, 1,
2.44522, -0.9553591, 0.9727971, 0, 0, 0, 1, 1,
2.565866, -0.1586804, 1.316893, 0, 0, 0, 1, 1,
2.602693, -1.274546, 1.90072, 0, 0, 0, 1, 1,
2.695112, -0.7799803, 2.488203, 0, 0, 0, 1, 1,
2.734357, -0.2383071, 1.746903, 1, 1, 1, 1, 1,
2.74983, 1.534977, 1.263715, 1, 1, 1, 1, 1,
2.89336, 1.520064, -0.5289783, 1, 1, 1, 1, 1,
2.94789, 0.5158116, 1.243158, 1, 1, 1, 1, 1,
2.960871, -0.2727084, 2.583194, 1, 1, 1, 1, 1,
2.983772, 0.782016, 1.212396, 1, 1, 1, 1, 1,
3.253046, 1.268951, 1.858729, 1, 1, 1, 1, 1
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
var radius = 9.684644;
var distance = 34.0169;
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
mvMatrix.translate( 0.2307861, 0.158567, 0.08027077 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.0169);
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
