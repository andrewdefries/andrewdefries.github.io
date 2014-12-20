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
-3.333578, -0.6208473, -3.240711, 1, 0, 0, 1,
-2.911061, 2.160148, -0.4767186, 1, 0.007843138, 0, 1,
-2.821803, -0.9449198, -0.241621, 1, 0.01176471, 0, 1,
-2.529492, 0.5202048, -0.8281559, 1, 0.01960784, 0, 1,
-2.409497, -1.914119, -3.869056, 1, 0.02352941, 0, 1,
-2.37504, 0.7875115, -0.839385, 1, 0.03137255, 0, 1,
-2.354751, 0.6798161, -0.4446958, 1, 0.03529412, 0, 1,
-2.263242, 0.9409196, -0.8367455, 1, 0.04313726, 0, 1,
-2.243967, 1.382353, -1.408944, 1, 0.04705882, 0, 1,
-2.153967, 0.7402002, -0.5797911, 1, 0.05490196, 0, 1,
-2.152577, 0.06081181, 2.197439, 1, 0.05882353, 0, 1,
-2.151859, 0.558619, -1.312415, 1, 0.06666667, 0, 1,
-2.128375, -0.5816898, -0.9877129, 1, 0.07058824, 0, 1,
-2.106898, 1.424688, -1.671073, 1, 0.07843138, 0, 1,
-2.039171, -1.317089, -2.281066, 1, 0.08235294, 0, 1,
-2.012061, -0.2989543, -0.7772844, 1, 0.09019608, 0, 1,
-1.996415, -0.3610041, -1.798361, 1, 0.09411765, 0, 1,
-1.975066, -0.6169662, -2.285163, 1, 0.1019608, 0, 1,
-1.964243, 0.4455714, -1.641824, 1, 0.1098039, 0, 1,
-1.941159, 0.9068503, -0.8088123, 1, 0.1137255, 0, 1,
-1.931365, 0.6262031, -1.207798, 1, 0.1215686, 0, 1,
-1.877205, 0.2316839, -2.975547, 1, 0.1254902, 0, 1,
-1.844524, -0.06350186, -2.614327, 1, 0.1333333, 0, 1,
-1.802313, 0.01746211, -2.333346, 1, 0.1372549, 0, 1,
-1.788036, 0.3392656, -1.280851, 1, 0.145098, 0, 1,
-1.757206, 0.1866345, -1.635494, 1, 0.1490196, 0, 1,
-1.752574, 0.5007901, -1.971217, 1, 0.1568628, 0, 1,
-1.730799, 0.9829168, -1.545506, 1, 0.1607843, 0, 1,
-1.730389, -0.4768216, -2.955076, 1, 0.1686275, 0, 1,
-1.714145, 0.9665586, -1.132153, 1, 0.172549, 0, 1,
-1.709216, -0.5105819, -2.23908, 1, 0.1803922, 0, 1,
-1.700316, -1.840438, -4.796508, 1, 0.1843137, 0, 1,
-1.695419, -1.739896, -1.654671, 1, 0.1921569, 0, 1,
-1.693359, 1.791606, -0.1878773, 1, 0.1960784, 0, 1,
-1.685521, 0.2985708, -2.589057, 1, 0.2039216, 0, 1,
-1.655087, -0.8156521, -1.871686, 1, 0.2117647, 0, 1,
-1.637368, 0.908223, -0.6421362, 1, 0.2156863, 0, 1,
-1.627123, 1.382846, -2.552253, 1, 0.2235294, 0, 1,
-1.584613, 0.6640574, -1.131216, 1, 0.227451, 0, 1,
-1.584137, -0.1408236, -0.8989497, 1, 0.2352941, 0, 1,
-1.570624, -0.5357763, -2.326344, 1, 0.2392157, 0, 1,
-1.569021, -1.300316, -3.102458, 1, 0.2470588, 0, 1,
-1.564135, -0.04768435, -1.494555, 1, 0.2509804, 0, 1,
-1.563035, 0.5736722, -1.299778, 1, 0.2588235, 0, 1,
-1.561664, -1.200354, -2.792182, 1, 0.2627451, 0, 1,
-1.560374, 0.5972071, -1.399524, 1, 0.2705882, 0, 1,
-1.549124, -1.889071, -2.086508, 1, 0.2745098, 0, 1,
-1.54452, -1.119215, -2.180146, 1, 0.282353, 0, 1,
-1.536109, -1.581377, -2.271653, 1, 0.2862745, 0, 1,
-1.526442, 1.054987, 0.1869133, 1, 0.2941177, 0, 1,
-1.517911, -0.6811014, -3.058332, 1, 0.3019608, 0, 1,
-1.513677, -1.002355, -3.225731, 1, 0.3058824, 0, 1,
-1.507318, 0.1647267, -2.995477, 1, 0.3137255, 0, 1,
-1.503137, -0.5343612, -1.174461, 1, 0.3176471, 0, 1,
-1.496447, -0.7429129, -1.400426, 1, 0.3254902, 0, 1,
-1.493149, -1.214619, -2.909642, 1, 0.3294118, 0, 1,
-1.490463, 0.1388355, -0.7164709, 1, 0.3372549, 0, 1,
-1.479237, 2.375448, -0.8600187, 1, 0.3411765, 0, 1,
-1.478119, 0.1504548, -2.857464, 1, 0.3490196, 0, 1,
-1.476994, -0.4719809, -0.7662587, 1, 0.3529412, 0, 1,
-1.463675, -0.005721715, -1.473718, 1, 0.3607843, 0, 1,
-1.459947, 0.2902368, -0.9469481, 1, 0.3647059, 0, 1,
-1.458324, 1.905226, 0.580767, 1, 0.372549, 0, 1,
-1.452348, -0.409334, -1.898212, 1, 0.3764706, 0, 1,
-1.450503, -1.683222, -1.910295, 1, 0.3843137, 0, 1,
-1.449523, -0.5050777, -4.012552, 1, 0.3882353, 0, 1,
-1.437739, 1.263596, -1.439228, 1, 0.3960784, 0, 1,
-1.428709, 0.2037247, -1.130907, 1, 0.4039216, 0, 1,
-1.427004, -0.5115028, -2.97162, 1, 0.4078431, 0, 1,
-1.419028, -0.04084626, -1.391868, 1, 0.4156863, 0, 1,
-1.417925, -0.7000144, -3.670548, 1, 0.4196078, 0, 1,
-1.416312, 0.002809518, -0.4556974, 1, 0.427451, 0, 1,
-1.414228, -0.9956731, -2.941041, 1, 0.4313726, 0, 1,
-1.412083, 0.8396645, -1.780756, 1, 0.4392157, 0, 1,
-1.38162, 0.9577974, -2.076171, 1, 0.4431373, 0, 1,
-1.37855, -1.85213, -2.557185, 1, 0.4509804, 0, 1,
-1.376433, 1.011938, -1.138662, 1, 0.454902, 0, 1,
-1.362539, -0.135568, -1.173982, 1, 0.4627451, 0, 1,
-1.347711, 0.260717, -0.5218773, 1, 0.4666667, 0, 1,
-1.342363, -0.7813528, -1.496059, 1, 0.4745098, 0, 1,
-1.339989, -1.614884, -2.360948, 1, 0.4784314, 0, 1,
-1.335534, -0.4183477, 0.005015338, 1, 0.4862745, 0, 1,
-1.335001, 1.350208, -1.22813, 1, 0.4901961, 0, 1,
-1.329169, 0.120687, -0.6311681, 1, 0.4980392, 0, 1,
-1.325453, -0.3892878, -1.972225, 1, 0.5058824, 0, 1,
-1.324554, -0.01470056, -2.147763, 1, 0.509804, 0, 1,
-1.320691, 1.047401, 0.7276077, 1, 0.5176471, 0, 1,
-1.318806, 0.8768566, -1.164434, 1, 0.5215687, 0, 1,
-1.310042, -0.7775705, -4.099209, 1, 0.5294118, 0, 1,
-1.303438, -1.526278, -1.522728, 1, 0.5333334, 0, 1,
-1.300805, 0.170938, -1.117493, 1, 0.5411765, 0, 1,
-1.292196, -0.2621098, -1.692495, 1, 0.5450981, 0, 1,
-1.290238, 0.8798775, -0.4534842, 1, 0.5529412, 0, 1,
-1.281215, 0.4115481, 0.8261707, 1, 0.5568628, 0, 1,
-1.278231, 0.3056403, -0.8803406, 1, 0.5647059, 0, 1,
-1.274745, -0.8276459, -3.292404, 1, 0.5686275, 0, 1,
-1.273184, -0.7925131, -1.276804, 1, 0.5764706, 0, 1,
-1.265956, -0.3920338, -1.523328, 1, 0.5803922, 0, 1,
-1.264421, 0.1238773, -2.920688, 1, 0.5882353, 0, 1,
-1.249947, 0.5422089, -0.8868723, 1, 0.5921569, 0, 1,
-1.248773, -0.5573898, -1.769891, 1, 0.6, 0, 1,
-1.233811, -0.7637236, -0.2002664, 1, 0.6078432, 0, 1,
-1.232848, -0.530204, -2.511112, 1, 0.6117647, 0, 1,
-1.231484, -0.4249496, -1.923022, 1, 0.6196079, 0, 1,
-1.230531, 0.3045747, -1.914672, 1, 0.6235294, 0, 1,
-1.229815, -2.074989, -2.542897, 1, 0.6313726, 0, 1,
-1.228689, 0.3930271, -2.423782, 1, 0.6352941, 0, 1,
-1.226198, -0.1530377, -2.444755, 1, 0.6431373, 0, 1,
-1.225528, 1.121375, -0.6201066, 1, 0.6470588, 0, 1,
-1.222231, 1.292067, 1.276393, 1, 0.654902, 0, 1,
-1.220445, 0.3023854, 0.4237887, 1, 0.6588235, 0, 1,
-1.218929, 0.1034191, -0.7714817, 1, 0.6666667, 0, 1,
-1.214572, -0.1572967, -2.017997, 1, 0.6705883, 0, 1,
-1.203494, -0.8978803, -3.590214, 1, 0.6784314, 0, 1,
-1.203355, -0.5748125, -2.763675, 1, 0.682353, 0, 1,
-1.202161, -0.2345063, -3.771852, 1, 0.6901961, 0, 1,
-1.198753, 1.528241, -0.6075598, 1, 0.6941177, 0, 1,
-1.197449, -0.2372354, -1.947298, 1, 0.7019608, 0, 1,
-1.190637, 0.7093573, -2.989701, 1, 0.7098039, 0, 1,
-1.186717, 1.814162, 1.395693, 1, 0.7137255, 0, 1,
-1.173495, -2.009472, -3.66122, 1, 0.7215686, 0, 1,
-1.168139, -0.8901023, -0.4047403, 1, 0.7254902, 0, 1,
-1.165581, -0.4559938, -2.852609, 1, 0.7333333, 0, 1,
-1.165318, -0.6587175, -1.157691, 1, 0.7372549, 0, 1,
-1.164942, 1.310659, -0.09104288, 1, 0.7450981, 0, 1,
-1.163301, 0.09934389, -1.334078, 1, 0.7490196, 0, 1,
-1.162809, 0.1495184, -0.8313106, 1, 0.7568628, 0, 1,
-1.152858, -0.7238069, -1.229752, 1, 0.7607843, 0, 1,
-1.140443, -0.1181864, -0.2401953, 1, 0.7686275, 0, 1,
-1.139586, 0.4192534, -1.633743, 1, 0.772549, 0, 1,
-1.139134, -0.3898706, -1.214153, 1, 0.7803922, 0, 1,
-1.138707, 0.1692898, -1.120197, 1, 0.7843137, 0, 1,
-1.123461, 0.4291527, -1.590139, 1, 0.7921569, 0, 1,
-1.120666, -0.5587649, -1.955537, 1, 0.7960784, 0, 1,
-1.108573, -1.137685, -2.791041, 1, 0.8039216, 0, 1,
-1.094481, -0.3384323, -2.20882, 1, 0.8117647, 0, 1,
-1.093652, 1.424069, -0.5536965, 1, 0.8156863, 0, 1,
-1.089809, -0.5862564, -2.284949, 1, 0.8235294, 0, 1,
-1.089078, 0.6173505, -0.9437849, 1, 0.827451, 0, 1,
-1.084737, 2.440727, -1.378154, 1, 0.8352941, 0, 1,
-1.077625, 1.056854, 0.0331304, 1, 0.8392157, 0, 1,
-1.067935, -0.5792273, -2.392788, 1, 0.8470588, 0, 1,
-1.062026, -1.329146, -1.54496, 1, 0.8509804, 0, 1,
-1.051003, -0.2676032, -2.317459, 1, 0.8588235, 0, 1,
-1.049252, -0.6519697, -0.6189362, 1, 0.8627451, 0, 1,
-1.039682, -1.905711, -4.679794, 1, 0.8705882, 0, 1,
-1.031129, 0.6426664, -3.018045, 1, 0.8745098, 0, 1,
-1.028095, 0.3820924, 0.2691616, 1, 0.8823529, 0, 1,
-1.023708, -1.096927, -3.172312, 1, 0.8862745, 0, 1,
-1.020252, -0.7760434, -3.275478, 1, 0.8941177, 0, 1,
-1.015594, 0.4721872, -1.095319, 1, 0.8980392, 0, 1,
-1.00702, 0.6279227, -1.661092, 1, 0.9058824, 0, 1,
-1.006499, -0.6024522, -2.946643, 1, 0.9137255, 0, 1,
-1.006289, -0.286579, -1.622294, 1, 0.9176471, 0, 1,
-1.005864, 1.032792, -0.7367723, 1, 0.9254902, 0, 1,
-1.00035, -1.065323, -1.242787, 1, 0.9294118, 0, 1,
-0.9964221, -0.8364623, -2.834295, 1, 0.9372549, 0, 1,
-0.9948982, 0.02472956, -1.281248, 1, 0.9411765, 0, 1,
-0.991762, -1.155462, -1.426643, 1, 0.9490196, 0, 1,
-0.9898394, 0.9536035, -0.6865878, 1, 0.9529412, 0, 1,
-0.982586, -0.5575196, -1.665367, 1, 0.9607843, 0, 1,
-0.9791538, 2.495655, -1.42472, 1, 0.9647059, 0, 1,
-0.9744014, -0.5591887, -0.9995282, 1, 0.972549, 0, 1,
-0.973861, 0.4323309, -1.678423, 1, 0.9764706, 0, 1,
-0.9714393, -2.394746, -1.388423, 1, 0.9843137, 0, 1,
-0.9655718, -0.9330812, -4.33248, 1, 0.9882353, 0, 1,
-0.9646575, -0.7560862, -1.169082, 1, 0.9960784, 0, 1,
-0.9639399, 0.6487493, -1.748014, 0.9960784, 1, 0, 1,
-0.9574512, 0.8175412, -0.2170223, 0.9921569, 1, 0, 1,
-0.9516246, -0.8362311, 0.4006332, 0.9843137, 1, 0, 1,
-0.9475614, 1.87684, -2.467543, 0.9803922, 1, 0, 1,
-0.9444034, 0.1246325, -0.3892845, 0.972549, 1, 0, 1,
-0.9440274, -0.7945598, -1.532849, 0.9686275, 1, 0, 1,
-0.9332575, 0.731231, -1.632174, 0.9607843, 1, 0, 1,
-0.9286236, 2.061662, -0.7483841, 0.9568627, 1, 0, 1,
-0.9230658, 0.1533044, -0.1154396, 0.9490196, 1, 0, 1,
-0.9223436, 1.532414, -2.377041, 0.945098, 1, 0, 1,
-0.9207408, -0.4781459, -4.213915, 0.9372549, 1, 0, 1,
-0.9150555, -0.8348233, -3.043326, 0.9333333, 1, 0, 1,
-0.9103475, 0.9534944, 1.624101, 0.9254902, 1, 0, 1,
-0.9034212, -1.469021, -3.889482, 0.9215686, 1, 0, 1,
-0.8980752, -0.6682047, -2.863695, 0.9137255, 1, 0, 1,
-0.896866, 1.013999, 1.261106, 0.9098039, 1, 0, 1,
-0.89277, 0.6484649, -1.118329, 0.9019608, 1, 0, 1,
-0.8926429, -0.1915499, -1.77934, 0.8941177, 1, 0, 1,
-0.8914884, -0.8767315, -3.863183, 0.8901961, 1, 0, 1,
-0.8839006, -0.5473763, -1.553773, 0.8823529, 1, 0, 1,
-0.8802959, 0.8680466, 0.2091283, 0.8784314, 1, 0, 1,
-0.8698708, -0.8688056, -1.810995, 0.8705882, 1, 0, 1,
-0.8666372, -0.4235184, -1.325807, 0.8666667, 1, 0, 1,
-0.8599055, -2.170408, -2.515128, 0.8588235, 1, 0, 1,
-0.8575836, 0.3630979, -0.5823922, 0.854902, 1, 0, 1,
-0.8569252, 0.1939957, -0.3716981, 0.8470588, 1, 0, 1,
-0.8546352, 0.9553109, -4.289495, 0.8431373, 1, 0, 1,
-0.8540983, 0.1486003, -0.6039371, 0.8352941, 1, 0, 1,
-0.8522795, 2.102702, 0.131077, 0.8313726, 1, 0, 1,
-0.8485573, 1.119113, -0.4365807, 0.8235294, 1, 0, 1,
-0.847789, 1.088438, -1.819683, 0.8196079, 1, 0, 1,
-0.8474885, -0.6274925, -3.331867, 0.8117647, 1, 0, 1,
-0.8442339, -0.8365368, -1.995723, 0.8078431, 1, 0, 1,
-0.8431258, -1.121488, -2.0775, 0.8, 1, 0, 1,
-0.8423266, 1.869682, -1.276875, 0.7921569, 1, 0, 1,
-0.840095, 0.3929765, -1.544767, 0.7882353, 1, 0, 1,
-0.8394825, -0.2693592, 0.2248986, 0.7803922, 1, 0, 1,
-0.8368602, -0.9317774, -2.064058, 0.7764706, 1, 0, 1,
-0.8331215, 0.4782429, -1.755321, 0.7686275, 1, 0, 1,
-0.8281187, -0.7937296, -4.572019, 0.7647059, 1, 0, 1,
-0.8268439, -0.4241971, -2.34211, 0.7568628, 1, 0, 1,
-0.8218806, 0.6256152, -0.4597305, 0.7529412, 1, 0, 1,
-0.8177791, 1.043404, -2.070956, 0.7450981, 1, 0, 1,
-0.8162808, -0.482952, -2.40062, 0.7411765, 1, 0, 1,
-0.8110546, 0.9474367, 0.6151534, 0.7333333, 1, 0, 1,
-0.8093354, 0.9137381, -0.3747815, 0.7294118, 1, 0, 1,
-0.8061004, 0.4615, -0.004273221, 0.7215686, 1, 0, 1,
-0.8059302, 0.02506679, -2.654014, 0.7176471, 1, 0, 1,
-0.8023339, -1.004984, -1.490568, 0.7098039, 1, 0, 1,
-0.7982892, -0.5853312, -2.759615, 0.7058824, 1, 0, 1,
-0.7979384, -0.0857041, -1.511722, 0.6980392, 1, 0, 1,
-0.7941961, 0.6498855, -0.9824036, 0.6901961, 1, 0, 1,
-0.7918013, 0.7236845, -1.451392, 0.6862745, 1, 0, 1,
-0.7828415, -0.8990788, -1.155796, 0.6784314, 1, 0, 1,
-0.7811878, -0.04672543, -2.407982, 0.6745098, 1, 0, 1,
-0.7798911, -1.009687, -2.167451, 0.6666667, 1, 0, 1,
-0.7765434, 2.200304, -0.420413, 0.6627451, 1, 0, 1,
-0.774017, 0.5677185, -2.11952, 0.654902, 1, 0, 1,
-0.7702087, -0.7958639, -1.717732, 0.6509804, 1, 0, 1,
-0.7695073, 0.1714996, -1.235465, 0.6431373, 1, 0, 1,
-0.7644391, 0.05572103, -0.008706034, 0.6392157, 1, 0, 1,
-0.7581408, 0.6344901, -0.3684009, 0.6313726, 1, 0, 1,
-0.7576311, -0.5762829, 0.1213658, 0.627451, 1, 0, 1,
-0.7572412, 0.6485959, -0.2683787, 0.6196079, 1, 0, 1,
-0.756367, 0.4098113, 0.4536109, 0.6156863, 1, 0, 1,
-0.7547436, 0.3955906, -1.011315, 0.6078432, 1, 0, 1,
-0.7521359, -0.01829946, 0.9447436, 0.6039216, 1, 0, 1,
-0.7515789, -1.135437, -2.509718, 0.5960785, 1, 0, 1,
-0.7508795, 0.8101588, -0.346672, 0.5882353, 1, 0, 1,
-0.7365717, -0.5701909, -3.449738, 0.5843138, 1, 0, 1,
-0.731721, 0.1227463, 0.08506832, 0.5764706, 1, 0, 1,
-0.7291465, 0.1337286, 0.08235775, 0.572549, 1, 0, 1,
-0.7227816, 1.186095, -2.162874, 0.5647059, 1, 0, 1,
-0.7218253, -0.4919866, -1.310524, 0.5607843, 1, 0, 1,
-0.7134726, 1.641776, -0.2469725, 0.5529412, 1, 0, 1,
-0.7059943, 0.5827256, -3.870299, 0.5490196, 1, 0, 1,
-0.7045258, 0.03775338, -2.48394, 0.5411765, 1, 0, 1,
-0.7029832, 0.4758667, -2.495092, 0.5372549, 1, 0, 1,
-0.7004783, -1.069214, -3.974649, 0.5294118, 1, 0, 1,
-0.6966171, -1.3087, -2.525125, 0.5254902, 1, 0, 1,
-0.6919422, -0.6117077, -3.562871, 0.5176471, 1, 0, 1,
-0.690538, -1.44092, -2.561974, 0.5137255, 1, 0, 1,
-0.6852371, 0.507224, -1.106256, 0.5058824, 1, 0, 1,
-0.6834803, -0.352974, -2.589854, 0.5019608, 1, 0, 1,
-0.6828901, 1.050102, -0.006335862, 0.4941176, 1, 0, 1,
-0.6822274, -0.1141403, -3.213978, 0.4862745, 1, 0, 1,
-0.6801012, 0.1718855, -1.040395, 0.4823529, 1, 0, 1,
-0.6798172, -0.782073, -1.85538, 0.4745098, 1, 0, 1,
-0.6759319, -0.0727351, -1.630647, 0.4705882, 1, 0, 1,
-0.6700609, 0.6533591, -1.811284, 0.4627451, 1, 0, 1,
-0.6686607, -2.255161, -2.366876, 0.4588235, 1, 0, 1,
-0.6681299, -0.6228602, -1.202797, 0.4509804, 1, 0, 1,
-0.665581, -1.051821, -4.627973, 0.4470588, 1, 0, 1,
-0.6624049, -0.09759592, -1.556286, 0.4392157, 1, 0, 1,
-0.6601359, 0.08979244, -2.113849, 0.4352941, 1, 0, 1,
-0.6585661, -0.3453683, -1.47524, 0.427451, 1, 0, 1,
-0.6572179, 0.5403807, 0.9243973, 0.4235294, 1, 0, 1,
-0.6566347, -0.1987713, -0.4450928, 0.4156863, 1, 0, 1,
-0.6560286, -0.1699609, -1.309784, 0.4117647, 1, 0, 1,
-0.6546078, -0.4717729, -2.801987, 0.4039216, 1, 0, 1,
-0.6529027, 0.3748326, -2.854201, 0.3960784, 1, 0, 1,
-0.6525301, -1.084288, -2.735246, 0.3921569, 1, 0, 1,
-0.6513643, 0.6533115, -1.202737, 0.3843137, 1, 0, 1,
-0.6470935, 0.3806734, 0.07415338, 0.3803922, 1, 0, 1,
-0.6445555, 1.209829, 0.3067854, 0.372549, 1, 0, 1,
-0.6389615, 0.02503339, -0.7991778, 0.3686275, 1, 0, 1,
-0.6365216, -0.5593287, -3.040417, 0.3607843, 1, 0, 1,
-0.6362502, 0.8892597, -0.7984694, 0.3568628, 1, 0, 1,
-0.6356021, -0.8491392, -2.727332, 0.3490196, 1, 0, 1,
-0.6294213, 0.09061037, -1.524911, 0.345098, 1, 0, 1,
-0.6263584, -1.943948, -2.001205, 0.3372549, 1, 0, 1,
-0.6239623, 0.002416912, -2.748024, 0.3333333, 1, 0, 1,
-0.620323, 1.521054, -0.3184894, 0.3254902, 1, 0, 1,
-0.618808, 1.538562, 0.2357507, 0.3215686, 1, 0, 1,
-0.6169923, 0.4713078, -1.695917, 0.3137255, 1, 0, 1,
-0.6102294, -1.178105, -3.221282, 0.3098039, 1, 0, 1,
-0.6055447, -2.002391, -4.299723, 0.3019608, 1, 0, 1,
-0.6049718, 1.663369, -1.24944, 0.2941177, 1, 0, 1,
-0.5991059, 0.9777036, -2.232043, 0.2901961, 1, 0, 1,
-0.5944805, 0.5235239, -0.1748372, 0.282353, 1, 0, 1,
-0.5930357, 1.750012, 0.9150543, 0.2784314, 1, 0, 1,
-0.5929579, -0.5419961, -3.326904, 0.2705882, 1, 0, 1,
-0.5923271, 1.225408, -0.03363537, 0.2666667, 1, 0, 1,
-0.5912017, 0.03575553, -1.840491, 0.2588235, 1, 0, 1,
-0.5878101, -0.5704374, -2.204133, 0.254902, 1, 0, 1,
-0.5875045, -0.6615631, -0.8816565, 0.2470588, 1, 0, 1,
-0.5870923, 0.2407486, -1.025742, 0.2431373, 1, 0, 1,
-0.586763, 0.2647959, -1.528656, 0.2352941, 1, 0, 1,
-0.5836962, -1.160759, -2.67846, 0.2313726, 1, 0, 1,
-0.582458, -0.7841812, -0.4953014, 0.2235294, 1, 0, 1,
-0.5793959, -0.4167982, -1.270686, 0.2196078, 1, 0, 1,
-0.5780296, 0.9619699, -2.036464, 0.2117647, 1, 0, 1,
-0.5774735, -0.5948629, -2.582705, 0.2078431, 1, 0, 1,
-0.5774338, -0.385585, -3.756791, 0.2, 1, 0, 1,
-0.5769194, 0.3302759, -1.206947, 0.1921569, 1, 0, 1,
-0.5743511, -0.2214505, -3.594385, 0.1882353, 1, 0, 1,
-0.5738547, -0.312111, -2.686577, 0.1803922, 1, 0, 1,
-0.5721754, 0.6069153, -1.526599, 0.1764706, 1, 0, 1,
-0.5710244, -0.2079153, -1.357096, 0.1686275, 1, 0, 1,
-0.5604509, -0.7434415, -3.332363, 0.1647059, 1, 0, 1,
-0.5603394, 0.02268654, -2.85715, 0.1568628, 1, 0, 1,
-0.5564383, 0.6524072, 0.2905992, 0.1529412, 1, 0, 1,
-0.5554121, -0.5026712, -1.948135, 0.145098, 1, 0, 1,
-0.5519817, -0.6106872, -1.240113, 0.1411765, 1, 0, 1,
-0.5511912, 0.1346793, -2.133163, 0.1333333, 1, 0, 1,
-0.5493175, -0.4475224, -2.027408, 0.1294118, 1, 0, 1,
-0.5435488, 0.5601629, 0.8358368, 0.1215686, 1, 0, 1,
-0.5414714, 1.224773, 0.03678983, 0.1176471, 1, 0, 1,
-0.5408496, -0.2685372, -2.059945, 0.1098039, 1, 0, 1,
-0.5389631, -2.57498, -3.260665, 0.1058824, 1, 0, 1,
-0.5384312, -0.08126542, -2.828391, 0.09803922, 1, 0, 1,
-0.5383721, -1.337601, -2.956013, 0.09019608, 1, 0, 1,
-0.5355529, -0.8779675, -3.472101, 0.08627451, 1, 0, 1,
-0.5344152, 0.3390375, -0.01739668, 0.07843138, 1, 0, 1,
-0.5313788, 0.9336597, -1.800949, 0.07450981, 1, 0, 1,
-0.5308443, -1.349701, -3.419782, 0.06666667, 1, 0, 1,
-0.5297493, 0.3422919, -2.677384, 0.0627451, 1, 0, 1,
-0.5233996, 0.3875623, -0.912729, 0.05490196, 1, 0, 1,
-0.5203202, -1.0458, -2.656482, 0.05098039, 1, 0, 1,
-0.5167661, -0.5892628, -0.46866, 0.04313726, 1, 0, 1,
-0.511726, 0.5540295, -0.6788405, 0.03921569, 1, 0, 1,
-0.5067298, 1.057143, 1.590388, 0.03137255, 1, 0, 1,
-0.506693, -0.8430172, -2.140618, 0.02745098, 1, 0, 1,
-0.504171, -0.5862734, -2.816675, 0.01960784, 1, 0, 1,
-0.5030918, 0.6371689, -2.006726, 0.01568628, 1, 0, 1,
-0.5023265, 0.1644797, -1.919019, 0.007843138, 1, 0, 1,
-0.5017109, 1.027027, -0.5039247, 0.003921569, 1, 0, 1,
-0.4938714, -1.155395, -2.748762, 0, 1, 0.003921569, 1,
-0.4853192, 0.6233324, -0.4799889, 0, 1, 0.01176471, 1,
-0.4848634, -1.645068, -4.156079, 0, 1, 0.01568628, 1,
-0.4760848, 0.6933028, -0.2012569, 0, 1, 0.02352941, 1,
-0.4759276, -1.272657, -0.9656968, 0, 1, 0.02745098, 1,
-0.4714551, -0.2914927, -2.718716, 0, 1, 0.03529412, 1,
-0.4694875, 0.8031192, -0.7018995, 0, 1, 0.03921569, 1,
-0.46779, 0.2782624, -1.314632, 0, 1, 0.04705882, 1,
-0.4677789, 0.06286258, -0.6815818, 0, 1, 0.05098039, 1,
-0.4607551, 1.418431, -0.1864051, 0, 1, 0.05882353, 1,
-0.4592867, 0.634309, -1.107025, 0, 1, 0.0627451, 1,
-0.4481948, -1.875185, -3.151878, 0, 1, 0.07058824, 1,
-0.4412704, 0.1437626, -2.6676, 0, 1, 0.07450981, 1,
-0.4406642, -0.3065378, -2.145926, 0, 1, 0.08235294, 1,
-0.4404139, -0.6057135, -1.660671, 0, 1, 0.08627451, 1,
-0.4401855, -0.2241913, -3.880523, 0, 1, 0.09411765, 1,
-0.4369309, -1.393297, -2.765309, 0, 1, 0.1019608, 1,
-0.4356405, -1.033117, -3.161366, 0, 1, 0.1058824, 1,
-0.4304049, 0.1837505, -1.912191, 0, 1, 0.1137255, 1,
-0.4240934, -0.8098928, -2.796558, 0, 1, 0.1176471, 1,
-0.4236095, -0.1500246, -1.256371, 0, 1, 0.1254902, 1,
-0.4207097, 0.00437731, -1.656428, 0, 1, 0.1294118, 1,
-0.4143398, 1.124295, 0.005279283, 0, 1, 0.1372549, 1,
-0.4141113, -0.6183817, -3.306912, 0, 1, 0.1411765, 1,
-0.4076409, -0.05584194, -2.029657, 0, 1, 0.1490196, 1,
-0.4060898, 1.480715, 0.6018245, 0, 1, 0.1529412, 1,
-0.4060676, 0.5102524, 0.3723729, 0, 1, 0.1607843, 1,
-0.402851, 1.116991, 0.06411845, 0, 1, 0.1647059, 1,
-0.4014054, -0.3003761, -3.39684, 0, 1, 0.172549, 1,
-0.3994015, 0.2386235, -2.07847, 0, 1, 0.1764706, 1,
-0.3954425, 0.7753918, -2.778219, 0, 1, 0.1843137, 1,
-0.3949402, 0.5309302, -0.7211606, 0, 1, 0.1882353, 1,
-0.3938816, -0.1423878, -2.035457, 0, 1, 0.1960784, 1,
-0.3915656, 1.234753, -1.27037, 0, 1, 0.2039216, 1,
-0.3914721, -2.496124, -2.946445, 0, 1, 0.2078431, 1,
-0.3913451, -1.956457, -1.152866, 0, 1, 0.2156863, 1,
-0.3878951, -1.791044, -3.860737, 0, 1, 0.2196078, 1,
-0.3869871, -0.01312952, -2.930644, 0, 1, 0.227451, 1,
-0.3866892, 1.191904, -2.054225, 0, 1, 0.2313726, 1,
-0.3860417, 0.34986, -1.545616, 0, 1, 0.2392157, 1,
-0.3807588, -0.01360241, -3.795363, 0, 1, 0.2431373, 1,
-0.378959, 0.2119759, -1.967434, 0, 1, 0.2509804, 1,
-0.3786331, -1.189443, -4.054295, 0, 1, 0.254902, 1,
-0.3762106, -0.5701631, -3.065722, 0, 1, 0.2627451, 1,
-0.3749005, 0.3272351, -1.028584, 0, 1, 0.2666667, 1,
-0.3626797, 1.521707, -1.239626, 0, 1, 0.2745098, 1,
-0.3606324, 1.383679, -0.1832315, 0, 1, 0.2784314, 1,
-0.3605727, 0.2995903, -2.644408, 0, 1, 0.2862745, 1,
-0.3524423, -0.3900836, -2.307771, 0, 1, 0.2901961, 1,
-0.349492, 0.6656803, -0.182186, 0, 1, 0.2980392, 1,
-0.3424521, 1.344461, 0.0763377, 0, 1, 0.3058824, 1,
-0.3421246, 0.01695878, -1.809238, 0, 1, 0.3098039, 1,
-0.3396404, 1.172487, 0.6801438, 0, 1, 0.3176471, 1,
-0.3373696, 0.5850474, 0.8260407, 0, 1, 0.3215686, 1,
-0.3370285, -1.064404, -2.442419, 0, 1, 0.3294118, 1,
-0.3324315, -0.619792, -1.643563, 0, 1, 0.3333333, 1,
-0.3303886, -1.146433, -2.965463, 0, 1, 0.3411765, 1,
-0.3268171, -0.8162809, -2.440562, 0, 1, 0.345098, 1,
-0.3233694, -0.04965666, -2.720099, 0, 1, 0.3529412, 1,
-0.3210417, 1.455714, 1.609092, 0, 1, 0.3568628, 1,
-0.3173663, 0.2093944, -1.780545, 0, 1, 0.3647059, 1,
-0.312057, -0.5072961, -3.495309, 0, 1, 0.3686275, 1,
-0.3076695, 0.6341825, -0.8159335, 0, 1, 0.3764706, 1,
-0.3067864, 1.508245, -0.2337471, 0, 1, 0.3803922, 1,
-0.3043655, 2.382412, 0.8289142, 0, 1, 0.3882353, 1,
-0.299812, -0.519484, -3.460981, 0, 1, 0.3921569, 1,
-0.2989479, 1.984289, 0.7259187, 0, 1, 0.4, 1,
-0.2986036, -0.4921958, -1.048747, 0, 1, 0.4078431, 1,
-0.2972772, 1.871179, 0.1321105, 0, 1, 0.4117647, 1,
-0.2967251, 0.1842981, -2.019807, 0, 1, 0.4196078, 1,
-0.2939652, -0.4160738, -2.654794, 0, 1, 0.4235294, 1,
-0.2919736, 0.8890941, 0.457821, 0, 1, 0.4313726, 1,
-0.2857232, 1.42433, -0.8791518, 0, 1, 0.4352941, 1,
-0.2843786, -1.113578, -1.947867, 0, 1, 0.4431373, 1,
-0.2774451, 0.04563107, 0.9200012, 0, 1, 0.4470588, 1,
-0.2753297, 1.157774, -1.57182, 0, 1, 0.454902, 1,
-0.2748866, 1.717539, -1.001402, 0, 1, 0.4588235, 1,
-0.2746528, 1.709087, -0.2402564, 0, 1, 0.4666667, 1,
-0.2703117, -1.243724, -3.424443, 0, 1, 0.4705882, 1,
-0.2636268, 1.191235, -0.562209, 0, 1, 0.4784314, 1,
-0.26284, -1.739175, -5.62542, 0, 1, 0.4823529, 1,
-0.2613872, 0.3369103, -1.060036, 0, 1, 0.4901961, 1,
-0.2600709, -2.008021, -3.824822, 0, 1, 0.4941176, 1,
-0.2594069, 1.180172, -0.9728999, 0, 1, 0.5019608, 1,
-0.2581606, 1.224161, -0.2663091, 0, 1, 0.509804, 1,
-0.2570395, -0.1668328, -2.751198, 0, 1, 0.5137255, 1,
-0.2557614, -0.5067446, -2.707963, 0, 1, 0.5215687, 1,
-0.2500429, -1.07598, -4.01438, 0, 1, 0.5254902, 1,
-0.248673, 1.341293, -0.9636554, 0, 1, 0.5333334, 1,
-0.2435781, -1.262864, -3.920828, 0, 1, 0.5372549, 1,
-0.2433812, -1.196652, -3.589197, 0, 1, 0.5450981, 1,
-0.2428176, -0.6999628, -4.520571, 0, 1, 0.5490196, 1,
-0.2416013, -0.8483811, -1.952702, 0, 1, 0.5568628, 1,
-0.2404173, -0.8804092, -3.563216, 0, 1, 0.5607843, 1,
-0.2402069, 0.376712, 1.229914, 0, 1, 0.5686275, 1,
-0.2402013, -0.1738446, -2.237246, 0, 1, 0.572549, 1,
-0.2379414, -0.9160916, -3.499465, 0, 1, 0.5803922, 1,
-0.2371218, -0.1890973, -1.059634, 0, 1, 0.5843138, 1,
-0.2370535, 2.239872, -1.076743, 0, 1, 0.5921569, 1,
-0.235265, -1.661713, -2.310294, 0, 1, 0.5960785, 1,
-0.2342228, 0.8756306, 0.7708735, 0, 1, 0.6039216, 1,
-0.23366, 0.9825308, -1.307178, 0, 1, 0.6117647, 1,
-0.2300971, 0.8529259, -1.863376, 0, 1, 0.6156863, 1,
-0.2278409, -0.1456628, -0.8406642, 0, 1, 0.6235294, 1,
-0.2243311, -1.3434, -2.181911, 0, 1, 0.627451, 1,
-0.2235867, -0.6732662, -2.151002, 0, 1, 0.6352941, 1,
-0.21967, 0.9794481, -0.8962128, 0, 1, 0.6392157, 1,
-0.2196416, 0.08538244, -0.8683618, 0, 1, 0.6470588, 1,
-0.2147195, 1.721036, -0.9252027, 0, 1, 0.6509804, 1,
-0.2137524, -0.2777256, -4.2214, 0, 1, 0.6588235, 1,
-0.2066779, -0.3671573, -3.622502, 0, 1, 0.6627451, 1,
-0.2060739, 1.704395, -2.068599, 0, 1, 0.6705883, 1,
-0.2059082, -1.159268, -5.310939, 0, 1, 0.6745098, 1,
-0.1978419, -1.179033, -4.274489, 0, 1, 0.682353, 1,
-0.1973424, 0.3359782, -1.612316, 0, 1, 0.6862745, 1,
-0.1967911, 0.0826138, -2.955984, 0, 1, 0.6941177, 1,
-0.1922619, -1.332643, -1.888975, 0, 1, 0.7019608, 1,
-0.1906406, 0.7919939, -0.1783684, 0, 1, 0.7058824, 1,
-0.1906212, 1.304078, -0.5818744, 0, 1, 0.7137255, 1,
-0.1899302, -0.5102435, -1.846435, 0, 1, 0.7176471, 1,
-0.1852808, 0.3509493, -2.06538, 0, 1, 0.7254902, 1,
-0.183806, -0.0952742, -2.257435, 0, 1, 0.7294118, 1,
-0.1818832, -1.6132, -2.935323, 0, 1, 0.7372549, 1,
-0.1798222, -0.4706909, -2.733523, 0, 1, 0.7411765, 1,
-0.1788686, -0.5643524, -3.607678, 0, 1, 0.7490196, 1,
-0.176896, 0.8636721, 1.081031, 0, 1, 0.7529412, 1,
-0.1766423, 1.038168, 1.992073, 0, 1, 0.7607843, 1,
-0.174589, 0.516521, -0.2008426, 0, 1, 0.7647059, 1,
-0.1699327, -0.04121566, -2.573156, 0, 1, 0.772549, 1,
-0.1692354, 1.160914, -0.5059929, 0, 1, 0.7764706, 1,
-0.1690136, 1.461943, -1.212901, 0, 1, 0.7843137, 1,
-0.1673343, 0.02330465, -3.393739, 0, 1, 0.7882353, 1,
-0.1619921, -2.402682, -3.831076, 0, 1, 0.7960784, 1,
-0.1607931, -1.104407, -3.52316, 0, 1, 0.8039216, 1,
-0.1607379, 0.09561523, -0.6155667, 0, 1, 0.8078431, 1,
-0.1603028, 0.3947102, -0.5686678, 0, 1, 0.8156863, 1,
-0.1528967, -0.3087687, -3.734612, 0, 1, 0.8196079, 1,
-0.1506694, -1.604706, -3.968742, 0, 1, 0.827451, 1,
-0.1482826, -0.8808239, -4.018139, 0, 1, 0.8313726, 1,
-0.1445936, -0.4226072, -3.095489, 0, 1, 0.8392157, 1,
-0.1398105, -0.08421158, -0.7684499, 0, 1, 0.8431373, 1,
-0.1378752, -2.107493, -1.760974, 0, 1, 0.8509804, 1,
-0.1364389, -1.00817, -4.253122, 0, 1, 0.854902, 1,
-0.1312866, 0.1656973, 0.2521983, 0, 1, 0.8627451, 1,
-0.1303141, 1.446559, -0.5189238, 0, 1, 0.8666667, 1,
-0.1278672, -0.08326881, -2.483603, 0, 1, 0.8745098, 1,
-0.1247812, 1.210604, 0.9546599, 0, 1, 0.8784314, 1,
-0.1227198, -1.223675, -2.976527, 0, 1, 0.8862745, 1,
-0.1207028, -2.124055, -2.564697, 0, 1, 0.8901961, 1,
-0.1197251, 0.4992448, -0.8325285, 0, 1, 0.8980392, 1,
-0.1192185, 0.113055, -2.919171, 0, 1, 0.9058824, 1,
-0.1064306, 0.6470624, -0.3261243, 0, 1, 0.9098039, 1,
-0.1049176, 1.465827, -0.6724391, 0, 1, 0.9176471, 1,
-0.1018875, -0.4295642, -5.04596, 0, 1, 0.9215686, 1,
-0.09550277, 0.7810035, 2.12013, 0, 1, 0.9294118, 1,
-0.09394459, -1.419084, -1.692453, 0, 1, 0.9333333, 1,
-0.09211605, -1.300188, -4.008831, 0, 1, 0.9411765, 1,
-0.09178593, 0.1283232, 0.3085389, 0, 1, 0.945098, 1,
-0.08521102, 0.3301803, -2.734507, 0, 1, 0.9529412, 1,
-0.08265191, -0.09553939, -2.315702, 0, 1, 0.9568627, 1,
-0.07979086, 1.354361, 0.5810069, 0, 1, 0.9647059, 1,
-0.07450736, 0.8687655, -0.9471665, 0, 1, 0.9686275, 1,
-0.07230196, -1.225392, -2.831099, 0, 1, 0.9764706, 1,
-0.07204986, -0.5415793, -1.718196, 0, 1, 0.9803922, 1,
-0.06971416, 0.9238445, -0.1049109, 0, 1, 0.9882353, 1,
-0.06908858, 0.2401771, -0.6010739, 0, 1, 0.9921569, 1,
-0.06854154, -1.402764, -3.22126, 0, 1, 1, 1,
-0.06750876, -0.6957644, -3.010856, 0, 0.9921569, 1, 1,
-0.06585792, -0.378113, -3.712384, 0, 0.9882353, 1, 1,
-0.06182658, 0.3106272, -0.837301, 0, 0.9803922, 1, 1,
-0.05474968, -0.3049786, -4.132166, 0, 0.9764706, 1, 1,
-0.04607296, -0.4255679, -1.911413, 0, 0.9686275, 1, 1,
-0.03546305, 1.423491, -1.099028, 0, 0.9647059, 1, 1,
-0.03332631, 0.4157666, -0.2120284, 0, 0.9568627, 1, 1,
-0.02899569, 0.003737863, -0.2658374, 0, 0.9529412, 1, 1,
-0.02475843, 1.44742, 0.2223563, 0, 0.945098, 1, 1,
-0.02203551, 0.9188512, -0.1551806, 0, 0.9411765, 1, 1,
-0.01789889, 0.676242, -0.6771511, 0, 0.9333333, 1, 1,
-0.009981897, -0.2881051, -2.834666, 0, 0.9294118, 1, 1,
-0.008837885, -0.153779, -3.429512, 0, 0.9215686, 1, 1,
-0.007002015, -0.4130028, -4.251534, 0, 0.9176471, 1, 1,
-0.003334174, -1.370573, -3.284647, 0, 0.9098039, 1, 1,
-0.00182269, 1.052885, 1.479781, 0, 0.9058824, 1, 1,
0.0001697305, -2.024437, 1.19367, 0, 0.8980392, 1, 1,
0.001653719, -0.08856683, 3.809141, 0, 0.8901961, 1, 1,
0.001837252, 1.265783, -0.8617959, 0, 0.8862745, 1, 1,
0.004441137, 0.2915405, -0.2187652, 0, 0.8784314, 1, 1,
0.007289597, -0.8420877, 2.455159, 0, 0.8745098, 1, 1,
0.01501632, 1.600291, -2.215807, 0, 0.8666667, 1, 1,
0.01613738, 0.007462178, 1.349396, 0, 0.8627451, 1, 1,
0.01715485, -0.4765621, 3.268869, 0, 0.854902, 1, 1,
0.02505656, 0.6847407, 0.4173147, 0, 0.8509804, 1, 1,
0.02792159, -1.121538, 4.797208, 0, 0.8431373, 1, 1,
0.02885552, 0.5184759, -0.6648837, 0, 0.8392157, 1, 1,
0.03289297, 0.6958374, 2.630734, 0, 0.8313726, 1, 1,
0.03862358, 0.6512614, 0.8811967, 0, 0.827451, 1, 1,
0.04231724, 1.322824, 0.2917011, 0, 0.8196079, 1, 1,
0.04426929, 0.01358006, 1.401219, 0, 0.8156863, 1, 1,
0.04608269, -0.7783448, 2.125833, 0, 0.8078431, 1, 1,
0.04829113, -0.1930625, 2.097264, 0, 0.8039216, 1, 1,
0.05182334, 0.8852713, 0.6408759, 0, 0.7960784, 1, 1,
0.05343655, -0.1069475, 4.545455, 0, 0.7882353, 1, 1,
0.05525625, -0.3557737, 1.808222, 0, 0.7843137, 1, 1,
0.06688017, 2.166428, 0.6365604, 0, 0.7764706, 1, 1,
0.07052361, -1.091149, 2.593247, 0, 0.772549, 1, 1,
0.0714498, -1.896452, 3.581133, 0, 0.7647059, 1, 1,
0.07332701, 1.426002, 1.588282, 0, 0.7607843, 1, 1,
0.07380468, 0.1102547, 1.916001, 0, 0.7529412, 1, 1,
0.07483873, -0.8085127, 4.064365, 0, 0.7490196, 1, 1,
0.07768343, -2.557486, 2.418705, 0, 0.7411765, 1, 1,
0.07788668, 0.02830462, 1.444499, 0, 0.7372549, 1, 1,
0.07857671, -0.4329006, 4.193464, 0, 0.7294118, 1, 1,
0.07972796, -0.1937792, 3.234498, 0, 0.7254902, 1, 1,
0.0835402, -1.550886, 2.207976, 0, 0.7176471, 1, 1,
0.08556601, -1.773283, 3.490192, 0, 0.7137255, 1, 1,
0.08609232, -0.1476168, 2.203856, 0, 0.7058824, 1, 1,
0.08970561, -1.482379, 3.545876, 0, 0.6980392, 1, 1,
0.09116199, 0.6265311, 1.323818, 0, 0.6941177, 1, 1,
0.09507344, 0.0008550335, 2.654507, 0, 0.6862745, 1, 1,
0.09668416, 0.0853667, 3.214717, 0, 0.682353, 1, 1,
0.09853701, -1.043183, 2.160845, 0, 0.6745098, 1, 1,
0.09966877, 0.7883831, -0.2814298, 0, 0.6705883, 1, 1,
0.1016005, 0.2055669, 2.295813, 0, 0.6627451, 1, 1,
0.1031365, 2.286535, -0.04332928, 0, 0.6588235, 1, 1,
0.1133399, 1.65894, 0.4107793, 0, 0.6509804, 1, 1,
0.1150286, -1.013551, 1.6818, 0, 0.6470588, 1, 1,
0.1163149, -0.8636567, 3.704274, 0, 0.6392157, 1, 1,
0.1187792, -1.043882, 4.31729, 0, 0.6352941, 1, 1,
0.1201916, 1.510974, 1.495143, 0, 0.627451, 1, 1,
0.1205622, 0.5395834, 0.6848933, 0, 0.6235294, 1, 1,
0.1233755, -0.6997775, 2.14285, 0, 0.6156863, 1, 1,
0.1235366, 0.2054721, 0.7713765, 0, 0.6117647, 1, 1,
0.1316346, 0.9372532, -0.1200016, 0, 0.6039216, 1, 1,
0.1321316, 1.40717, 0.4523785, 0, 0.5960785, 1, 1,
0.137193, -0.6812066, 3.274967, 0, 0.5921569, 1, 1,
0.1379711, 1.234062, -1.820895, 0, 0.5843138, 1, 1,
0.1485359, 0.3517489, -0.7983815, 0, 0.5803922, 1, 1,
0.1537815, -0.8335937, 3.151072, 0, 0.572549, 1, 1,
0.1563261, -0.3672814, 2.217765, 0, 0.5686275, 1, 1,
0.1633919, 0.7066184, -0.02533492, 0, 0.5607843, 1, 1,
0.1653975, -0.120464, 2.344293, 0, 0.5568628, 1, 1,
0.1697541, 0.03122384, -0.3731098, 0, 0.5490196, 1, 1,
0.1699378, 1.876317, -1.76159, 0, 0.5450981, 1, 1,
0.17646, 0.07889369, -0.509002, 0, 0.5372549, 1, 1,
0.180134, -0.8667298, 0.5620561, 0, 0.5333334, 1, 1,
0.1824886, -0.4139609, 1.847688, 0, 0.5254902, 1, 1,
0.1841536, -1.216355, 1.420791, 0, 0.5215687, 1, 1,
0.1846452, -0.90703, 3.149811, 0, 0.5137255, 1, 1,
0.1848908, -0.3660402, 3.573295, 0, 0.509804, 1, 1,
0.1928976, -0.2164831, 1.927114, 0, 0.5019608, 1, 1,
0.1977564, -0.1721106, 2.043855, 0, 0.4941176, 1, 1,
0.1988315, 0.1883993, 1.986051, 0, 0.4901961, 1, 1,
0.2002057, -0.7056115, -0.4493079, 0, 0.4823529, 1, 1,
0.2004756, -1.72537, 2.090831, 0, 0.4784314, 1, 1,
0.2042567, 0.3497457, -0.4163205, 0, 0.4705882, 1, 1,
0.2075812, -0.05071553, 3.633867, 0, 0.4666667, 1, 1,
0.2114571, 0.7601494, 0.1195643, 0, 0.4588235, 1, 1,
0.2153062, 0.9486772, 0.09911452, 0, 0.454902, 1, 1,
0.2154166, 0.5032405, 0.383471, 0, 0.4470588, 1, 1,
0.219137, 0.6494684, 0.9267902, 0, 0.4431373, 1, 1,
0.2226246, -0.6729854, 4.268579, 0, 0.4352941, 1, 1,
0.2243904, -0.8279265, 4.576891, 0, 0.4313726, 1, 1,
0.2383253, 0.5494847, 1.584353, 0, 0.4235294, 1, 1,
0.2387232, -1.606019, 3.184457, 0, 0.4196078, 1, 1,
0.2395497, -0.4422932, 1.638904, 0, 0.4117647, 1, 1,
0.2404733, -0.355311, 2.718313, 0, 0.4078431, 1, 1,
0.2436435, -1.50029, 3.281481, 0, 0.4, 1, 1,
0.2448931, -1.728045, 2.545214, 0, 0.3921569, 1, 1,
0.2449991, 0.9380884, -0.04864641, 0, 0.3882353, 1, 1,
0.2460619, 0.5295359, 1.029452, 0, 0.3803922, 1, 1,
0.2486946, -0.3310692, 3.548229, 0, 0.3764706, 1, 1,
0.2502647, 0.1879886, 0.6526466, 0, 0.3686275, 1, 1,
0.2536436, 2.228996, 0.5611211, 0, 0.3647059, 1, 1,
0.2540809, -1.641634, 2.562896, 0, 0.3568628, 1, 1,
0.2549735, -2.242322, 4.315123, 0, 0.3529412, 1, 1,
0.2581251, -0.6834533, 2.881021, 0, 0.345098, 1, 1,
0.2623604, -0.0529994, 2.433483, 0, 0.3411765, 1, 1,
0.2651461, -1.697088, 4.722207, 0, 0.3333333, 1, 1,
0.26758, -1.194305, 2.683857, 0, 0.3294118, 1, 1,
0.2676394, -1.343465, 1.452788, 0, 0.3215686, 1, 1,
0.2680817, -0.1977381, 1.420147, 0, 0.3176471, 1, 1,
0.2710147, -0.2097565, 2.300451, 0, 0.3098039, 1, 1,
0.2726318, 2.21439, -1.231726, 0, 0.3058824, 1, 1,
0.2742769, -0.003727497, 0.9068119, 0, 0.2980392, 1, 1,
0.2775507, 0.6876447, -0.9398468, 0, 0.2901961, 1, 1,
0.2777407, 0.2760302, 1.471235, 0, 0.2862745, 1, 1,
0.2789854, -0.02954896, 1.916171, 0, 0.2784314, 1, 1,
0.2815574, 0.3001483, -0.1827039, 0, 0.2745098, 1, 1,
0.2830195, 0.9937201, 0.1120029, 0, 0.2666667, 1, 1,
0.2868211, -0.1130166, 2.962175, 0, 0.2627451, 1, 1,
0.2911876, -0.5961723, 3.022609, 0, 0.254902, 1, 1,
0.295779, -1.882318, 3.868408, 0, 0.2509804, 1, 1,
0.2986094, 0.5090829, 0.01950127, 0, 0.2431373, 1, 1,
0.2994724, 0.6872245, 0.1784201, 0, 0.2392157, 1, 1,
0.3013744, -0.04194673, 1.126863, 0, 0.2313726, 1, 1,
0.3055245, 0.1967703, 0.1148451, 0, 0.227451, 1, 1,
0.3061767, 0.2897545, -0.8052638, 0, 0.2196078, 1, 1,
0.307005, -0.3042623, 2.283037, 0, 0.2156863, 1, 1,
0.3083824, 0.5116055, 1.347805, 0, 0.2078431, 1, 1,
0.3089106, 0.1826523, -0.4054186, 0, 0.2039216, 1, 1,
0.3100775, 0.2798621, -0.955283, 0, 0.1960784, 1, 1,
0.3103195, 0.2522017, 0.2190906, 0, 0.1882353, 1, 1,
0.3116922, -0.163357, 2.588157, 0, 0.1843137, 1, 1,
0.3179764, -0.1089188, 0.9141013, 0, 0.1764706, 1, 1,
0.3215468, -1.003502, 1.871386, 0, 0.172549, 1, 1,
0.3221097, -1.124591, 2.962786, 0, 0.1647059, 1, 1,
0.3231129, -0.07341965, 2.416136, 0, 0.1607843, 1, 1,
0.3289247, 1.515764, 1.690144, 0, 0.1529412, 1, 1,
0.3293535, 0.1689911, 1.862606, 0, 0.1490196, 1, 1,
0.340345, 0.3081327, -0.3990871, 0, 0.1411765, 1, 1,
0.3411869, -0.9205099, 3.102834, 0, 0.1372549, 1, 1,
0.3446786, 0.2139126, 0.3956416, 0, 0.1294118, 1, 1,
0.345492, -2.181955, 2.723047, 0, 0.1254902, 1, 1,
0.345643, -1.579595, 3.517369, 0, 0.1176471, 1, 1,
0.3477671, -0.04129126, 1.688253, 0, 0.1137255, 1, 1,
0.3497915, -0.3430842, 2.783493, 0, 0.1058824, 1, 1,
0.3574283, 0.08569065, 2.336788, 0, 0.09803922, 1, 1,
0.357842, -0.4436207, 0.6778216, 0, 0.09411765, 1, 1,
0.3580197, 1.273122, 0.7601957, 0, 0.08627451, 1, 1,
0.3584119, 0.5966719, 1.773764, 0, 0.08235294, 1, 1,
0.3635779, -0.626689, 2.182256, 0, 0.07450981, 1, 1,
0.363735, -0.1011366, 3.461926, 0, 0.07058824, 1, 1,
0.3646345, -2.290339, 2.372584, 0, 0.0627451, 1, 1,
0.364796, -1.997147, 0.6940835, 0, 0.05882353, 1, 1,
0.369061, 1.5383, -0.2213713, 0, 0.05098039, 1, 1,
0.3806406, -0.5037051, 2.543738, 0, 0.04705882, 1, 1,
0.3827699, -0.7480056, 1.862246, 0, 0.03921569, 1, 1,
0.383369, 0.9070442, 0.09193328, 0, 0.03529412, 1, 1,
0.3863493, -1.208915, 2.739773, 0, 0.02745098, 1, 1,
0.3889998, 0.4472298, 0.9515325, 0, 0.02352941, 1, 1,
0.3906477, 0.6922249, 0.3104656, 0, 0.01568628, 1, 1,
0.393996, -0.2879606, 1.368126, 0, 0.01176471, 1, 1,
0.4017631, 1.576335, -0.191326, 0, 0.003921569, 1, 1,
0.4025661, -0.1928292, 2.634977, 0.003921569, 0, 1, 1,
0.4082634, -1.446182, 3.629624, 0.007843138, 0, 1, 1,
0.4116296, -0.3441628, 2.62829, 0.01568628, 0, 1, 1,
0.4120778, 1.687115, 1.288579, 0.01960784, 0, 1, 1,
0.4132087, -0.50161, 0.6491012, 0.02745098, 0, 1, 1,
0.4139257, 0.3493391, -0.1747288, 0.03137255, 0, 1, 1,
0.4159221, 0.5462878, -1.585344, 0.03921569, 0, 1, 1,
0.4162535, 0.7977357, 1.452842, 0.04313726, 0, 1, 1,
0.4250855, 1.112976, 1.107382, 0.05098039, 0, 1, 1,
0.4268942, 1.23716, 0.1457382, 0.05490196, 0, 1, 1,
0.4285389, -0.118028, 0.3531078, 0.0627451, 0, 1, 1,
0.4320759, -1.605327, 2.618829, 0.06666667, 0, 1, 1,
0.4325391, -0.1049197, 2.853708, 0.07450981, 0, 1, 1,
0.4340239, 0.7576734, -0.7202498, 0.07843138, 0, 1, 1,
0.4351207, -0.1952516, 1.640279, 0.08627451, 0, 1, 1,
0.4358044, 0.4744596, 1.839281, 0.09019608, 0, 1, 1,
0.4382944, 1.142129, 0.1779594, 0.09803922, 0, 1, 1,
0.4383784, 0.3562166, 0.3872462, 0.1058824, 0, 1, 1,
0.4392646, 0.4635662, 0.7140584, 0.1098039, 0, 1, 1,
0.4482755, 0.8908017, 0.5327451, 0.1176471, 0, 1, 1,
0.4515073, 0.5814711, 0.6289402, 0.1215686, 0, 1, 1,
0.4580154, -0.3470098, 1.097673, 0.1294118, 0, 1, 1,
0.4607624, 0.03103151, -0.132629, 0.1333333, 0, 1, 1,
0.4636916, 1.538581, 0.6163793, 0.1411765, 0, 1, 1,
0.4669212, 1.184227, 0.6341771, 0.145098, 0, 1, 1,
0.467661, 0.1703837, -0.7827587, 0.1529412, 0, 1, 1,
0.4682986, -0.1248856, 1.900572, 0.1568628, 0, 1, 1,
0.4731936, -0.4345646, 1.819991, 0.1647059, 0, 1, 1,
0.4878392, -1.555285, 1.563673, 0.1686275, 0, 1, 1,
0.4879105, -1.365921, 3.165286, 0.1764706, 0, 1, 1,
0.4968356, 0.5792043, -0.1183247, 0.1803922, 0, 1, 1,
0.5028931, 2.253132, 0.1548384, 0.1882353, 0, 1, 1,
0.5130705, -0.07111848, 1.410645, 0.1921569, 0, 1, 1,
0.5154842, -0.01867923, 0.6495761, 0.2, 0, 1, 1,
0.5208807, -0.3686259, 2.613928, 0.2078431, 0, 1, 1,
0.5212005, -0.563957, 1.898794, 0.2117647, 0, 1, 1,
0.5274885, -0.3216357, 4.62792, 0.2196078, 0, 1, 1,
0.5283856, 0.2538162, 1.095161, 0.2235294, 0, 1, 1,
0.5382856, 0.6868869, 0.09427287, 0.2313726, 0, 1, 1,
0.5387747, 0.6435975, 0.6142453, 0.2352941, 0, 1, 1,
0.5433967, -1.651427, 2.917314, 0.2431373, 0, 1, 1,
0.5457446, -0.9978611, 3.740694, 0.2470588, 0, 1, 1,
0.5534996, -0.1571866, 0.5491892, 0.254902, 0, 1, 1,
0.5556606, -0.4522185, 1.196131, 0.2588235, 0, 1, 1,
0.5558716, 1.451153, -0.6060461, 0.2666667, 0, 1, 1,
0.5640873, 1.701479, -1.191121, 0.2705882, 0, 1, 1,
0.5646855, -0.6855288, 2.006548, 0.2784314, 0, 1, 1,
0.564803, 2.347258, -1.278032, 0.282353, 0, 1, 1,
0.5721918, 0.6299032, 2.022099, 0.2901961, 0, 1, 1,
0.577588, 0.6557786, -1.052208, 0.2941177, 0, 1, 1,
0.5776446, -0.7594909, 2.835737, 0.3019608, 0, 1, 1,
0.5779447, -0.2293419, 1.833386, 0.3098039, 0, 1, 1,
0.5792128, -0.7536492, 2.318663, 0.3137255, 0, 1, 1,
0.5822025, 0.3790589, 2.065145, 0.3215686, 0, 1, 1,
0.5861248, -1.526542, 3.525196, 0.3254902, 0, 1, 1,
0.5870642, 0.205259, 2.20468, 0.3333333, 0, 1, 1,
0.5878865, 0.4218789, -0.06181448, 0.3372549, 0, 1, 1,
0.5909432, 0.6995236, 0.8675046, 0.345098, 0, 1, 1,
0.5945147, -1.069716, 2.414708, 0.3490196, 0, 1, 1,
0.5992321, 0.3509831, 1.061964, 0.3568628, 0, 1, 1,
0.5998856, 0.3965204, -0.9184527, 0.3607843, 0, 1, 1,
0.6017871, 0.1782357, 1.245072, 0.3686275, 0, 1, 1,
0.6034721, -0.4889774, 2.628774, 0.372549, 0, 1, 1,
0.6044635, 0.3232597, 1.016483, 0.3803922, 0, 1, 1,
0.6059442, 1.143869, -0.4987231, 0.3843137, 0, 1, 1,
0.6061566, 1.433809, 0.4631292, 0.3921569, 0, 1, 1,
0.6069527, 0.6373564, 1.169749, 0.3960784, 0, 1, 1,
0.6090851, 1.26682, 0.5756816, 0.4039216, 0, 1, 1,
0.6095496, -0.5996293, 3.345982, 0.4117647, 0, 1, 1,
0.6119229, 0.5998011, 1.352037, 0.4156863, 0, 1, 1,
0.6132219, -1.362026, 3.8951, 0.4235294, 0, 1, 1,
0.6150779, -0.1728991, 2.33266, 0.427451, 0, 1, 1,
0.617734, -0.01037723, 3.671199, 0.4352941, 0, 1, 1,
0.6212043, -0.1246777, 1.116084, 0.4392157, 0, 1, 1,
0.6269212, -1.639668, 3.795727, 0.4470588, 0, 1, 1,
0.6353711, -0.4887394, 1.665813, 0.4509804, 0, 1, 1,
0.6490366, -1.281487, 4.541339, 0.4588235, 0, 1, 1,
0.6490769, -0.00279476, 1.202593, 0.4627451, 0, 1, 1,
0.6528027, 0.5716698, -0.5816227, 0.4705882, 0, 1, 1,
0.6545264, 0.5783132, 0.4263507, 0.4745098, 0, 1, 1,
0.6589475, 1.045669, -0.05539151, 0.4823529, 0, 1, 1,
0.6665936, -0.2164351, 2.000987, 0.4862745, 0, 1, 1,
0.6688277, 1.47148, 0.6340806, 0.4941176, 0, 1, 1,
0.6698672, -0.8089724, 2.923703, 0.5019608, 0, 1, 1,
0.6712362, -1.381243, 2.97298, 0.5058824, 0, 1, 1,
0.6719158, 0.8229004, 1.144893, 0.5137255, 0, 1, 1,
0.6752434, 0.0127576, 0.274662, 0.5176471, 0, 1, 1,
0.6780258, -0.8316453, 1.559407, 0.5254902, 0, 1, 1,
0.6787667, 1.856015, 1.256673, 0.5294118, 0, 1, 1,
0.6816322, -1.337941, 2.512031, 0.5372549, 0, 1, 1,
0.6869336, 0.4276787, 1.816821, 0.5411765, 0, 1, 1,
0.6892982, 0.8250423, 0.7955627, 0.5490196, 0, 1, 1,
0.6923982, 0.8026507, 0.4484004, 0.5529412, 0, 1, 1,
0.6938467, -0.7366819, 3.599694, 0.5607843, 0, 1, 1,
0.6994503, 1.570352, -1.208458, 0.5647059, 0, 1, 1,
0.7007843, -0.3409387, 1.146825, 0.572549, 0, 1, 1,
0.703151, 1.497416, -1.079717, 0.5764706, 0, 1, 1,
0.7048684, -0.3969862, 1.195318, 0.5843138, 0, 1, 1,
0.7091039, 0.4040644, 1.873052, 0.5882353, 0, 1, 1,
0.7169221, 0.6026553, 1.361985, 0.5960785, 0, 1, 1,
0.7182413, 1.519662, 1.126935, 0.6039216, 0, 1, 1,
0.718528, 1.083718, 0.8714597, 0.6078432, 0, 1, 1,
0.725979, -0.0580354, 1.491341, 0.6156863, 0, 1, 1,
0.7263801, -0.3082304, 3.265128, 0.6196079, 0, 1, 1,
0.7311283, -0.07436997, 0.9766926, 0.627451, 0, 1, 1,
0.7337545, -1.087196, 3.021182, 0.6313726, 0, 1, 1,
0.7372918, -1.316756, 4.423826, 0.6392157, 0, 1, 1,
0.7391976, -0.09827332, 2.097801, 0.6431373, 0, 1, 1,
0.7393432, 0.8170861, 0.1494153, 0.6509804, 0, 1, 1,
0.7409152, -0.7668546, 1.857739, 0.654902, 0, 1, 1,
0.7411084, -0.7885043, 3.95263, 0.6627451, 0, 1, 1,
0.7621478, 0.7668872, -0.573695, 0.6666667, 0, 1, 1,
0.7714289, -0.7672397, 0.358156, 0.6745098, 0, 1, 1,
0.77424, 1.634761, -1.059881, 0.6784314, 0, 1, 1,
0.7784093, 0.1478092, 0.1650175, 0.6862745, 0, 1, 1,
0.7796777, 0.9658832, 0.5828141, 0.6901961, 0, 1, 1,
0.786225, 0.119467, -0.2311098, 0.6980392, 0, 1, 1,
0.7885845, 0.2300527, 0.5523479, 0.7058824, 0, 1, 1,
0.7896884, -0.01066403, -0.8607698, 0.7098039, 0, 1, 1,
0.7923165, -0.3741312, 1.748346, 0.7176471, 0, 1, 1,
0.7935081, -1.818966, 1.680315, 0.7215686, 0, 1, 1,
0.7992895, -1.047351, 3.221664, 0.7294118, 0, 1, 1,
0.7993159, 0.7248769, 1.97819, 0.7333333, 0, 1, 1,
0.8034148, -1.469947, 3.455526, 0.7411765, 0, 1, 1,
0.8036974, -1.260089, 4.477914, 0.7450981, 0, 1, 1,
0.8046349, -0.2889408, 2.388449, 0.7529412, 0, 1, 1,
0.8062726, 1.872127, -1.887266, 0.7568628, 0, 1, 1,
0.8075722, -0.112284, 1.580807, 0.7647059, 0, 1, 1,
0.8080361, 0.2308031, 1.145398, 0.7686275, 0, 1, 1,
0.8080686, 0.1596864, 1.846437, 0.7764706, 0, 1, 1,
0.8097069, -0.9879745, 2.16176, 0.7803922, 0, 1, 1,
0.8097761, -1.978541, 1.556197, 0.7882353, 0, 1, 1,
0.8115712, 1.010327, 2.910434, 0.7921569, 0, 1, 1,
0.8115915, 0.5980762, 0.8001523, 0.8, 0, 1, 1,
0.8145135, -2.105236, 1.317697, 0.8078431, 0, 1, 1,
0.8198721, 0.0440425, 1.805621, 0.8117647, 0, 1, 1,
0.8242244, -0.8385491, 6.555887, 0.8196079, 0, 1, 1,
0.8449275, 2.184952, 1.884066, 0.8235294, 0, 1, 1,
0.8496237, -0.2975721, 1.020081, 0.8313726, 0, 1, 1,
0.8505969, 0.430759, 2.631752, 0.8352941, 0, 1, 1,
0.8549303, -0.2098945, 1.211541, 0.8431373, 0, 1, 1,
0.8556865, -0.792477, 2.205694, 0.8470588, 0, 1, 1,
0.8647635, -0.05357129, 2.043905, 0.854902, 0, 1, 1,
0.8649766, -0.9291462, 1.814663, 0.8588235, 0, 1, 1,
0.8800825, -0.7947205, 1.866723, 0.8666667, 0, 1, 1,
0.8870611, 0.1099062, 1.300941, 0.8705882, 0, 1, 1,
0.8872285, -0.8150365, 4.223499, 0.8784314, 0, 1, 1,
0.8879865, -0.1689788, 0.8093311, 0.8823529, 0, 1, 1,
0.8882412, 0.7091752, 0.9074214, 0.8901961, 0, 1, 1,
0.8897214, 2.135881, -2.213555, 0.8941177, 0, 1, 1,
0.8952289, 0.5381424, -0.04930808, 0.9019608, 0, 1, 1,
0.8977327, -1.042465, 2.215448, 0.9098039, 0, 1, 1,
0.9124792, -0.06273485, 3.347349, 0.9137255, 0, 1, 1,
0.9125651, -3.577359, 2.951377, 0.9215686, 0, 1, 1,
0.912825, 0.6090395, 1.163405, 0.9254902, 0, 1, 1,
0.9170197, 0.2003817, 2.283757, 0.9333333, 0, 1, 1,
0.9218398, 0.1618053, 1.594765, 0.9372549, 0, 1, 1,
0.9225448, -0.6944489, 1.941341, 0.945098, 0, 1, 1,
0.9233636, 0.9808716, 2.529133, 0.9490196, 0, 1, 1,
0.923577, -0.3649145, 4.213223, 0.9568627, 0, 1, 1,
0.9327457, 0.8541629, 0.8277262, 0.9607843, 0, 1, 1,
0.9352773, -0.1630679, 1.702396, 0.9686275, 0, 1, 1,
0.9433809, -0.2243525, 0.7225385, 0.972549, 0, 1, 1,
0.9503274, 0.411194, 0.7304885, 0.9803922, 0, 1, 1,
0.9520065, -0.8968211, 3.12514, 0.9843137, 0, 1, 1,
0.9571469, 0.7972385, 0.4915903, 0.9921569, 0, 1, 1,
0.9667828, -0.3069833, 3.275842, 0.9960784, 0, 1, 1,
0.9723326, -0.7318717, 2.169029, 1, 0, 0.9960784, 1,
0.9731334, 0.1116133, -1.009946, 1, 0, 0.9882353, 1,
0.974315, -0.3945985, 2.759609, 1, 0, 0.9843137, 1,
0.9763098, 1.0172, 1.497309, 1, 0, 0.9764706, 1,
0.9784117, 0.5412973, 1.46982, 1, 0, 0.972549, 1,
0.9787022, -0.3904637, 1.242255, 1, 0, 0.9647059, 1,
0.9788502, -0.7817966, 1.30826, 1, 0, 0.9607843, 1,
0.9891483, 0.1295034, 2.64635, 1, 0, 0.9529412, 1,
0.9937119, 0.8945915, 1.226244, 1, 0, 0.9490196, 1,
0.9940847, 0.08465335, 1.66935, 1, 0, 0.9411765, 1,
0.9974697, 0.03639181, 2.212961, 1, 0, 0.9372549, 1,
1.005848, -0.3999189, 2.59324, 1, 0, 0.9294118, 1,
1.006664, -0.5600829, 3.51787, 1, 0, 0.9254902, 1,
1.008611, 0.2005338, 2.105371, 1, 0, 0.9176471, 1,
1.023196, -1.054683, 1.725438, 1, 0, 0.9137255, 1,
1.0235, 0.6457919, -0.02302823, 1, 0, 0.9058824, 1,
1.024169, -0.4821117, 1.107168, 1, 0, 0.9019608, 1,
1.024534, -0.4226556, 1.916521, 1, 0, 0.8941177, 1,
1.033133, -0.02114824, 0.5620437, 1, 0, 0.8862745, 1,
1.034129, -1.851539, 2.741527, 1, 0, 0.8823529, 1,
1.034327, 0.2491413, -0.05752053, 1, 0, 0.8745098, 1,
1.038279, -0.670471, 1.293955, 1, 0, 0.8705882, 1,
1.046261, 0.6440157, 0.8744522, 1, 0, 0.8627451, 1,
1.050542, 0.5710446, 1.49297, 1, 0, 0.8588235, 1,
1.052096, 0.1472117, 2.910635, 1, 0, 0.8509804, 1,
1.053056, -0.3498493, 2.868488, 1, 0, 0.8470588, 1,
1.06184, -0.2284496, 2.633733, 1, 0, 0.8392157, 1,
1.071533, -1.752031, 0.9888903, 1, 0, 0.8352941, 1,
1.07639, -1.503849, 1.544071, 1, 0, 0.827451, 1,
1.077566, 0.630652, 0.4444567, 1, 0, 0.8235294, 1,
1.077845, -0.1340215, 1.305439, 1, 0, 0.8156863, 1,
1.084128, 1.992905, -0.3428473, 1, 0, 0.8117647, 1,
1.085695, 0.1481007, 1.571969, 1, 0, 0.8039216, 1,
1.087992, 0.3696126, 0.237798, 1, 0, 0.7960784, 1,
1.09174, 0.6697876, 1.324948, 1, 0, 0.7921569, 1,
1.091755, -0.6966311, 2.204486, 1, 0, 0.7843137, 1,
1.098226, 0.06638309, 3.955449, 1, 0, 0.7803922, 1,
1.104364, -1.032659, 1.800959, 1, 0, 0.772549, 1,
1.105077, -0.9119205, 0.482958, 1, 0, 0.7686275, 1,
1.111906, -0.3846222, 1.218917, 1, 0, 0.7607843, 1,
1.114254, 1.404243, 0.5132507, 1, 0, 0.7568628, 1,
1.120754, -0.3896173, 1.33239, 1, 0, 0.7490196, 1,
1.12643, 1.122372, 2.567042, 1, 0, 0.7450981, 1,
1.149277, 0.03288436, 1.255899, 1, 0, 0.7372549, 1,
1.150279, -0.1554276, 1.108098, 1, 0, 0.7333333, 1,
1.151919, -1.511565, 2.893948, 1, 0, 0.7254902, 1,
1.156384, 0.5192663, 1.130848, 1, 0, 0.7215686, 1,
1.159162, -0.3849145, 1.14347, 1, 0, 0.7137255, 1,
1.160807, -0.2470654, 3.228354, 1, 0, 0.7098039, 1,
1.170259, -0.2824865, 1.187557, 1, 0, 0.7019608, 1,
1.172194, -1.582809, 2.929936, 1, 0, 0.6941177, 1,
1.181382, 1.155272, 0.1265946, 1, 0, 0.6901961, 1,
1.18496, -0.6259816, 3.988707, 1, 0, 0.682353, 1,
1.19309, -0.5887408, 0.8924676, 1, 0, 0.6784314, 1,
1.193392, 1.192027, 0.4445544, 1, 0, 0.6705883, 1,
1.196539, -0.432147, 1.204537, 1, 0, 0.6666667, 1,
1.201824, -0.131868, 2.383936, 1, 0, 0.6588235, 1,
1.203323, -0.2815441, 0.1240721, 1, 0, 0.654902, 1,
1.207795, -0.1286117, 0.6782534, 1, 0, 0.6470588, 1,
1.214409, 2.026115, -0.7439768, 1, 0, 0.6431373, 1,
1.216108, -0.569429, 2.141323, 1, 0, 0.6352941, 1,
1.223077, 0.5957442, 1.667248, 1, 0, 0.6313726, 1,
1.224352, -0.4895154, 1.083824, 1, 0, 0.6235294, 1,
1.224839, -0.483992, 1.837641, 1, 0, 0.6196079, 1,
1.23269, -0.9220977, 3.360861, 1, 0, 0.6117647, 1,
1.234294, -1.089081, 1.161403, 1, 0, 0.6078432, 1,
1.236484, -0.6018278, 2.102562, 1, 0, 0.6, 1,
1.240488, -0.6379297, 3.522988, 1, 0, 0.5921569, 1,
1.241605, -0.06111506, 2.743523, 1, 0, 0.5882353, 1,
1.244913, 0.06754091, 1.661039, 1, 0, 0.5803922, 1,
1.252759, -0.6637627, 2.991067, 1, 0, 0.5764706, 1,
1.267561, 1.291912, 1.20882, 1, 0, 0.5686275, 1,
1.274369, -2.201233, 2.714342, 1, 0, 0.5647059, 1,
1.283957, 0.5873657, -0.514202, 1, 0, 0.5568628, 1,
1.285011, -0.4481159, 2.449725, 1, 0, 0.5529412, 1,
1.303028, 1.240182, 2.637352, 1, 0, 0.5450981, 1,
1.30455, 0.1203503, 0.9274325, 1, 0, 0.5411765, 1,
1.312481, -0.321382, 0.4484079, 1, 0, 0.5333334, 1,
1.314743, 0.2358763, 2.046751, 1, 0, 0.5294118, 1,
1.316947, 1.070157, -0.0009976553, 1, 0, 0.5215687, 1,
1.3442, 0.7552425, -0.8889586, 1, 0, 0.5176471, 1,
1.344284, 0.9426471, 1.804049, 1, 0, 0.509804, 1,
1.346148, -1.036667, 2.989744, 1, 0, 0.5058824, 1,
1.362167, -0.1789521, 2.301024, 1, 0, 0.4980392, 1,
1.367479, -2.052067, 1.682268, 1, 0, 0.4901961, 1,
1.375055, 1.384495, -0.5259311, 1, 0, 0.4862745, 1,
1.389523, 1.374936, 1.951518, 1, 0, 0.4784314, 1,
1.392173, -1.339832, 0.7424678, 1, 0, 0.4745098, 1,
1.418217, 0.9148691, 2.672812, 1, 0, 0.4666667, 1,
1.421362, 1.417025, 0.2475407, 1, 0, 0.4627451, 1,
1.434993, -0.4544677, 3.161642, 1, 0, 0.454902, 1,
1.436634, -1.307694, 2.206008, 1, 0, 0.4509804, 1,
1.438211, 0.3114952, 0.2062956, 1, 0, 0.4431373, 1,
1.43909, -0.4278942, 1.218902, 1, 0, 0.4392157, 1,
1.446414, -0.8960071, 1.995972, 1, 0, 0.4313726, 1,
1.450465, 0.01920447, 2.022749, 1, 0, 0.427451, 1,
1.466232, 0.9419075, 0.6907119, 1, 0, 0.4196078, 1,
1.471725, 0.6524097, 0.3616724, 1, 0, 0.4156863, 1,
1.479566, -0.07029964, 1.935279, 1, 0, 0.4078431, 1,
1.479586, 0.05531992, 2.839233, 1, 0, 0.4039216, 1,
1.481397, -0.7710044, 0.5966963, 1, 0, 0.3960784, 1,
1.485268, -0.03185761, 1.945933, 1, 0, 0.3882353, 1,
1.503154, 1.021174, 0.8397297, 1, 0, 0.3843137, 1,
1.509078, 0.2339336, 0.695976, 1, 0, 0.3764706, 1,
1.519737, 2.978275, 1.611614, 1, 0, 0.372549, 1,
1.520215, 0.2379464, 1.124572, 1, 0, 0.3647059, 1,
1.529873, -0.4524847, 1.665189, 1, 0, 0.3607843, 1,
1.537715, -1.576552, 4.551562, 1, 0, 0.3529412, 1,
1.539902, 1.121054, 2.490557, 1, 0, 0.3490196, 1,
1.56995, -0.8823367, 3.450977, 1, 0, 0.3411765, 1,
1.572265, -1.373942, 1.799063, 1, 0, 0.3372549, 1,
1.580137, 1.860826, -1.307976, 1, 0, 0.3294118, 1,
1.582384, -0.7531247, 0.4355729, 1, 0, 0.3254902, 1,
1.620849, 0.8856934, 0.2835598, 1, 0, 0.3176471, 1,
1.629879, -0.2234211, 2.978583, 1, 0, 0.3137255, 1,
1.637806, 1.278127, 0.470685, 1, 0, 0.3058824, 1,
1.639468, 0.1942318, 0.3683075, 1, 0, 0.2980392, 1,
1.640158, 1.057773, 2.946936, 1, 0, 0.2941177, 1,
1.6441, -0.2334388, 1.678793, 1, 0, 0.2862745, 1,
1.647964, 1.067496, -0.2421066, 1, 0, 0.282353, 1,
1.654647, 1.325864, 0.2817352, 1, 0, 0.2745098, 1,
1.65669, -1.18365, 2.461617, 1, 0, 0.2705882, 1,
1.66513, 0.09177003, 3.888942, 1, 0, 0.2627451, 1,
1.668494, 1.176576, 2.893068, 1, 0, 0.2588235, 1,
1.669562, -0.4918668, 1.820308, 1, 0, 0.2509804, 1,
1.67359, -0.3472806, 1.811625, 1, 0, 0.2470588, 1,
1.678618, 1.025629, 0.1809508, 1, 0, 0.2392157, 1,
1.698404, -1.248287, 2.562897, 1, 0, 0.2352941, 1,
1.701787, -0.7234197, 0.5253453, 1, 0, 0.227451, 1,
1.71864, -1.50013, 3.499241, 1, 0, 0.2235294, 1,
1.722283, 0.5181213, -0.09297235, 1, 0, 0.2156863, 1,
1.731864, -0.9575749, 1.39106, 1, 0, 0.2117647, 1,
1.744401, -0.2715192, 1.81795, 1, 0, 0.2039216, 1,
1.747765, 0.4983219, 1.183996, 1, 0, 0.1960784, 1,
1.763239, -1.305472, 1.07076, 1, 0, 0.1921569, 1,
1.790792, 0.2697402, 1.074021, 1, 0, 0.1843137, 1,
1.795857, -0.4186219, 3.251716, 1, 0, 0.1803922, 1,
1.807076, -0.4571932, 0.03156919, 1, 0, 0.172549, 1,
1.807469, -1.053494, 2.311877, 1, 0, 0.1686275, 1,
1.816491, -0.9550233, 2.576168, 1, 0, 0.1607843, 1,
1.828979, 0.4099806, 0.4926921, 1, 0, 0.1568628, 1,
1.850916, -1.494854, -0.4693182, 1, 0, 0.1490196, 1,
1.864762, 1.728825, 2.664061, 1, 0, 0.145098, 1,
1.873495, -2.113953, 3.922607, 1, 0, 0.1372549, 1,
1.890462, 1.034374, 1.418248, 1, 0, 0.1333333, 1,
1.8933, 2.792405, 0.1834376, 1, 0, 0.1254902, 1,
1.903501, -0.7829664, 1.360629, 1, 0, 0.1215686, 1,
1.904122, -2.378624, 4.640388, 1, 0, 0.1137255, 1,
1.937169, -2.552595, 3.249265, 1, 0, 0.1098039, 1,
1.963594, 0.6881123, 2.062933, 1, 0, 0.1019608, 1,
1.998196, 0.1806158, 2.165262, 1, 0, 0.09411765, 1,
2.007658, 1.516268, 2.624357, 1, 0, 0.09019608, 1,
2.01473, 1.672254, 1.93277, 1, 0, 0.08235294, 1,
2.041334, 0.4549841, 1.029093, 1, 0, 0.07843138, 1,
2.048491, -0.08550409, 2.263425, 1, 0, 0.07058824, 1,
2.097499, -1.32779, 2.447269, 1, 0, 0.06666667, 1,
2.165715, -1.918476, 1.938997, 1, 0, 0.05882353, 1,
2.167063, 0.5060854, 3.625182, 1, 0, 0.05490196, 1,
2.197067, 0.07555572, 1.831633, 1, 0, 0.04705882, 1,
2.236092, -0.4066791, 1.524817, 1, 0, 0.04313726, 1,
2.25148, -0.01740703, 1.146047, 1, 0, 0.03529412, 1,
2.326596, -0.6233662, 0.7263607, 1, 0, 0.03137255, 1,
2.332855, 1.459208, 0.4637419, 1, 0, 0.02352941, 1,
2.429652, 0.7885197, 3.089263, 1, 0, 0.01960784, 1,
2.743129, 1.115499, 2.139341, 1, 0, 0.01176471, 1,
3.073429, -0.4726747, 1.550834, 1, 0, 0.007843138, 1
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
-0.1300745, -4.688539, -7.690152, 0, -0.5, 0.5, 0.5,
-0.1300745, -4.688539, -7.690152, 1, -0.5, 0.5, 0.5,
-0.1300745, -4.688539, -7.690152, 1, 1.5, 0.5, 0.5,
-0.1300745, -4.688539, -7.690152, 0, 1.5, 0.5, 0.5
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
-4.419566, -0.2995418, -7.690152, 0, -0.5, 0.5, 0.5,
-4.419566, -0.2995418, -7.690152, 1, -0.5, 0.5, 0.5,
-4.419566, -0.2995418, -7.690152, 1, 1.5, 0.5, 0.5,
-4.419566, -0.2995418, -7.690152, 0, 1.5, 0.5, 0.5
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
-4.419566, -4.688539, 0.4652336, 0, -0.5, 0.5, 0.5,
-4.419566, -4.688539, 0.4652336, 1, -0.5, 0.5, 0.5,
-4.419566, -4.688539, 0.4652336, 1, 1.5, 0.5, 0.5,
-4.419566, -4.688539, 0.4652336, 0, 1.5, 0.5, 0.5
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
-3, -3.675693, -5.80814,
3, -3.675693, -5.80814,
-3, -3.675693, -5.80814,
-3, -3.844501, -6.121809,
-2, -3.675693, -5.80814,
-2, -3.844501, -6.121809,
-1, -3.675693, -5.80814,
-1, -3.844501, -6.121809,
0, -3.675693, -5.80814,
0, -3.844501, -6.121809,
1, -3.675693, -5.80814,
1, -3.844501, -6.121809,
2, -3.675693, -5.80814,
2, -3.844501, -6.121809,
3, -3.675693, -5.80814,
3, -3.844501, -6.121809
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
-3, -4.182116, -6.749146, 0, -0.5, 0.5, 0.5,
-3, -4.182116, -6.749146, 1, -0.5, 0.5, 0.5,
-3, -4.182116, -6.749146, 1, 1.5, 0.5, 0.5,
-3, -4.182116, -6.749146, 0, 1.5, 0.5, 0.5,
-2, -4.182116, -6.749146, 0, -0.5, 0.5, 0.5,
-2, -4.182116, -6.749146, 1, -0.5, 0.5, 0.5,
-2, -4.182116, -6.749146, 1, 1.5, 0.5, 0.5,
-2, -4.182116, -6.749146, 0, 1.5, 0.5, 0.5,
-1, -4.182116, -6.749146, 0, -0.5, 0.5, 0.5,
-1, -4.182116, -6.749146, 1, -0.5, 0.5, 0.5,
-1, -4.182116, -6.749146, 1, 1.5, 0.5, 0.5,
-1, -4.182116, -6.749146, 0, 1.5, 0.5, 0.5,
0, -4.182116, -6.749146, 0, -0.5, 0.5, 0.5,
0, -4.182116, -6.749146, 1, -0.5, 0.5, 0.5,
0, -4.182116, -6.749146, 1, 1.5, 0.5, 0.5,
0, -4.182116, -6.749146, 0, 1.5, 0.5, 0.5,
1, -4.182116, -6.749146, 0, -0.5, 0.5, 0.5,
1, -4.182116, -6.749146, 1, -0.5, 0.5, 0.5,
1, -4.182116, -6.749146, 1, 1.5, 0.5, 0.5,
1, -4.182116, -6.749146, 0, 1.5, 0.5, 0.5,
2, -4.182116, -6.749146, 0, -0.5, 0.5, 0.5,
2, -4.182116, -6.749146, 1, -0.5, 0.5, 0.5,
2, -4.182116, -6.749146, 1, 1.5, 0.5, 0.5,
2, -4.182116, -6.749146, 0, 1.5, 0.5, 0.5,
3, -4.182116, -6.749146, 0, -0.5, 0.5, 0.5,
3, -4.182116, -6.749146, 1, -0.5, 0.5, 0.5,
3, -4.182116, -6.749146, 1, 1.5, 0.5, 0.5,
3, -4.182116, -6.749146, 0, 1.5, 0.5, 0.5
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
-3.429683, -3, -5.80814,
-3.429683, 2, -5.80814,
-3.429683, -3, -5.80814,
-3.594664, -3, -6.121809,
-3.429683, -2, -5.80814,
-3.594664, -2, -6.121809,
-3.429683, -1, -5.80814,
-3.594664, -1, -6.121809,
-3.429683, 0, -5.80814,
-3.594664, 0, -6.121809,
-3.429683, 1, -5.80814,
-3.594664, 1, -6.121809,
-3.429683, 2, -5.80814,
-3.594664, 2, -6.121809
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
-3.924625, -3, -6.749146, 0, -0.5, 0.5, 0.5,
-3.924625, -3, -6.749146, 1, -0.5, 0.5, 0.5,
-3.924625, -3, -6.749146, 1, 1.5, 0.5, 0.5,
-3.924625, -3, -6.749146, 0, 1.5, 0.5, 0.5,
-3.924625, -2, -6.749146, 0, -0.5, 0.5, 0.5,
-3.924625, -2, -6.749146, 1, -0.5, 0.5, 0.5,
-3.924625, -2, -6.749146, 1, 1.5, 0.5, 0.5,
-3.924625, -2, -6.749146, 0, 1.5, 0.5, 0.5,
-3.924625, -1, -6.749146, 0, -0.5, 0.5, 0.5,
-3.924625, -1, -6.749146, 1, -0.5, 0.5, 0.5,
-3.924625, -1, -6.749146, 1, 1.5, 0.5, 0.5,
-3.924625, -1, -6.749146, 0, 1.5, 0.5, 0.5,
-3.924625, 0, -6.749146, 0, -0.5, 0.5, 0.5,
-3.924625, 0, -6.749146, 1, -0.5, 0.5, 0.5,
-3.924625, 0, -6.749146, 1, 1.5, 0.5, 0.5,
-3.924625, 0, -6.749146, 0, 1.5, 0.5, 0.5,
-3.924625, 1, -6.749146, 0, -0.5, 0.5, 0.5,
-3.924625, 1, -6.749146, 1, -0.5, 0.5, 0.5,
-3.924625, 1, -6.749146, 1, 1.5, 0.5, 0.5,
-3.924625, 1, -6.749146, 0, 1.5, 0.5, 0.5,
-3.924625, 2, -6.749146, 0, -0.5, 0.5, 0.5,
-3.924625, 2, -6.749146, 1, -0.5, 0.5, 0.5,
-3.924625, 2, -6.749146, 1, 1.5, 0.5, 0.5,
-3.924625, 2, -6.749146, 0, 1.5, 0.5, 0.5
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
-3.429683, -3.675693, -4,
-3.429683, -3.675693, 6,
-3.429683, -3.675693, -4,
-3.594664, -3.844501, -4,
-3.429683, -3.675693, -2,
-3.594664, -3.844501, -2,
-3.429683, -3.675693, 0,
-3.594664, -3.844501, 0,
-3.429683, -3.675693, 2,
-3.594664, -3.844501, 2,
-3.429683, -3.675693, 4,
-3.594664, -3.844501, 4,
-3.429683, -3.675693, 6,
-3.594664, -3.844501, 6
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
"4",
"6"
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
-3.924625, -4.182116, -4, 0, -0.5, 0.5, 0.5,
-3.924625, -4.182116, -4, 1, -0.5, 0.5, 0.5,
-3.924625, -4.182116, -4, 1, 1.5, 0.5, 0.5,
-3.924625, -4.182116, -4, 0, 1.5, 0.5, 0.5,
-3.924625, -4.182116, -2, 0, -0.5, 0.5, 0.5,
-3.924625, -4.182116, -2, 1, -0.5, 0.5, 0.5,
-3.924625, -4.182116, -2, 1, 1.5, 0.5, 0.5,
-3.924625, -4.182116, -2, 0, 1.5, 0.5, 0.5,
-3.924625, -4.182116, 0, 0, -0.5, 0.5, 0.5,
-3.924625, -4.182116, 0, 1, -0.5, 0.5, 0.5,
-3.924625, -4.182116, 0, 1, 1.5, 0.5, 0.5,
-3.924625, -4.182116, 0, 0, 1.5, 0.5, 0.5,
-3.924625, -4.182116, 2, 0, -0.5, 0.5, 0.5,
-3.924625, -4.182116, 2, 1, -0.5, 0.5, 0.5,
-3.924625, -4.182116, 2, 1, 1.5, 0.5, 0.5,
-3.924625, -4.182116, 2, 0, 1.5, 0.5, 0.5,
-3.924625, -4.182116, 4, 0, -0.5, 0.5, 0.5,
-3.924625, -4.182116, 4, 1, -0.5, 0.5, 0.5,
-3.924625, -4.182116, 4, 1, 1.5, 0.5, 0.5,
-3.924625, -4.182116, 4, 0, 1.5, 0.5, 0.5,
-3.924625, -4.182116, 6, 0, -0.5, 0.5, 0.5,
-3.924625, -4.182116, 6, 1, -0.5, 0.5, 0.5,
-3.924625, -4.182116, 6, 1, 1.5, 0.5, 0.5,
-3.924625, -4.182116, 6, 0, 1.5, 0.5, 0.5
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
-3.429683, -3.675693, -5.80814,
-3.429683, 3.07661, -5.80814,
-3.429683, -3.675693, 6.738607,
-3.429683, 3.07661, 6.738607,
-3.429683, -3.675693, -5.80814,
-3.429683, -3.675693, 6.738607,
-3.429683, 3.07661, -5.80814,
-3.429683, 3.07661, 6.738607,
-3.429683, -3.675693, -5.80814,
3.169534, -3.675693, -5.80814,
-3.429683, -3.675693, 6.738607,
3.169534, -3.675693, 6.738607,
-3.429683, 3.07661, -5.80814,
3.169534, 3.07661, -5.80814,
-3.429683, 3.07661, 6.738607,
3.169534, 3.07661, 6.738607,
3.169534, -3.675693, -5.80814,
3.169534, 3.07661, -5.80814,
3.169534, -3.675693, 6.738607,
3.169534, 3.07661, 6.738607,
3.169534, -3.675693, -5.80814,
3.169534, -3.675693, 6.738607,
3.169534, 3.07661, -5.80814,
3.169534, 3.07661, 6.738607
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
var radius = 8.384755;
var distance = 37.30472;
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
mvMatrix.translate( 0.1300745, 0.2995418, -0.4652336 );
mvMatrix.scale( 1.373763, 1.342618, 0.7225588 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.30472);
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
tetrahydrophthalimid<-read.table("tetrahydrophthalimid.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-tetrahydrophthalimid$V2
```

```
## Error in eval(expr, envir, enclos): object 'tetrahydrophthalimid' not found
```

```r
y<-tetrahydrophthalimid$V3
```

```
## Error in eval(expr, envir, enclos): object 'tetrahydrophthalimid' not found
```

```r
z<-tetrahydrophthalimid$V4
```

```
## Error in eval(expr, envir, enclos): object 'tetrahydrophthalimid' not found
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
-3.333578, -0.6208473, -3.240711, 0, 0, 1, 1, 1,
-2.911061, 2.160148, -0.4767186, 1, 0, 0, 1, 1,
-2.821803, -0.9449198, -0.241621, 1, 0, 0, 1, 1,
-2.529492, 0.5202048, -0.8281559, 1, 0, 0, 1, 1,
-2.409497, -1.914119, -3.869056, 1, 0, 0, 1, 1,
-2.37504, 0.7875115, -0.839385, 1, 0, 0, 1, 1,
-2.354751, 0.6798161, -0.4446958, 0, 0, 0, 1, 1,
-2.263242, 0.9409196, -0.8367455, 0, 0, 0, 1, 1,
-2.243967, 1.382353, -1.408944, 0, 0, 0, 1, 1,
-2.153967, 0.7402002, -0.5797911, 0, 0, 0, 1, 1,
-2.152577, 0.06081181, 2.197439, 0, 0, 0, 1, 1,
-2.151859, 0.558619, -1.312415, 0, 0, 0, 1, 1,
-2.128375, -0.5816898, -0.9877129, 0, 0, 0, 1, 1,
-2.106898, 1.424688, -1.671073, 1, 1, 1, 1, 1,
-2.039171, -1.317089, -2.281066, 1, 1, 1, 1, 1,
-2.012061, -0.2989543, -0.7772844, 1, 1, 1, 1, 1,
-1.996415, -0.3610041, -1.798361, 1, 1, 1, 1, 1,
-1.975066, -0.6169662, -2.285163, 1, 1, 1, 1, 1,
-1.964243, 0.4455714, -1.641824, 1, 1, 1, 1, 1,
-1.941159, 0.9068503, -0.8088123, 1, 1, 1, 1, 1,
-1.931365, 0.6262031, -1.207798, 1, 1, 1, 1, 1,
-1.877205, 0.2316839, -2.975547, 1, 1, 1, 1, 1,
-1.844524, -0.06350186, -2.614327, 1, 1, 1, 1, 1,
-1.802313, 0.01746211, -2.333346, 1, 1, 1, 1, 1,
-1.788036, 0.3392656, -1.280851, 1, 1, 1, 1, 1,
-1.757206, 0.1866345, -1.635494, 1, 1, 1, 1, 1,
-1.752574, 0.5007901, -1.971217, 1, 1, 1, 1, 1,
-1.730799, 0.9829168, -1.545506, 1, 1, 1, 1, 1,
-1.730389, -0.4768216, -2.955076, 0, 0, 1, 1, 1,
-1.714145, 0.9665586, -1.132153, 1, 0, 0, 1, 1,
-1.709216, -0.5105819, -2.23908, 1, 0, 0, 1, 1,
-1.700316, -1.840438, -4.796508, 1, 0, 0, 1, 1,
-1.695419, -1.739896, -1.654671, 1, 0, 0, 1, 1,
-1.693359, 1.791606, -0.1878773, 1, 0, 0, 1, 1,
-1.685521, 0.2985708, -2.589057, 0, 0, 0, 1, 1,
-1.655087, -0.8156521, -1.871686, 0, 0, 0, 1, 1,
-1.637368, 0.908223, -0.6421362, 0, 0, 0, 1, 1,
-1.627123, 1.382846, -2.552253, 0, 0, 0, 1, 1,
-1.584613, 0.6640574, -1.131216, 0, 0, 0, 1, 1,
-1.584137, -0.1408236, -0.8989497, 0, 0, 0, 1, 1,
-1.570624, -0.5357763, -2.326344, 0, 0, 0, 1, 1,
-1.569021, -1.300316, -3.102458, 1, 1, 1, 1, 1,
-1.564135, -0.04768435, -1.494555, 1, 1, 1, 1, 1,
-1.563035, 0.5736722, -1.299778, 1, 1, 1, 1, 1,
-1.561664, -1.200354, -2.792182, 1, 1, 1, 1, 1,
-1.560374, 0.5972071, -1.399524, 1, 1, 1, 1, 1,
-1.549124, -1.889071, -2.086508, 1, 1, 1, 1, 1,
-1.54452, -1.119215, -2.180146, 1, 1, 1, 1, 1,
-1.536109, -1.581377, -2.271653, 1, 1, 1, 1, 1,
-1.526442, 1.054987, 0.1869133, 1, 1, 1, 1, 1,
-1.517911, -0.6811014, -3.058332, 1, 1, 1, 1, 1,
-1.513677, -1.002355, -3.225731, 1, 1, 1, 1, 1,
-1.507318, 0.1647267, -2.995477, 1, 1, 1, 1, 1,
-1.503137, -0.5343612, -1.174461, 1, 1, 1, 1, 1,
-1.496447, -0.7429129, -1.400426, 1, 1, 1, 1, 1,
-1.493149, -1.214619, -2.909642, 1, 1, 1, 1, 1,
-1.490463, 0.1388355, -0.7164709, 0, 0, 1, 1, 1,
-1.479237, 2.375448, -0.8600187, 1, 0, 0, 1, 1,
-1.478119, 0.1504548, -2.857464, 1, 0, 0, 1, 1,
-1.476994, -0.4719809, -0.7662587, 1, 0, 0, 1, 1,
-1.463675, -0.005721715, -1.473718, 1, 0, 0, 1, 1,
-1.459947, 0.2902368, -0.9469481, 1, 0, 0, 1, 1,
-1.458324, 1.905226, 0.580767, 0, 0, 0, 1, 1,
-1.452348, -0.409334, -1.898212, 0, 0, 0, 1, 1,
-1.450503, -1.683222, -1.910295, 0, 0, 0, 1, 1,
-1.449523, -0.5050777, -4.012552, 0, 0, 0, 1, 1,
-1.437739, 1.263596, -1.439228, 0, 0, 0, 1, 1,
-1.428709, 0.2037247, -1.130907, 0, 0, 0, 1, 1,
-1.427004, -0.5115028, -2.97162, 0, 0, 0, 1, 1,
-1.419028, -0.04084626, -1.391868, 1, 1, 1, 1, 1,
-1.417925, -0.7000144, -3.670548, 1, 1, 1, 1, 1,
-1.416312, 0.002809518, -0.4556974, 1, 1, 1, 1, 1,
-1.414228, -0.9956731, -2.941041, 1, 1, 1, 1, 1,
-1.412083, 0.8396645, -1.780756, 1, 1, 1, 1, 1,
-1.38162, 0.9577974, -2.076171, 1, 1, 1, 1, 1,
-1.37855, -1.85213, -2.557185, 1, 1, 1, 1, 1,
-1.376433, 1.011938, -1.138662, 1, 1, 1, 1, 1,
-1.362539, -0.135568, -1.173982, 1, 1, 1, 1, 1,
-1.347711, 0.260717, -0.5218773, 1, 1, 1, 1, 1,
-1.342363, -0.7813528, -1.496059, 1, 1, 1, 1, 1,
-1.339989, -1.614884, -2.360948, 1, 1, 1, 1, 1,
-1.335534, -0.4183477, 0.005015338, 1, 1, 1, 1, 1,
-1.335001, 1.350208, -1.22813, 1, 1, 1, 1, 1,
-1.329169, 0.120687, -0.6311681, 1, 1, 1, 1, 1,
-1.325453, -0.3892878, -1.972225, 0, 0, 1, 1, 1,
-1.324554, -0.01470056, -2.147763, 1, 0, 0, 1, 1,
-1.320691, 1.047401, 0.7276077, 1, 0, 0, 1, 1,
-1.318806, 0.8768566, -1.164434, 1, 0, 0, 1, 1,
-1.310042, -0.7775705, -4.099209, 1, 0, 0, 1, 1,
-1.303438, -1.526278, -1.522728, 1, 0, 0, 1, 1,
-1.300805, 0.170938, -1.117493, 0, 0, 0, 1, 1,
-1.292196, -0.2621098, -1.692495, 0, 0, 0, 1, 1,
-1.290238, 0.8798775, -0.4534842, 0, 0, 0, 1, 1,
-1.281215, 0.4115481, 0.8261707, 0, 0, 0, 1, 1,
-1.278231, 0.3056403, -0.8803406, 0, 0, 0, 1, 1,
-1.274745, -0.8276459, -3.292404, 0, 0, 0, 1, 1,
-1.273184, -0.7925131, -1.276804, 0, 0, 0, 1, 1,
-1.265956, -0.3920338, -1.523328, 1, 1, 1, 1, 1,
-1.264421, 0.1238773, -2.920688, 1, 1, 1, 1, 1,
-1.249947, 0.5422089, -0.8868723, 1, 1, 1, 1, 1,
-1.248773, -0.5573898, -1.769891, 1, 1, 1, 1, 1,
-1.233811, -0.7637236, -0.2002664, 1, 1, 1, 1, 1,
-1.232848, -0.530204, -2.511112, 1, 1, 1, 1, 1,
-1.231484, -0.4249496, -1.923022, 1, 1, 1, 1, 1,
-1.230531, 0.3045747, -1.914672, 1, 1, 1, 1, 1,
-1.229815, -2.074989, -2.542897, 1, 1, 1, 1, 1,
-1.228689, 0.3930271, -2.423782, 1, 1, 1, 1, 1,
-1.226198, -0.1530377, -2.444755, 1, 1, 1, 1, 1,
-1.225528, 1.121375, -0.6201066, 1, 1, 1, 1, 1,
-1.222231, 1.292067, 1.276393, 1, 1, 1, 1, 1,
-1.220445, 0.3023854, 0.4237887, 1, 1, 1, 1, 1,
-1.218929, 0.1034191, -0.7714817, 1, 1, 1, 1, 1,
-1.214572, -0.1572967, -2.017997, 0, 0, 1, 1, 1,
-1.203494, -0.8978803, -3.590214, 1, 0, 0, 1, 1,
-1.203355, -0.5748125, -2.763675, 1, 0, 0, 1, 1,
-1.202161, -0.2345063, -3.771852, 1, 0, 0, 1, 1,
-1.198753, 1.528241, -0.6075598, 1, 0, 0, 1, 1,
-1.197449, -0.2372354, -1.947298, 1, 0, 0, 1, 1,
-1.190637, 0.7093573, -2.989701, 0, 0, 0, 1, 1,
-1.186717, 1.814162, 1.395693, 0, 0, 0, 1, 1,
-1.173495, -2.009472, -3.66122, 0, 0, 0, 1, 1,
-1.168139, -0.8901023, -0.4047403, 0, 0, 0, 1, 1,
-1.165581, -0.4559938, -2.852609, 0, 0, 0, 1, 1,
-1.165318, -0.6587175, -1.157691, 0, 0, 0, 1, 1,
-1.164942, 1.310659, -0.09104288, 0, 0, 0, 1, 1,
-1.163301, 0.09934389, -1.334078, 1, 1, 1, 1, 1,
-1.162809, 0.1495184, -0.8313106, 1, 1, 1, 1, 1,
-1.152858, -0.7238069, -1.229752, 1, 1, 1, 1, 1,
-1.140443, -0.1181864, -0.2401953, 1, 1, 1, 1, 1,
-1.139586, 0.4192534, -1.633743, 1, 1, 1, 1, 1,
-1.139134, -0.3898706, -1.214153, 1, 1, 1, 1, 1,
-1.138707, 0.1692898, -1.120197, 1, 1, 1, 1, 1,
-1.123461, 0.4291527, -1.590139, 1, 1, 1, 1, 1,
-1.120666, -0.5587649, -1.955537, 1, 1, 1, 1, 1,
-1.108573, -1.137685, -2.791041, 1, 1, 1, 1, 1,
-1.094481, -0.3384323, -2.20882, 1, 1, 1, 1, 1,
-1.093652, 1.424069, -0.5536965, 1, 1, 1, 1, 1,
-1.089809, -0.5862564, -2.284949, 1, 1, 1, 1, 1,
-1.089078, 0.6173505, -0.9437849, 1, 1, 1, 1, 1,
-1.084737, 2.440727, -1.378154, 1, 1, 1, 1, 1,
-1.077625, 1.056854, 0.0331304, 0, 0, 1, 1, 1,
-1.067935, -0.5792273, -2.392788, 1, 0, 0, 1, 1,
-1.062026, -1.329146, -1.54496, 1, 0, 0, 1, 1,
-1.051003, -0.2676032, -2.317459, 1, 0, 0, 1, 1,
-1.049252, -0.6519697, -0.6189362, 1, 0, 0, 1, 1,
-1.039682, -1.905711, -4.679794, 1, 0, 0, 1, 1,
-1.031129, 0.6426664, -3.018045, 0, 0, 0, 1, 1,
-1.028095, 0.3820924, 0.2691616, 0, 0, 0, 1, 1,
-1.023708, -1.096927, -3.172312, 0, 0, 0, 1, 1,
-1.020252, -0.7760434, -3.275478, 0, 0, 0, 1, 1,
-1.015594, 0.4721872, -1.095319, 0, 0, 0, 1, 1,
-1.00702, 0.6279227, -1.661092, 0, 0, 0, 1, 1,
-1.006499, -0.6024522, -2.946643, 0, 0, 0, 1, 1,
-1.006289, -0.286579, -1.622294, 1, 1, 1, 1, 1,
-1.005864, 1.032792, -0.7367723, 1, 1, 1, 1, 1,
-1.00035, -1.065323, -1.242787, 1, 1, 1, 1, 1,
-0.9964221, -0.8364623, -2.834295, 1, 1, 1, 1, 1,
-0.9948982, 0.02472956, -1.281248, 1, 1, 1, 1, 1,
-0.991762, -1.155462, -1.426643, 1, 1, 1, 1, 1,
-0.9898394, 0.9536035, -0.6865878, 1, 1, 1, 1, 1,
-0.982586, -0.5575196, -1.665367, 1, 1, 1, 1, 1,
-0.9791538, 2.495655, -1.42472, 1, 1, 1, 1, 1,
-0.9744014, -0.5591887, -0.9995282, 1, 1, 1, 1, 1,
-0.973861, 0.4323309, -1.678423, 1, 1, 1, 1, 1,
-0.9714393, -2.394746, -1.388423, 1, 1, 1, 1, 1,
-0.9655718, -0.9330812, -4.33248, 1, 1, 1, 1, 1,
-0.9646575, -0.7560862, -1.169082, 1, 1, 1, 1, 1,
-0.9639399, 0.6487493, -1.748014, 1, 1, 1, 1, 1,
-0.9574512, 0.8175412, -0.2170223, 0, 0, 1, 1, 1,
-0.9516246, -0.8362311, 0.4006332, 1, 0, 0, 1, 1,
-0.9475614, 1.87684, -2.467543, 1, 0, 0, 1, 1,
-0.9444034, 0.1246325, -0.3892845, 1, 0, 0, 1, 1,
-0.9440274, -0.7945598, -1.532849, 1, 0, 0, 1, 1,
-0.9332575, 0.731231, -1.632174, 1, 0, 0, 1, 1,
-0.9286236, 2.061662, -0.7483841, 0, 0, 0, 1, 1,
-0.9230658, 0.1533044, -0.1154396, 0, 0, 0, 1, 1,
-0.9223436, 1.532414, -2.377041, 0, 0, 0, 1, 1,
-0.9207408, -0.4781459, -4.213915, 0, 0, 0, 1, 1,
-0.9150555, -0.8348233, -3.043326, 0, 0, 0, 1, 1,
-0.9103475, 0.9534944, 1.624101, 0, 0, 0, 1, 1,
-0.9034212, -1.469021, -3.889482, 0, 0, 0, 1, 1,
-0.8980752, -0.6682047, -2.863695, 1, 1, 1, 1, 1,
-0.896866, 1.013999, 1.261106, 1, 1, 1, 1, 1,
-0.89277, 0.6484649, -1.118329, 1, 1, 1, 1, 1,
-0.8926429, -0.1915499, -1.77934, 1, 1, 1, 1, 1,
-0.8914884, -0.8767315, -3.863183, 1, 1, 1, 1, 1,
-0.8839006, -0.5473763, -1.553773, 1, 1, 1, 1, 1,
-0.8802959, 0.8680466, 0.2091283, 1, 1, 1, 1, 1,
-0.8698708, -0.8688056, -1.810995, 1, 1, 1, 1, 1,
-0.8666372, -0.4235184, -1.325807, 1, 1, 1, 1, 1,
-0.8599055, -2.170408, -2.515128, 1, 1, 1, 1, 1,
-0.8575836, 0.3630979, -0.5823922, 1, 1, 1, 1, 1,
-0.8569252, 0.1939957, -0.3716981, 1, 1, 1, 1, 1,
-0.8546352, 0.9553109, -4.289495, 1, 1, 1, 1, 1,
-0.8540983, 0.1486003, -0.6039371, 1, 1, 1, 1, 1,
-0.8522795, 2.102702, 0.131077, 1, 1, 1, 1, 1,
-0.8485573, 1.119113, -0.4365807, 0, 0, 1, 1, 1,
-0.847789, 1.088438, -1.819683, 1, 0, 0, 1, 1,
-0.8474885, -0.6274925, -3.331867, 1, 0, 0, 1, 1,
-0.8442339, -0.8365368, -1.995723, 1, 0, 0, 1, 1,
-0.8431258, -1.121488, -2.0775, 1, 0, 0, 1, 1,
-0.8423266, 1.869682, -1.276875, 1, 0, 0, 1, 1,
-0.840095, 0.3929765, -1.544767, 0, 0, 0, 1, 1,
-0.8394825, -0.2693592, 0.2248986, 0, 0, 0, 1, 1,
-0.8368602, -0.9317774, -2.064058, 0, 0, 0, 1, 1,
-0.8331215, 0.4782429, -1.755321, 0, 0, 0, 1, 1,
-0.8281187, -0.7937296, -4.572019, 0, 0, 0, 1, 1,
-0.8268439, -0.4241971, -2.34211, 0, 0, 0, 1, 1,
-0.8218806, 0.6256152, -0.4597305, 0, 0, 0, 1, 1,
-0.8177791, 1.043404, -2.070956, 1, 1, 1, 1, 1,
-0.8162808, -0.482952, -2.40062, 1, 1, 1, 1, 1,
-0.8110546, 0.9474367, 0.6151534, 1, 1, 1, 1, 1,
-0.8093354, 0.9137381, -0.3747815, 1, 1, 1, 1, 1,
-0.8061004, 0.4615, -0.004273221, 1, 1, 1, 1, 1,
-0.8059302, 0.02506679, -2.654014, 1, 1, 1, 1, 1,
-0.8023339, -1.004984, -1.490568, 1, 1, 1, 1, 1,
-0.7982892, -0.5853312, -2.759615, 1, 1, 1, 1, 1,
-0.7979384, -0.0857041, -1.511722, 1, 1, 1, 1, 1,
-0.7941961, 0.6498855, -0.9824036, 1, 1, 1, 1, 1,
-0.7918013, 0.7236845, -1.451392, 1, 1, 1, 1, 1,
-0.7828415, -0.8990788, -1.155796, 1, 1, 1, 1, 1,
-0.7811878, -0.04672543, -2.407982, 1, 1, 1, 1, 1,
-0.7798911, -1.009687, -2.167451, 1, 1, 1, 1, 1,
-0.7765434, 2.200304, -0.420413, 1, 1, 1, 1, 1,
-0.774017, 0.5677185, -2.11952, 0, 0, 1, 1, 1,
-0.7702087, -0.7958639, -1.717732, 1, 0, 0, 1, 1,
-0.7695073, 0.1714996, -1.235465, 1, 0, 0, 1, 1,
-0.7644391, 0.05572103, -0.008706034, 1, 0, 0, 1, 1,
-0.7581408, 0.6344901, -0.3684009, 1, 0, 0, 1, 1,
-0.7576311, -0.5762829, 0.1213658, 1, 0, 0, 1, 1,
-0.7572412, 0.6485959, -0.2683787, 0, 0, 0, 1, 1,
-0.756367, 0.4098113, 0.4536109, 0, 0, 0, 1, 1,
-0.7547436, 0.3955906, -1.011315, 0, 0, 0, 1, 1,
-0.7521359, -0.01829946, 0.9447436, 0, 0, 0, 1, 1,
-0.7515789, -1.135437, -2.509718, 0, 0, 0, 1, 1,
-0.7508795, 0.8101588, -0.346672, 0, 0, 0, 1, 1,
-0.7365717, -0.5701909, -3.449738, 0, 0, 0, 1, 1,
-0.731721, 0.1227463, 0.08506832, 1, 1, 1, 1, 1,
-0.7291465, 0.1337286, 0.08235775, 1, 1, 1, 1, 1,
-0.7227816, 1.186095, -2.162874, 1, 1, 1, 1, 1,
-0.7218253, -0.4919866, -1.310524, 1, 1, 1, 1, 1,
-0.7134726, 1.641776, -0.2469725, 1, 1, 1, 1, 1,
-0.7059943, 0.5827256, -3.870299, 1, 1, 1, 1, 1,
-0.7045258, 0.03775338, -2.48394, 1, 1, 1, 1, 1,
-0.7029832, 0.4758667, -2.495092, 1, 1, 1, 1, 1,
-0.7004783, -1.069214, -3.974649, 1, 1, 1, 1, 1,
-0.6966171, -1.3087, -2.525125, 1, 1, 1, 1, 1,
-0.6919422, -0.6117077, -3.562871, 1, 1, 1, 1, 1,
-0.690538, -1.44092, -2.561974, 1, 1, 1, 1, 1,
-0.6852371, 0.507224, -1.106256, 1, 1, 1, 1, 1,
-0.6834803, -0.352974, -2.589854, 1, 1, 1, 1, 1,
-0.6828901, 1.050102, -0.006335862, 1, 1, 1, 1, 1,
-0.6822274, -0.1141403, -3.213978, 0, 0, 1, 1, 1,
-0.6801012, 0.1718855, -1.040395, 1, 0, 0, 1, 1,
-0.6798172, -0.782073, -1.85538, 1, 0, 0, 1, 1,
-0.6759319, -0.0727351, -1.630647, 1, 0, 0, 1, 1,
-0.6700609, 0.6533591, -1.811284, 1, 0, 0, 1, 1,
-0.6686607, -2.255161, -2.366876, 1, 0, 0, 1, 1,
-0.6681299, -0.6228602, -1.202797, 0, 0, 0, 1, 1,
-0.665581, -1.051821, -4.627973, 0, 0, 0, 1, 1,
-0.6624049, -0.09759592, -1.556286, 0, 0, 0, 1, 1,
-0.6601359, 0.08979244, -2.113849, 0, 0, 0, 1, 1,
-0.6585661, -0.3453683, -1.47524, 0, 0, 0, 1, 1,
-0.6572179, 0.5403807, 0.9243973, 0, 0, 0, 1, 1,
-0.6566347, -0.1987713, -0.4450928, 0, 0, 0, 1, 1,
-0.6560286, -0.1699609, -1.309784, 1, 1, 1, 1, 1,
-0.6546078, -0.4717729, -2.801987, 1, 1, 1, 1, 1,
-0.6529027, 0.3748326, -2.854201, 1, 1, 1, 1, 1,
-0.6525301, -1.084288, -2.735246, 1, 1, 1, 1, 1,
-0.6513643, 0.6533115, -1.202737, 1, 1, 1, 1, 1,
-0.6470935, 0.3806734, 0.07415338, 1, 1, 1, 1, 1,
-0.6445555, 1.209829, 0.3067854, 1, 1, 1, 1, 1,
-0.6389615, 0.02503339, -0.7991778, 1, 1, 1, 1, 1,
-0.6365216, -0.5593287, -3.040417, 1, 1, 1, 1, 1,
-0.6362502, 0.8892597, -0.7984694, 1, 1, 1, 1, 1,
-0.6356021, -0.8491392, -2.727332, 1, 1, 1, 1, 1,
-0.6294213, 0.09061037, -1.524911, 1, 1, 1, 1, 1,
-0.6263584, -1.943948, -2.001205, 1, 1, 1, 1, 1,
-0.6239623, 0.002416912, -2.748024, 1, 1, 1, 1, 1,
-0.620323, 1.521054, -0.3184894, 1, 1, 1, 1, 1,
-0.618808, 1.538562, 0.2357507, 0, 0, 1, 1, 1,
-0.6169923, 0.4713078, -1.695917, 1, 0, 0, 1, 1,
-0.6102294, -1.178105, -3.221282, 1, 0, 0, 1, 1,
-0.6055447, -2.002391, -4.299723, 1, 0, 0, 1, 1,
-0.6049718, 1.663369, -1.24944, 1, 0, 0, 1, 1,
-0.5991059, 0.9777036, -2.232043, 1, 0, 0, 1, 1,
-0.5944805, 0.5235239, -0.1748372, 0, 0, 0, 1, 1,
-0.5930357, 1.750012, 0.9150543, 0, 0, 0, 1, 1,
-0.5929579, -0.5419961, -3.326904, 0, 0, 0, 1, 1,
-0.5923271, 1.225408, -0.03363537, 0, 0, 0, 1, 1,
-0.5912017, 0.03575553, -1.840491, 0, 0, 0, 1, 1,
-0.5878101, -0.5704374, -2.204133, 0, 0, 0, 1, 1,
-0.5875045, -0.6615631, -0.8816565, 0, 0, 0, 1, 1,
-0.5870923, 0.2407486, -1.025742, 1, 1, 1, 1, 1,
-0.586763, 0.2647959, -1.528656, 1, 1, 1, 1, 1,
-0.5836962, -1.160759, -2.67846, 1, 1, 1, 1, 1,
-0.582458, -0.7841812, -0.4953014, 1, 1, 1, 1, 1,
-0.5793959, -0.4167982, -1.270686, 1, 1, 1, 1, 1,
-0.5780296, 0.9619699, -2.036464, 1, 1, 1, 1, 1,
-0.5774735, -0.5948629, -2.582705, 1, 1, 1, 1, 1,
-0.5774338, -0.385585, -3.756791, 1, 1, 1, 1, 1,
-0.5769194, 0.3302759, -1.206947, 1, 1, 1, 1, 1,
-0.5743511, -0.2214505, -3.594385, 1, 1, 1, 1, 1,
-0.5738547, -0.312111, -2.686577, 1, 1, 1, 1, 1,
-0.5721754, 0.6069153, -1.526599, 1, 1, 1, 1, 1,
-0.5710244, -0.2079153, -1.357096, 1, 1, 1, 1, 1,
-0.5604509, -0.7434415, -3.332363, 1, 1, 1, 1, 1,
-0.5603394, 0.02268654, -2.85715, 1, 1, 1, 1, 1,
-0.5564383, 0.6524072, 0.2905992, 0, 0, 1, 1, 1,
-0.5554121, -0.5026712, -1.948135, 1, 0, 0, 1, 1,
-0.5519817, -0.6106872, -1.240113, 1, 0, 0, 1, 1,
-0.5511912, 0.1346793, -2.133163, 1, 0, 0, 1, 1,
-0.5493175, -0.4475224, -2.027408, 1, 0, 0, 1, 1,
-0.5435488, 0.5601629, 0.8358368, 1, 0, 0, 1, 1,
-0.5414714, 1.224773, 0.03678983, 0, 0, 0, 1, 1,
-0.5408496, -0.2685372, -2.059945, 0, 0, 0, 1, 1,
-0.5389631, -2.57498, -3.260665, 0, 0, 0, 1, 1,
-0.5384312, -0.08126542, -2.828391, 0, 0, 0, 1, 1,
-0.5383721, -1.337601, -2.956013, 0, 0, 0, 1, 1,
-0.5355529, -0.8779675, -3.472101, 0, 0, 0, 1, 1,
-0.5344152, 0.3390375, -0.01739668, 0, 0, 0, 1, 1,
-0.5313788, 0.9336597, -1.800949, 1, 1, 1, 1, 1,
-0.5308443, -1.349701, -3.419782, 1, 1, 1, 1, 1,
-0.5297493, 0.3422919, -2.677384, 1, 1, 1, 1, 1,
-0.5233996, 0.3875623, -0.912729, 1, 1, 1, 1, 1,
-0.5203202, -1.0458, -2.656482, 1, 1, 1, 1, 1,
-0.5167661, -0.5892628, -0.46866, 1, 1, 1, 1, 1,
-0.511726, 0.5540295, -0.6788405, 1, 1, 1, 1, 1,
-0.5067298, 1.057143, 1.590388, 1, 1, 1, 1, 1,
-0.506693, -0.8430172, -2.140618, 1, 1, 1, 1, 1,
-0.504171, -0.5862734, -2.816675, 1, 1, 1, 1, 1,
-0.5030918, 0.6371689, -2.006726, 1, 1, 1, 1, 1,
-0.5023265, 0.1644797, -1.919019, 1, 1, 1, 1, 1,
-0.5017109, 1.027027, -0.5039247, 1, 1, 1, 1, 1,
-0.4938714, -1.155395, -2.748762, 1, 1, 1, 1, 1,
-0.4853192, 0.6233324, -0.4799889, 1, 1, 1, 1, 1,
-0.4848634, -1.645068, -4.156079, 0, 0, 1, 1, 1,
-0.4760848, 0.6933028, -0.2012569, 1, 0, 0, 1, 1,
-0.4759276, -1.272657, -0.9656968, 1, 0, 0, 1, 1,
-0.4714551, -0.2914927, -2.718716, 1, 0, 0, 1, 1,
-0.4694875, 0.8031192, -0.7018995, 1, 0, 0, 1, 1,
-0.46779, 0.2782624, -1.314632, 1, 0, 0, 1, 1,
-0.4677789, 0.06286258, -0.6815818, 0, 0, 0, 1, 1,
-0.4607551, 1.418431, -0.1864051, 0, 0, 0, 1, 1,
-0.4592867, 0.634309, -1.107025, 0, 0, 0, 1, 1,
-0.4481948, -1.875185, -3.151878, 0, 0, 0, 1, 1,
-0.4412704, 0.1437626, -2.6676, 0, 0, 0, 1, 1,
-0.4406642, -0.3065378, -2.145926, 0, 0, 0, 1, 1,
-0.4404139, -0.6057135, -1.660671, 0, 0, 0, 1, 1,
-0.4401855, -0.2241913, -3.880523, 1, 1, 1, 1, 1,
-0.4369309, -1.393297, -2.765309, 1, 1, 1, 1, 1,
-0.4356405, -1.033117, -3.161366, 1, 1, 1, 1, 1,
-0.4304049, 0.1837505, -1.912191, 1, 1, 1, 1, 1,
-0.4240934, -0.8098928, -2.796558, 1, 1, 1, 1, 1,
-0.4236095, -0.1500246, -1.256371, 1, 1, 1, 1, 1,
-0.4207097, 0.00437731, -1.656428, 1, 1, 1, 1, 1,
-0.4143398, 1.124295, 0.005279283, 1, 1, 1, 1, 1,
-0.4141113, -0.6183817, -3.306912, 1, 1, 1, 1, 1,
-0.4076409, -0.05584194, -2.029657, 1, 1, 1, 1, 1,
-0.4060898, 1.480715, 0.6018245, 1, 1, 1, 1, 1,
-0.4060676, 0.5102524, 0.3723729, 1, 1, 1, 1, 1,
-0.402851, 1.116991, 0.06411845, 1, 1, 1, 1, 1,
-0.4014054, -0.3003761, -3.39684, 1, 1, 1, 1, 1,
-0.3994015, 0.2386235, -2.07847, 1, 1, 1, 1, 1,
-0.3954425, 0.7753918, -2.778219, 0, 0, 1, 1, 1,
-0.3949402, 0.5309302, -0.7211606, 1, 0, 0, 1, 1,
-0.3938816, -0.1423878, -2.035457, 1, 0, 0, 1, 1,
-0.3915656, 1.234753, -1.27037, 1, 0, 0, 1, 1,
-0.3914721, -2.496124, -2.946445, 1, 0, 0, 1, 1,
-0.3913451, -1.956457, -1.152866, 1, 0, 0, 1, 1,
-0.3878951, -1.791044, -3.860737, 0, 0, 0, 1, 1,
-0.3869871, -0.01312952, -2.930644, 0, 0, 0, 1, 1,
-0.3866892, 1.191904, -2.054225, 0, 0, 0, 1, 1,
-0.3860417, 0.34986, -1.545616, 0, 0, 0, 1, 1,
-0.3807588, -0.01360241, -3.795363, 0, 0, 0, 1, 1,
-0.378959, 0.2119759, -1.967434, 0, 0, 0, 1, 1,
-0.3786331, -1.189443, -4.054295, 0, 0, 0, 1, 1,
-0.3762106, -0.5701631, -3.065722, 1, 1, 1, 1, 1,
-0.3749005, 0.3272351, -1.028584, 1, 1, 1, 1, 1,
-0.3626797, 1.521707, -1.239626, 1, 1, 1, 1, 1,
-0.3606324, 1.383679, -0.1832315, 1, 1, 1, 1, 1,
-0.3605727, 0.2995903, -2.644408, 1, 1, 1, 1, 1,
-0.3524423, -0.3900836, -2.307771, 1, 1, 1, 1, 1,
-0.349492, 0.6656803, -0.182186, 1, 1, 1, 1, 1,
-0.3424521, 1.344461, 0.0763377, 1, 1, 1, 1, 1,
-0.3421246, 0.01695878, -1.809238, 1, 1, 1, 1, 1,
-0.3396404, 1.172487, 0.6801438, 1, 1, 1, 1, 1,
-0.3373696, 0.5850474, 0.8260407, 1, 1, 1, 1, 1,
-0.3370285, -1.064404, -2.442419, 1, 1, 1, 1, 1,
-0.3324315, -0.619792, -1.643563, 1, 1, 1, 1, 1,
-0.3303886, -1.146433, -2.965463, 1, 1, 1, 1, 1,
-0.3268171, -0.8162809, -2.440562, 1, 1, 1, 1, 1,
-0.3233694, -0.04965666, -2.720099, 0, 0, 1, 1, 1,
-0.3210417, 1.455714, 1.609092, 1, 0, 0, 1, 1,
-0.3173663, 0.2093944, -1.780545, 1, 0, 0, 1, 1,
-0.312057, -0.5072961, -3.495309, 1, 0, 0, 1, 1,
-0.3076695, 0.6341825, -0.8159335, 1, 0, 0, 1, 1,
-0.3067864, 1.508245, -0.2337471, 1, 0, 0, 1, 1,
-0.3043655, 2.382412, 0.8289142, 0, 0, 0, 1, 1,
-0.299812, -0.519484, -3.460981, 0, 0, 0, 1, 1,
-0.2989479, 1.984289, 0.7259187, 0, 0, 0, 1, 1,
-0.2986036, -0.4921958, -1.048747, 0, 0, 0, 1, 1,
-0.2972772, 1.871179, 0.1321105, 0, 0, 0, 1, 1,
-0.2967251, 0.1842981, -2.019807, 0, 0, 0, 1, 1,
-0.2939652, -0.4160738, -2.654794, 0, 0, 0, 1, 1,
-0.2919736, 0.8890941, 0.457821, 1, 1, 1, 1, 1,
-0.2857232, 1.42433, -0.8791518, 1, 1, 1, 1, 1,
-0.2843786, -1.113578, -1.947867, 1, 1, 1, 1, 1,
-0.2774451, 0.04563107, 0.9200012, 1, 1, 1, 1, 1,
-0.2753297, 1.157774, -1.57182, 1, 1, 1, 1, 1,
-0.2748866, 1.717539, -1.001402, 1, 1, 1, 1, 1,
-0.2746528, 1.709087, -0.2402564, 1, 1, 1, 1, 1,
-0.2703117, -1.243724, -3.424443, 1, 1, 1, 1, 1,
-0.2636268, 1.191235, -0.562209, 1, 1, 1, 1, 1,
-0.26284, -1.739175, -5.62542, 1, 1, 1, 1, 1,
-0.2613872, 0.3369103, -1.060036, 1, 1, 1, 1, 1,
-0.2600709, -2.008021, -3.824822, 1, 1, 1, 1, 1,
-0.2594069, 1.180172, -0.9728999, 1, 1, 1, 1, 1,
-0.2581606, 1.224161, -0.2663091, 1, 1, 1, 1, 1,
-0.2570395, -0.1668328, -2.751198, 1, 1, 1, 1, 1,
-0.2557614, -0.5067446, -2.707963, 0, 0, 1, 1, 1,
-0.2500429, -1.07598, -4.01438, 1, 0, 0, 1, 1,
-0.248673, 1.341293, -0.9636554, 1, 0, 0, 1, 1,
-0.2435781, -1.262864, -3.920828, 1, 0, 0, 1, 1,
-0.2433812, -1.196652, -3.589197, 1, 0, 0, 1, 1,
-0.2428176, -0.6999628, -4.520571, 1, 0, 0, 1, 1,
-0.2416013, -0.8483811, -1.952702, 0, 0, 0, 1, 1,
-0.2404173, -0.8804092, -3.563216, 0, 0, 0, 1, 1,
-0.2402069, 0.376712, 1.229914, 0, 0, 0, 1, 1,
-0.2402013, -0.1738446, -2.237246, 0, 0, 0, 1, 1,
-0.2379414, -0.9160916, -3.499465, 0, 0, 0, 1, 1,
-0.2371218, -0.1890973, -1.059634, 0, 0, 0, 1, 1,
-0.2370535, 2.239872, -1.076743, 0, 0, 0, 1, 1,
-0.235265, -1.661713, -2.310294, 1, 1, 1, 1, 1,
-0.2342228, 0.8756306, 0.7708735, 1, 1, 1, 1, 1,
-0.23366, 0.9825308, -1.307178, 1, 1, 1, 1, 1,
-0.2300971, 0.8529259, -1.863376, 1, 1, 1, 1, 1,
-0.2278409, -0.1456628, -0.8406642, 1, 1, 1, 1, 1,
-0.2243311, -1.3434, -2.181911, 1, 1, 1, 1, 1,
-0.2235867, -0.6732662, -2.151002, 1, 1, 1, 1, 1,
-0.21967, 0.9794481, -0.8962128, 1, 1, 1, 1, 1,
-0.2196416, 0.08538244, -0.8683618, 1, 1, 1, 1, 1,
-0.2147195, 1.721036, -0.9252027, 1, 1, 1, 1, 1,
-0.2137524, -0.2777256, -4.2214, 1, 1, 1, 1, 1,
-0.2066779, -0.3671573, -3.622502, 1, 1, 1, 1, 1,
-0.2060739, 1.704395, -2.068599, 1, 1, 1, 1, 1,
-0.2059082, -1.159268, -5.310939, 1, 1, 1, 1, 1,
-0.1978419, -1.179033, -4.274489, 1, 1, 1, 1, 1,
-0.1973424, 0.3359782, -1.612316, 0, 0, 1, 1, 1,
-0.1967911, 0.0826138, -2.955984, 1, 0, 0, 1, 1,
-0.1922619, -1.332643, -1.888975, 1, 0, 0, 1, 1,
-0.1906406, 0.7919939, -0.1783684, 1, 0, 0, 1, 1,
-0.1906212, 1.304078, -0.5818744, 1, 0, 0, 1, 1,
-0.1899302, -0.5102435, -1.846435, 1, 0, 0, 1, 1,
-0.1852808, 0.3509493, -2.06538, 0, 0, 0, 1, 1,
-0.183806, -0.0952742, -2.257435, 0, 0, 0, 1, 1,
-0.1818832, -1.6132, -2.935323, 0, 0, 0, 1, 1,
-0.1798222, -0.4706909, -2.733523, 0, 0, 0, 1, 1,
-0.1788686, -0.5643524, -3.607678, 0, 0, 0, 1, 1,
-0.176896, 0.8636721, 1.081031, 0, 0, 0, 1, 1,
-0.1766423, 1.038168, 1.992073, 0, 0, 0, 1, 1,
-0.174589, 0.516521, -0.2008426, 1, 1, 1, 1, 1,
-0.1699327, -0.04121566, -2.573156, 1, 1, 1, 1, 1,
-0.1692354, 1.160914, -0.5059929, 1, 1, 1, 1, 1,
-0.1690136, 1.461943, -1.212901, 1, 1, 1, 1, 1,
-0.1673343, 0.02330465, -3.393739, 1, 1, 1, 1, 1,
-0.1619921, -2.402682, -3.831076, 1, 1, 1, 1, 1,
-0.1607931, -1.104407, -3.52316, 1, 1, 1, 1, 1,
-0.1607379, 0.09561523, -0.6155667, 1, 1, 1, 1, 1,
-0.1603028, 0.3947102, -0.5686678, 1, 1, 1, 1, 1,
-0.1528967, -0.3087687, -3.734612, 1, 1, 1, 1, 1,
-0.1506694, -1.604706, -3.968742, 1, 1, 1, 1, 1,
-0.1482826, -0.8808239, -4.018139, 1, 1, 1, 1, 1,
-0.1445936, -0.4226072, -3.095489, 1, 1, 1, 1, 1,
-0.1398105, -0.08421158, -0.7684499, 1, 1, 1, 1, 1,
-0.1378752, -2.107493, -1.760974, 1, 1, 1, 1, 1,
-0.1364389, -1.00817, -4.253122, 0, 0, 1, 1, 1,
-0.1312866, 0.1656973, 0.2521983, 1, 0, 0, 1, 1,
-0.1303141, 1.446559, -0.5189238, 1, 0, 0, 1, 1,
-0.1278672, -0.08326881, -2.483603, 1, 0, 0, 1, 1,
-0.1247812, 1.210604, 0.9546599, 1, 0, 0, 1, 1,
-0.1227198, -1.223675, -2.976527, 1, 0, 0, 1, 1,
-0.1207028, -2.124055, -2.564697, 0, 0, 0, 1, 1,
-0.1197251, 0.4992448, -0.8325285, 0, 0, 0, 1, 1,
-0.1192185, 0.113055, -2.919171, 0, 0, 0, 1, 1,
-0.1064306, 0.6470624, -0.3261243, 0, 0, 0, 1, 1,
-0.1049176, 1.465827, -0.6724391, 0, 0, 0, 1, 1,
-0.1018875, -0.4295642, -5.04596, 0, 0, 0, 1, 1,
-0.09550277, 0.7810035, 2.12013, 0, 0, 0, 1, 1,
-0.09394459, -1.419084, -1.692453, 1, 1, 1, 1, 1,
-0.09211605, -1.300188, -4.008831, 1, 1, 1, 1, 1,
-0.09178593, 0.1283232, 0.3085389, 1, 1, 1, 1, 1,
-0.08521102, 0.3301803, -2.734507, 1, 1, 1, 1, 1,
-0.08265191, -0.09553939, -2.315702, 1, 1, 1, 1, 1,
-0.07979086, 1.354361, 0.5810069, 1, 1, 1, 1, 1,
-0.07450736, 0.8687655, -0.9471665, 1, 1, 1, 1, 1,
-0.07230196, -1.225392, -2.831099, 1, 1, 1, 1, 1,
-0.07204986, -0.5415793, -1.718196, 1, 1, 1, 1, 1,
-0.06971416, 0.9238445, -0.1049109, 1, 1, 1, 1, 1,
-0.06908858, 0.2401771, -0.6010739, 1, 1, 1, 1, 1,
-0.06854154, -1.402764, -3.22126, 1, 1, 1, 1, 1,
-0.06750876, -0.6957644, -3.010856, 1, 1, 1, 1, 1,
-0.06585792, -0.378113, -3.712384, 1, 1, 1, 1, 1,
-0.06182658, 0.3106272, -0.837301, 1, 1, 1, 1, 1,
-0.05474968, -0.3049786, -4.132166, 0, 0, 1, 1, 1,
-0.04607296, -0.4255679, -1.911413, 1, 0, 0, 1, 1,
-0.03546305, 1.423491, -1.099028, 1, 0, 0, 1, 1,
-0.03332631, 0.4157666, -0.2120284, 1, 0, 0, 1, 1,
-0.02899569, 0.003737863, -0.2658374, 1, 0, 0, 1, 1,
-0.02475843, 1.44742, 0.2223563, 1, 0, 0, 1, 1,
-0.02203551, 0.9188512, -0.1551806, 0, 0, 0, 1, 1,
-0.01789889, 0.676242, -0.6771511, 0, 0, 0, 1, 1,
-0.009981897, -0.2881051, -2.834666, 0, 0, 0, 1, 1,
-0.008837885, -0.153779, -3.429512, 0, 0, 0, 1, 1,
-0.007002015, -0.4130028, -4.251534, 0, 0, 0, 1, 1,
-0.003334174, -1.370573, -3.284647, 0, 0, 0, 1, 1,
-0.00182269, 1.052885, 1.479781, 0, 0, 0, 1, 1,
0.0001697305, -2.024437, 1.19367, 1, 1, 1, 1, 1,
0.001653719, -0.08856683, 3.809141, 1, 1, 1, 1, 1,
0.001837252, 1.265783, -0.8617959, 1, 1, 1, 1, 1,
0.004441137, 0.2915405, -0.2187652, 1, 1, 1, 1, 1,
0.007289597, -0.8420877, 2.455159, 1, 1, 1, 1, 1,
0.01501632, 1.600291, -2.215807, 1, 1, 1, 1, 1,
0.01613738, 0.007462178, 1.349396, 1, 1, 1, 1, 1,
0.01715485, -0.4765621, 3.268869, 1, 1, 1, 1, 1,
0.02505656, 0.6847407, 0.4173147, 1, 1, 1, 1, 1,
0.02792159, -1.121538, 4.797208, 1, 1, 1, 1, 1,
0.02885552, 0.5184759, -0.6648837, 1, 1, 1, 1, 1,
0.03289297, 0.6958374, 2.630734, 1, 1, 1, 1, 1,
0.03862358, 0.6512614, 0.8811967, 1, 1, 1, 1, 1,
0.04231724, 1.322824, 0.2917011, 1, 1, 1, 1, 1,
0.04426929, 0.01358006, 1.401219, 1, 1, 1, 1, 1,
0.04608269, -0.7783448, 2.125833, 0, 0, 1, 1, 1,
0.04829113, -0.1930625, 2.097264, 1, 0, 0, 1, 1,
0.05182334, 0.8852713, 0.6408759, 1, 0, 0, 1, 1,
0.05343655, -0.1069475, 4.545455, 1, 0, 0, 1, 1,
0.05525625, -0.3557737, 1.808222, 1, 0, 0, 1, 1,
0.06688017, 2.166428, 0.6365604, 1, 0, 0, 1, 1,
0.07052361, -1.091149, 2.593247, 0, 0, 0, 1, 1,
0.0714498, -1.896452, 3.581133, 0, 0, 0, 1, 1,
0.07332701, 1.426002, 1.588282, 0, 0, 0, 1, 1,
0.07380468, 0.1102547, 1.916001, 0, 0, 0, 1, 1,
0.07483873, -0.8085127, 4.064365, 0, 0, 0, 1, 1,
0.07768343, -2.557486, 2.418705, 0, 0, 0, 1, 1,
0.07788668, 0.02830462, 1.444499, 0, 0, 0, 1, 1,
0.07857671, -0.4329006, 4.193464, 1, 1, 1, 1, 1,
0.07972796, -0.1937792, 3.234498, 1, 1, 1, 1, 1,
0.0835402, -1.550886, 2.207976, 1, 1, 1, 1, 1,
0.08556601, -1.773283, 3.490192, 1, 1, 1, 1, 1,
0.08609232, -0.1476168, 2.203856, 1, 1, 1, 1, 1,
0.08970561, -1.482379, 3.545876, 1, 1, 1, 1, 1,
0.09116199, 0.6265311, 1.323818, 1, 1, 1, 1, 1,
0.09507344, 0.0008550335, 2.654507, 1, 1, 1, 1, 1,
0.09668416, 0.0853667, 3.214717, 1, 1, 1, 1, 1,
0.09853701, -1.043183, 2.160845, 1, 1, 1, 1, 1,
0.09966877, 0.7883831, -0.2814298, 1, 1, 1, 1, 1,
0.1016005, 0.2055669, 2.295813, 1, 1, 1, 1, 1,
0.1031365, 2.286535, -0.04332928, 1, 1, 1, 1, 1,
0.1133399, 1.65894, 0.4107793, 1, 1, 1, 1, 1,
0.1150286, -1.013551, 1.6818, 1, 1, 1, 1, 1,
0.1163149, -0.8636567, 3.704274, 0, 0, 1, 1, 1,
0.1187792, -1.043882, 4.31729, 1, 0, 0, 1, 1,
0.1201916, 1.510974, 1.495143, 1, 0, 0, 1, 1,
0.1205622, 0.5395834, 0.6848933, 1, 0, 0, 1, 1,
0.1233755, -0.6997775, 2.14285, 1, 0, 0, 1, 1,
0.1235366, 0.2054721, 0.7713765, 1, 0, 0, 1, 1,
0.1316346, 0.9372532, -0.1200016, 0, 0, 0, 1, 1,
0.1321316, 1.40717, 0.4523785, 0, 0, 0, 1, 1,
0.137193, -0.6812066, 3.274967, 0, 0, 0, 1, 1,
0.1379711, 1.234062, -1.820895, 0, 0, 0, 1, 1,
0.1485359, 0.3517489, -0.7983815, 0, 0, 0, 1, 1,
0.1537815, -0.8335937, 3.151072, 0, 0, 0, 1, 1,
0.1563261, -0.3672814, 2.217765, 0, 0, 0, 1, 1,
0.1633919, 0.7066184, -0.02533492, 1, 1, 1, 1, 1,
0.1653975, -0.120464, 2.344293, 1, 1, 1, 1, 1,
0.1697541, 0.03122384, -0.3731098, 1, 1, 1, 1, 1,
0.1699378, 1.876317, -1.76159, 1, 1, 1, 1, 1,
0.17646, 0.07889369, -0.509002, 1, 1, 1, 1, 1,
0.180134, -0.8667298, 0.5620561, 1, 1, 1, 1, 1,
0.1824886, -0.4139609, 1.847688, 1, 1, 1, 1, 1,
0.1841536, -1.216355, 1.420791, 1, 1, 1, 1, 1,
0.1846452, -0.90703, 3.149811, 1, 1, 1, 1, 1,
0.1848908, -0.3660402, 3.573295, 1, 1, 1, 1, 1,
0.1928976, -0.2164831, 1.927114, 1, 1, 1, 1, 1,
0.1977564, -0.1721106, 2.043855, 1, 1, 1, 1, 1,
0.1988315, 0.1883993, 1.986051, 1, 1, 1, 1, 1,
0.2002057, -0.7056115, -0.4493079, 1, 1, 1, 1, 1,
0.2004756, -1.72537, 2.090831, 1, 1, 1, 1, 1,
0.2042567, 0.3497457, -0.4163205, 0, 0, 1, 1, 1,
0.2075812, -0.05071553, 3.633867, 1, 0, 0, 1, 1,
0.2114571, 0.7601494, 0.1195643, 1, 0, 0, 1, 1,
0.2153062, 0.9486772, 0.09911452, 1, 0, 0, 1, 1,
0.2154166, 0.5032405, 0.383471, 1, 0, 0, 1, 1,
0.219137, 0.6494684, 0.9267902, 1, 0, 0, 1, 1,
0.2226246, -0.6729854, 4.268579, 0, 0, 0, 1, 1,
0.2243904, -0.8279265, 4.576891, 0, 0, 0, 1, 1,
0.2383253, 0.5494847, 1.584353, 0, 0, 0, 1, 1,
0.2387232, -1.606019, 3.184457, 0, 0, 0, 1, 1,
0.2395497, -0.4422932, 1.638904, 0, 0, 0, 1, 1,
0.2404733, -0.355311, 2.718313, 0, 0, 0, 1, 1,
0.2436435, -1.50029, 3.281481, 0, 0, 0, 1, 1,
0.2448931, -1.728045, 2.545214, 1, 1, 1, 1, 1,
0.2449991, 0.9380884, -0.04864641, 1, 1, 1, 1, 1,
0.2460619, 0.5295359, 1.029452, 1, 1, 1, 1, 1,
0.2486946, -0.3310692, 3.548229, 1, 1, 1, 1, 1,
0.2502647, 0.1879886, 0.6526466, 1, 1, 1, 1, 1,
0.2536436, 2.228996, 0.5611211, 1, 1, 1, 1, 1,
0.2540809, -1.641634, 2.562896, 1, 1, 1, 1, 1,
0.2549735, -2.242322, 4.315123, 1, 1, 1, 1, 1,
0.2581251, -0.6834533, 2.881021, 1, 1, 1, 1, 1,
0.2623604, -0.0529994, 2.433483, 1, 1, 1, 1, 1,
0.2651461, -1.697088, 4.722207, 1, 1, 1, 1, 1,
0.26758, -1.194305, 2.683857, 1, 1, 1, 1, 1,
0.2676394, -1.343465, 1.452788, 1, 1, 1, 1, 1,
0.2680817, -0.1977381, 1.420147, 1, 1, 1, 1, 1,
0.2710147, -0.2097565, 2.300451, 1, 1, 1, 1, 1,
0.2726318, 2.21439, -1.231726, 0, 0, 1, 1, 1,
0.2742769, -0.003727497, 0.9068119, 1, 0, 0, 1, 1,
0.2775507, 0.6876447, -0.9398468, 1, 0, 0, 1, 1,
0.2777407, 0.2760302, 1.471235, 1, 0, 0, 1, 1,
0.2789854, -0.02954896, 1.916171, 1, 0, 0, 1, 1,
0.2815574, 0.3001483, -0.1827039, 1, 0, 0, 1, 1,
0.2830195, 0.9937201, 0.1120029, 0, 0, 0, 1, 1,
0.2868211, -0.1130166, 2.962175, 0, 0, 0, 1, 1,
0.2911876, -0.5961723, 3.022609, 0, 0, 0, 1, 1,
0.295779, -1.882318, 3.868408, 0, 0, 0, 1, 1,
0.2986094, 0.5090829, 0.01950127, 0, 0, 0, 1, 1,
0.2994724, 0.6872245, 0.1784201, 0, 0, 0, 1, 1,
0.3013744, -0.04194673, 1.126863, 0, 0, 0, 1, 1,
0.3055245, 0.1967703, 0.1148451, 1, 1, 1, 1, 1,
0.3061767, 0.2897545, -0.8052638, 1, 1, 1, 1, 1,
0.307005, -0.3042623, 2.283037, 1, 1, 1, 1, 1,
0.3083824, 0.5116055, 1.347805, 1, 1, 1, 1, 1,
0.3089106, 0.1826523, -0.4054186, 1, 1, 1, 1, 1,
0.3100775, 0.2798621, -0.955283, 1, 1, 1, 1, 1,
0.3103195, 0.2522017, 0.2190906, 1, 1, 1, 1, 1,
0.3116922, -0.163357, 2.588157, 1, 1, 1, 1, 1,
0.3179764, -0.1089188, 0.9141013, 1, 1, 1, 1, 1,
0.3215468, -1.003502, 1.871386, 1, 1, 1, 1, 1,
0.3221097, -1.124591, 2.962786, 1, 1, 1, 1, 1,
0.3231129, -0.07341965, 2.416136, 1, 1, 1, 1, 1,
0.3289247, 1.515764, 1.690144, 1, 1, 1, 1, 1,
0.3293535, 0.1689911, 1.862606, 1, 1, 1, 1, 1,
0.340345, 0.3081327, -0.3990871, 1, 1, 1, 1, 1,
0.3411869, -0.9205099, 3.102834, 0, 0, 1, 1, 1,
0.3446786, 0.2139126, 0.3956416, 1, 0, 0, 1, 1,
0.345492, -2.181955, 2.723047, 1, 0, 0, 1, 1,
0.345643, -1.579595, 3.517369, 1, 0, 0, 1, 1,
0.3477671, -0.04129126, 1.688253, 1, 0, 0, 1, 1,
0.3497915, -0.3430842, 2.783493, 1, 0, 0, 1, 1,
0.3574283, 0.08569065, 2.336788, 0, 0, 0, 1, 1,
0.357842, -0.4436207, 0.6778216, 0, 0, 0, 1, 1,
0.3580197, 1.273122, 0.7601957, 0, 0, 0, 1, 1,
0.3584119, 0.5966719, 1.773764, 0, 0, 0, 1, 1,
0.3635779, -0.626689, 2.182256, 0, 0, 0, 1, 1,
0.363735, -0.1011366, 3.461926, 0, 0, 0, 1, 1,
0.3646345, -2.290339, 2.372584, 0, 0, 0, 1, 1,
0.364796, -1.997147, 0.6940835, 1, 1, 1, 1, 1,
0.369061, 1.5383, -0.2213713, 1, 1, 1, 1, 1,
0.3806406, -0.5037051, 2.543738, 1, 1, 1, 1, 1,
0.3827699, -0.7480056, 1.862246, 1, 1, 1, 1, 1,
0.383369, 0.9070442, 0.09193328, 1, 1, 1, 1, 1,
0.3863493, -1.208915, 2.739773, 1, 1, 1, 1, 1,
0.3889998, 0.4472298, 0.9515325, 1, 1, 1, 1, 1,
0.3906477, 0.6922249, 0.3104656, 1, 1, 1, 1, 1,
0.393996, -0.2879606, 1.368126, 1, 1, 1, 1, 1,
0.4017631, 1.576335, -0.191326, 1, 1, 1, 1, 1,
0.4025661, -0.1928292, 2.634977, 1, 1, 1, 1, 1,
0.4082634, -1.446182, 3.629624, 1, 1, 1, 1, 1,
0.4116296, -0.3441628, 2.62829, 1, 1, 1, 1, 1,
0.4120778, 1.687115, 1.288579, 1, 1, 1, 1, 1,
0.4132087, -0.50161, 0.6491012, 1, 1, 1, 1, 1,
0.4139257, 0.3493391, -0.1747288, 0, 0, 1, 1, 1,
0.4159221, 0.5462878, -1.585344, 1, 0, 0, 1, 1,
0.4162535, 0.7977357, 1.452842, 1, 0, 0, 1, 1,
0.4250855, 1.112976, 1.107382, 1, 0, 0, 1, 1,
0.4268942, 1.23716, 0.1457382, 1, 0, 0, 1, 1,
0.4285389, -0.118028, 0.3531078, 1, 0, 0, 1, 1,
0.4320759, -1.605327, 2.618829, 0, 0, 0, 1, 1,
0.4325391, -0.1049197, 2.853708, 0, 0, 0, 1, 1,
0.4340239, 0.7576734, -0.7202498, 0, 0, 0, 1, 1,
0.4351207, -0.1952516, 1.640279, 0, 0, 0, 1, 1,
0.4358044, 0.4744596, 1.839281, 0, 0, 0, 1, 1,
0.4382944, 1.142129, 0.1779594, 0, 0, 0, 1, 1,
0.4383784, 0.3562166, 0.3872462, 0, 0, 0, 1, 1,
0.4392646, 0.4635662, 0.7140584, 1, 1, 1, 1, 1,
0.4482755, 0.8908017, 0.5327451, 1, 1, 1, 1, 1,
0.4515073, 0.5814711, 0.6289402, 1, 1, 1, 1, 1,
0.4580154, -0.3470098, 1.097673, 1, 1, 1, 1, 1,
0.4607624, 0.03103151, -0.132629, 1, 1, 1, 1, 1,
0.4636916, 1.538581, 0.6163793, 1, 1, 1, 1, 1,
0.4669212, 1.184227, 0.6341771, 1, 1, 1, 1, 1,
0.467661, 0.1703837, -0.7827587, 1, 1, 1, 1, 1,
0.4682986, -0.1248856, 1.900572, 1, 1, 1, 1, 1,
0.4731936, -0.4345646, 1.819991, 1, 1, 1, 1, 1,
0.4878392, -1.555285, 1.563673, 1, 1, 1, 1, 1,
0.4879105, -1.365921, 3.165286, 1, 1, 1, 1, 1,
0.4968356, 0.5792043, -0.1183247, 1, 1, 1, 1, 1,
0.5028931, 2.253132, 0.1548384, 1, 1, 1, 1, 1,
0.5130705, -0.07111848, 1.410645, 1, 1, 1, 1, 1,
0.5154842, -0.01867923, 0.6495761, 0, 0, 1, 1, 1,
0.5208807, -0.3686259, 2.613928, 1, 0, 0, 1, 1,
0.5212005, -0.563957, 1.898794, 1, 0, 0, 1, 1,
0.5274885, -0.3216357, 4.62792, 1, 0, 0, 1, 1,
0.5283856, 0.2538162, 1.095161, 1, 0, 0, 1, 1,
0.5382856, 0.6868869, 0.09427287, 1, 0, 0, 1, 1,
0.5387747, 0.6435975, 0.6142453, 0, 0, 0, 1, 1,
0.5433967, -1.651427, 2.917314, 0, 0, 0, 1, 1,
0.5457446, -0.9978611, 3.740694, 0, 0, 0, 1, 1,
0.5534996, -0.1571866, 0.5491892, 0, 0, 0, 1, 1,
0.5556606, -0.4522185, 1.196131, 0, 0, 0, 1, 1,
0.5558716, 1.451153, -0.6060461, 0, 0, 0, 1, 1,
0.5640873, 1.701479, -1.191121, 0, 0, 0, 1, 1,
0.5646855, -0.6855288, 2.006548, 1, 1, 1, 1, 1,
0.564803, 2.347258, -1.278032, 1, 1, 1, 1, 1,
0.5721918, 0.6299032, 2.022099, 1, 1, 1, 1, 1,
0.577588, 0.6557786, -1.052208, 1, 1, 1, 1, 1,
0.5776446, -0.7594909, 2.835737, 1, 1, 1, 1, 1,
0.5779447, -0.2293419, 1.833386, 1, 1, 1, 1, 1,
0.5792128, -0.7536492, 2.318663, 1, 1, 1, 1, 1,
0.5822025, 0.3790589, 2.065145, 1, 1, 1, 1, 1,
0.5861248, -1.526542, 3.525196, 1, 1, 1, 1, 1,
0.5870642, 0.205259, 2.20468, 1, 1, 1, 1, 1,
0.5878865, 0.4218789, -0.06181448, 1, 1, 1, 1, 1,
0.5909432, 0.6995236, 0.8675046, 1, 1, 1, 1, 1,
0.5945147, -1.069716, 2.414708, 1, 1, 1, 1, 1,
0.5992321, 0.3509831, 1.061964, 1, 1, 1, 1, 1,
0.5998856, 0.3965204, -0.9184527, 1, 1, 1, 1, 1,
0.6017871, 0.1782357, 1.245072, 0, 0, 1, 1, 1,
0.6034721, -0.4889774, 2.628774, 1, 0, 0, 1, 1,
0.6044635, 0.3232597, 1.016483, 1, 0, 0, 1, 1,
0.6059442, 1.143869, -0.4987231, 1, 0, 0, 1, 1,
0.6061566, 1.433809, 0.4631292, 1, 0, 0, 1, 1,
0.6069527, 0.6373564, 1.169749, 1, 0, 0, 1, 1,
0.6090851, 1.26682, 0.5756816, 0, 0, 0, 1, 1,
0.6095496, -0.5996293, 3.345982, 0, 0, 0, 1, 1,
0.6119229, 0.5998011, 1.352037, 0, 0, 0, 1, 1,
0.6132219, -1.362026, 3.8951, 0, 0, 0, 1, 1,
0.6150779, -0.1728991, 2.33266, 0, 0, 0, 1, 1,
0.617734, -0.01037723, 3.671199, 0, 0, 0, 1, 1,
0.6212043, -0.1246777, 1.116084, 0, 0, 0, 1, 1,
0.6269212, -1.639668, 3.795727, 1, 1, 1, 1, 1,
0.6353711, -0.4887394, 1.665813, 1, 1, 1, 1, 1,
0.6490366, -1.281487, 4.541339, 1, 1, 1, 1, 1,
0.6490769, -0.00279476, 1.202593, 1, 1, 1, 1, 1,
0.6528027, 0.5716698, -0.5816227, 1, 1, 1, 1, 1,
0.6545264, 0.5783132, 0.4263507, 1, 1, 1, 1, 1,
0.6589475, 1.045669, -0.05539151, 1, 1, 1, 1, 1,
0.6665936, -0.2164351, 2.000987, 1, 1, 1, 1, 1,
0.6688277, 1.47148, 0.6340806, 1, 1, 1, 1, 1,
0.6698672, -0.8089724, 2.923703, 1, 1, 1, 1, 1,
0.6712362, -1.381243, 2.97298, 1, 1, 1, 1, 1,
0.6719158, 0.8229004, 1.144893, 1, 1, 1, 1, 1,
0.6752434, 0.0127576, 0.274662, 1, 1, 1, 1, 1,
0.6780258, -0.8316453, 1.559407, 1, 1, 1, 1, 1,
0.6787667, 1.856015, 1.256673, 1, 1, 1, 1, 1,
0.6816322, -1.337941, 2.512031, 0, 0, 1, 1, 1,
0.6869336, 0.4276787, 1.816821, 1, 0, 0, 1, 1,
0.6892982, 0.8250423, 0.7955627, 1, 0, 0, 1, 1,
0.6923982, 0.8026507, 0.4484004, 1, 0, 0, 1, 1,
0.6938467, -0.7366819, 3.599694, 1, 0, 0, 1, 1,
0.6994503, 1.570352, -1.208458, 1, 0, 0, 1, 1,
0.7007843, -0.3409387, 1.146825, 0, 0, 0, 1, 1,
0.703151, 1.497416, -1.079717, 0, 0, 0, 1, 1,
0.7048684, -0.3969862, 1.195318, 0, 0, 0, 1, 1,
0.7091039, 0.4040644, 1.873052, 0, 0, 0, 1, 1,
0.7169221, 0.6026553, 1.361985, 0, 0, 0, 1, 1,
0.7182413, 1.519662, 1.126935, 0, 0, 0, 1, 1,
0.718528, 1.083718, 0.8714597, 0, 0, 0, 1, 1,
0.725979, -0.0580354, 1.491341, 1, 1, 1, 1, 1,
0.7263801, -0.3082304, 3.265128, 1, 1, 1, 1, 1,
0.7311283, -0.07436997, 0.9766926, 1, 1, 1, 1, 1,
0.7337545, -1.087196, 3.021182, 1, 1, 1, 1, 1,
0.7372918, -1.316756, 4.423826, 1, 1, 1, 1, 1,
0.7391976, -0.09827332, 2.097801, 1, 1, 1, 1, 1,
0.7393432, 0.8170861, 0.1494153, 1, 1, 1, 1, 1,
0.7409152, -0.7668546, 1.857739, 1, 1, 1, 1, 1,
0.7411084, -0.7885043, 3.95263, 1, 1, 1, 1, 1,
0.7621478, 0.7668872, -0.573695, 1, 1, 1, 1, 1,
0.7714289, -0.7672397, 0.358156, 1, 1, 1, 1, 1,
0.77424, 1.634761, -1.059881, 1, 1, 1, 1, 1,
0.7784093, 0.1478092, 0.1650175, 1, 1, 1, 1, 1,
0.7796777, 0.9658832, 0.5828141, 1, 1, 1, 1, 1,
0.786225, 0.119467, -0.2311098, 1, 1, 1, 1, 1,
0.7885845, 0.2300527, 0.5523479, 0, 0, 1, 1, 1,
0.7896884, -0.01066403, -0.8607698, 1, 0, 0, 1, 1,
0.7923165, -0.3741312, 1.748346, 1, 0, 0, 1, 1,
0.7935081, -1.818966, 1.680315, 1, 0, 0, 1, 1,
0.7992895, -1.047351, 3.221664, 1, 0, 0, 1, 1,
0.7993159, 0.7248769, 1.97819, 1, 0, 0, 1, 1,
0.8034148, -1.469947, 3.455526, 0, 0, 0, 1, 1,
0.8036974, -1.260089, 4.477914, 0, 0, 0, 1, 1,
0.8046349, -0.2889408, 2.388449, 0, 0, 0, 1, 1,
0.8062726, 1.872127, -1.887266, 0, 0, 0, 1, 1,
0.8075722, -0.112284, 1.580807, 0, 0, 0, 1, 1,
0.8080361, 0.2308031, 1.145398, 0, 0, 0, 1, 1,
0.8080686, 0.1596864, 1.846437, 0, 0, 0, 1, 1,
0.8097069, -0.9879745, 2.16176, 1, 1, 1, 1, 1,
0.8097761, -1.978541, 1.556197, 1, 1, 1, 1, 1,
0.8115712, 1.010327, 2.910434, 1, 1, 1, 1, 1,
0.8115915, 0.5980762, 0.8001523, 1, 1, 1, 1, 1,
0.8145135, -2.105236, 1.317697, 1, 1, 1, 1, 1,
0.8198721, 0.0440425, 1.805621, 1, 1, 1, 1, 1,
0.8242244, -0.8385491, 6.555887, 1, 1, 1, 1, 1,
0.8449275, 2.184952, 1.884066, 1, 1, 1, 1, 1,
0.8496237, -0.2975721, 1.020081, 1, 1, 1, 1, 1,
0.8505969, 0.430759, 2.631752, 1, 1, 1, 1, 1,
0.8549303, -0.2098945, 1.211541, 1, 1, 1, 1, 1,
0.8556865, -0.792477, 2.205694, 1, 1, 1, 1, 1,
0.8647635, -0.05357129, 2.043905, 1, 1, 1, 1, 1,
0.8649766, -0.9291462, 1.814663, 1, 1, 1, 1, 1,
0.8800825, -0.7947205, 1.866723, 1, 1, 1, 1, 1,
0.8870611, 0.1099062, 1.300941, 0, 0, 1, 1, 1,
0.8872285, -0.8150365, 4.223499, 1, 0, 0, 1, 1,
0.8879865, -0.1689788, 0.8093311, 1, 0, 0, 1, 1,
0.8882412, 0.7091752, 0.9074214, 1, 0, 0, 1, 1,
0.8897214, 2.135881, -2.213555, 1, 0, 0, 1, 1,
0.8952289, 0.5381424, -0.04930808, 1, 0, 0, 1, 1,
0.8977327, -1.042465, 2.215448, 0, 0, 0, 1, 1,
0.9124792, -0.06273485, 3.347349, 0, 0, 0, 1, 1,
0.9125651, -3.577359, 2.951377, 0, 0, 0, 1, 1,
0.912825, 0.6090395, 1.163405, 0, 0, 0, 1, 1,
0.9170197, 0.2003817, 2.283757, 0, 0, 0, 1, 1,
0.9218398, 0.1618053, 1.594765, 0, 0, 0, 1, 1,
0.9225448, -0.6944489, 1.941341, 0, 0, 0, 1, 1,
0.9233636, 0.9808716, 2.529133, 1, 1, 1, 1, 1,
0.923577, -0.3649145, 4.213223, 1, 1, 1, 1, 1,
0.9327457, 0.8541629, 0.8277262, 1, 1, 1, 1, 1,
0.9352773, -0.1630679, 1.702396, 1, 1, 1, 1, 1,
0.9433809, -0.2243525, 0.7225385, 1, 1, 1, 1, 1,
0.9503274, 0.411194, 0.7304885, 1, 1, 1, 1, 1,
0.9520065, -0.8968211, 3.12514, 1, 1, 1, 1, 1,
0.9571469, 0.7972385, 0.4915903, 1, 1, 1, 1, 1,
0.9667828, -0.3069833, 3.275842, 1, 1, 1, 1, 1,
0.9723326, -0.7318717, 2.169029, 1, 1, 1, 1, 1,
0.9731334, 0.1116133, -1.009946, 1, 1, 1, 1, 1,
0.974315, -0.3945985, 2.759609, 1, 1, 1, 1, 1,
0.9763098, 1.0172, 1.497309, 1, 1, 1, 1, 1,
0.9784117, 0.5412973, 1.46982, 1, 1, 1, 1, 1,
0.9787022, -0.3904637, 1.242255, 1, 1, 1, 1, 1,
0.9788502, -0.7817966, 1.30826, 0, 0, 1, 1, 1,
0.9891483, 0.1295034, 2.64635, 1, 0, 0, 1, 1,
0.9937119, 0.8945915, 1.226244, 1, 0, 0, 1, 1,
0.9940847, 0.08465335, 1.66935, 1, 0, 0, 1, 1,
0.9974697, 0.03639181, 2.212961, 1, 0, 0, 1, 1,
1.005848, -0.3999189, 2.59324, 1, 0, 0, 1, 1,
1.006664, -0.5600829, 3.51787, 0, 0, 0, 1, 1,
1.008611, 0.2005338, 2.105371, 0, 0, 0, 1, 1,
1.023196, -1.054683, 1.725438, 0, 0, 0, 1, 1,
1.0235, 0.6457919, -0.02302823, 0, 0, 0, 1, 1,
1.024169, -0.4821117, 1.107168, 0, 0, 0, 1, 1,
1.024534, -0.4226556, 1.916521, 0, 0, 0, 1, 1,
1.033133, -0.02114824, 0.5620437, 0, 0, 0, 1, 1,
1.034129, -1.851539, 2.741527, 1, 1, 1, 1, 1,
1.034327, 0.2491413, -0.05752053, 1, 1, 1, 1, 1,
1.038279, -0.670471, 1.293955, 1, 1, 1, 1, 1,
1.046261, 0.6440157, 0.8744522, 1, 1, 1, 1, 1,
1.050542, 0.5710446, 1.49297, 1, 1, 1, 1, 1,
1.052096, 0.1472117, 2.910635, 1, 1, 1, 1, 1,
1.053056, -0.3498493, 2.868488, 1, 1, 1, 1, 1,
1.06184, -0.2284496, 2.633733, 1, 1, 1, 1, 1,
1.071533, -1.752031, 0.9888903, 1, 1, 1, 1, 1,
1.07639, -1.503849, 1.544071, 1, 1, 1, 1, 1,
1.077566, 0.630652, 0.4444567, 1, 1, 1, 1, 1,
1.077845, -0.1340215, 1.305439, 1, 1, 1, 1, 1,
1.084128, 1.992905, -0.3428473, 1, 1, 1, 1, 1,
1.085695, 0.1481007, 1.571969, 1, 1, 1, 1, 1,
1.087992, 0.3696126, 0.237798, 1, 1, 1, 1, 1,
1.09174, 0.6697876, 1.324948, 0, 0, 1, 1, 1,
1.091755, -0.6966311, 2.204486, 1, 0, 0, 1, 1,
1.098226, 0.06638309, 3.955449, 1, 0, 0, 1, 1,
1.104364, -1.032659, 1.800959, 1, 0, 0, 1, 1,
1.105077, -0.9119205, 0.482958, 1, 0, 0, 1, 1,
1.111906, -0.3846222, 1.218917, 1, 0, 0, 1, 1,
1.114254, 1.404243, 0.5132507, 0, 0, 0, 1, 1,
1.120754, -0.3896173, 1.33239, 0, 0, 0, 1, 1,
1.12643, 1.122372, 2.567042, 0, 0, 0, 1, 1,
1.149277, 0.03288436, 1.255899, 0, 0, 0, 1, 1,
1.150279, -0.1554276, 1.108098, 0, 0, 0, 1, 1,
1.151919, -1.511565, 2.893948, 0, 0, 0, 1, 1,
1.156384, 0.5192663, 1.130848, 0, 0, 0, 1, 1,
1.159162, -0.3849145, 1.14347, 1, 1, 1, 1, 1,
1.160807, -0.2470654, 3.228354, 1, 1, 1, 1, 1,
1.170259, -0.2824865, 1.187557, 1, 1, 1, 1, 1,
1.172194, -1.582809, 2.929936, 1, 1, 1, 1, 1,
1.181382, 1.155272, 0.1265946, 1, 1, 1, 1, 1,
1.18496, -0.6259816, 3.988707, 1, 1, 1, 1, 1,
1.19309, -0.5887408, 0.8924676, 1, 1, 1, 1, 1,
1.193392, 1.192027, 0.4445544, 1, 1, 1, 1, 1,
1.196539, -0.432147, 1.204537, 1, 1, 1, 1, 1,
1.201824, -0.131868, 2.383936, 1, 1, 1, 1, 1,
1.203323, -0.2815441, 0.1240721, 1, 1, 1, 1, 1,
1.207795, -0.1286117, 0.6782534, 1, 1, 1, 1, 1,
1.214409, 2.026115, -0.7439768, 1, 1, 1, 1, 1,
1.216108, -0.569429, 2.141323, 1, 1, 1, 1, 1,
1.223077, 0.5957442, 1.667248, 1, 1, 1, 1, 1,
1.224352, -0.4895154, 1.083824, 0, 0, 1, 1, 1,
1.224839, -0.483992, 1.837641, 1, 0, 0, 1, 1,
1.23269, -0.9220977, 3.360861, 1, 0, 0, 1, 1,
1.234294, -1.089081, 1.161403, 1, 0, 0, 1, 1,
1.236484, -0.6018278, 2.102562, 1, 0, 0, 1, 1,
1.240488, -0.6379297, 3.522988, 1, 0, 0, 1, 1,
1.241605, -0.06111506, 2.743523, 0, 0, 0, 1, 1,
1.244913, 0.06754091, 1.661039, 0, 0, 0, 1, 1,
1.252759, -0.6637627, 2.991067, 0, 0, 0, 1, 1,
1.267561, 1.291912, 1.20882, 0, 0, 0, 1, 1,
1.274369, -2.201233, 2.714342, 0, 0, 0, 1, 1,
1.283957, 0.5873657, -0.514202, 0, 0, 0, 1, 1,
1.285011, -0.4481159, 2.449725, 0, 0, 0, 1, 1,
1.303028, 1.240182, 2.637352, 1, 1, 1, 1, 1,
1.30455, 0.1203503, 0.9274325, 1, 1, 1, 1, 1,
1.312481, -0.321382, 0.4484079, 1, 1, 1, 1, 1,
1.314743, 0.2358763, 2.046751, 1, 1, 1, 1, 1,
1.316947, 1.070157, -0.0009976553, 1, 1, 1, 1, 1,
1.3442, 0.7552425, -0.8889586, 1, 1, 1, 1, 1,
1.344284, 0.9426471, 1.804049, 1, 1, 1, 1, 1,
1.346148, -1.036667, 2.989744, 1, 1, 1, 1, 1,
1.362167, -0.1789521, 2.301024, 1, 1, 1, 1, 1,
1.367479, -2.052067, 1.682268, 1, 1, 1, 1, 1,
1.375055, 1.384495, -0.5259311, 1, 1, 1, 1, 1,
1.389523, 1.374936, 1.951518, 1, 1, 1, 1, 1,
1.392173, -1.339832, 0.7424678, 1, 1, 1, 1, 1,
1.418217, 0.9148691, 2.672812, 1, 1, 1, 1, 1,
1.421362, 1.417025, 0.2475407, 1, 1, 1, 1, 1,
1.434993, -0.4544677, 3.161642, 0, 0, 1, 1, 1,
1.436634, -1.307694, 2.206008, 1, 0, 0, 1, 1,
1.438211, 0.3114952, 0.2062956, 1, 0, 0, 1, 1,
1.43909, -0.4278942, 1.218902, 1, 0, 0, 1, 1,
1.446414, -0.8960071, 1.995972, 1, 0, 0, 1, 1,
1.450465, 0.01920447, 2.022749, 1, 0, 0, 1, 1,
1.466232, 0.9419075, 0.6907119, 0, 0, 0, 1, 1,
1.471725, 0.6524097, 0.3616724, 0, 0, 0, 1, 1,
1.479566, -0.07029964, 1.935279, 0, 0, 0, 1, 1,
1.479586, 0.05531992, 2.839233, 0, 0, 0, 1, 1,
1.481397, -0.7710044, 0.5966963, 0, 0, 0, 1, 1,
1.485268, -0.03185761, 1.945933, 0, 0, 0, 1, 1,
1.503154, 1.021174, 0.8397297, 0, 0, 0, 1, 1,
1.509078, 0.2339336, 0.695976, 1, 1, 1, 1, 1,
1.519737, 2.978275, 1.611614, 1, 1, 1, 1, 1,
1.520215, 0.2379464, 1.124572, 1, 1, 1, 1, 1,
1.529873, -0.4524847, 1.665189, 1, 1, 1, 1, 1,
1.537715, -1.576552, 4.551562, 1, 1, 1, 1, 1,
1.539902, 1.121054, 2.490557, 1, 1, 1, 1, 1,
1.56995, -0.8823367, 3.450977, 1, 1, 1, 1, 1,
1.572265, -1.373942, 1.799063, 1, 1, 1, 1, 1,
1.580137, 1.860826, -1.307976, 1, 1, 1, 1, 1,
1.582384, -0.7531247, 0.4355729, 1, 1, 1, 1, 1,
1.620849, 0.8856934, 0.2835598, 1, 1, 1, 1, 1,
1.629879, -0.2234211, 2.978583, 1, 1, 1, 1, 1,
1.637806, 1.278127, 0.470685, 1, 1, 1, 1, 1,
1.639468, 0.1942318, 0.3683075, 1, 1, 1, 1, 1,
1.640158, 1.057773, 2.946936, 1, 1, 1, 1, 1,
1.6441, -0.2334388, 1.678793, 0, 0, 1, 1, 1,
1.647964, 1.067496, -0.2421066, 1, 0, 0, 1, 1,
1.654647, 1.325864, 0.2817352, 1, 0, 0, 1, 1,
1.65669, -1.18365, 2.461617, 1, 0, 0, 1, 1,
1.66513, 0.09177003, 3.888942, 1, 0, 0, 1, 1,
1.668494, 1.176576, 2.893068, 1, 0, 0, 1, 1,
1.669562, -0.4918668, 1.820308, 0, 0, 0, 1, 1,
1.67359, -0.3472806, 1.811625, 0, 0, 0, 1, 1,
1.678618, 1.025629, 0.1809508, 0, 0, 0, 1, 1,
1.698404, -1.248287, 2.562897, 0, 0, 0, 1, 1,
1.701787, -0.7234197, 0.5253453, 0, 0, 0, 1, 1,
1.71864, -1.50013, 3.499241, 0, 0, 0, 1, 1,
1.722283, 0.5181213, -0.09297235, 0, 0, 0, 1, 1,
1.731864, -0.9575749, 1.39106, 1, 1, 1, 1, 1,
1.744401, -0.2715192, 1.81795, 1, 1, 1, 1, 1,
1.747765, 0.4983219, 1.183996, 1, 1, 1, 1, 1,
1.763239, -1.305472, 1.07076, 1, 1, 1, 1, 1,
1.790792, 0.2697402, 1.074021, 1, 1, 1, 1, 1,
1.795857, -0.4186219, 3.251716, 1, 1, 1, 1, 1,
1.807076, -0.4571932, 0.03156919, 1, 1, 1, 1, 1,
1.807469, -1.053494, 2.311877, 1, 1, 1, 1, 1,
1.816491, -0.9550233, 2.576168, 1, 1, 1, 1, 1,
1.828979, 0.4099806, 0.4926921, 1, 1, 1, 1, 1,
1.850916, -1.494854, -0.4693182, 1, 1, 1, 1, 1,
1.864762, 1.728825, 2.664061, 1, 1, 1, 1, 1,
1.873495, -2.113953, 3.922607, 1, 1, 1, 1, 1,
1.890462, 1.034374, 1.418248, 1, 1, 1, 1, 1,
1.8933, 2.792405, 0.1834376, 1, 1, 1, 1, 1,
1.903501, -0.7829664, 1.360629, 0, 0, 1, 1, 1,
1.904122, -2.378624, 4.640388, 1, 0, 0, 1, 1,
1.937169, -2.552595, 3.249265, 1, 0, 0, 1, 1,
1.963594, 0.6881123, 2.062933, 1, 0, 0, 1, 1,
1.998196, 0.1806158, 2.165262, 1, 0, 0, 1, 1,
2.007658, 1.516268, 2.624357, 1, 0, 0, 1, 1,
2.01473, 1.672254, 1.93277, 0, 0, 0, 1, 1,
2.041334, 0.4549841, 1.029093, 0, 0, 0, 1, 1,
2.048491, -0.08550409, 2.263425, 0, 0, 0, 1, 1,
2.097499, -1.32779, 2.447269, 0, 0, 0, 1, 1,
2.165715, -1.918476, 1.938997, 0, 0, 0, 1, 1,
2.167063, 0.5060854, 3.625182, 0, 0, 0, 1, 1,
2.197067, 0.07555572, 1.831633, 0, 0, 0, 1, 1,
2.236092, -0.4066791, 1.524817, 1, 1, 1, 1, 1,
2.25148, -0.01740703, 1.146047, 1, 1, 1, 1, 1,
2.326596, -0.6233662, 0.7263607, 1, 1, 1, 1, 1,
2.332855, 1.459208, 0.4637419, 1, 1, 1, 1, 1,
2.429652, 0.7885197, 3.089263, 1, 1, 1, 1, 1,
2.743129, 1.115499, 2.139341, 1, 1, 1, 1, 1,
3.073429, -0.4726747, 1.550834, 1, 1, 1, 1, 1
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
var radius = 10.21559;
var distance = 35.88183;
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
mvMatrix.translate( 0.1300745, 0.2995418, -0.4652336 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.88183);
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
