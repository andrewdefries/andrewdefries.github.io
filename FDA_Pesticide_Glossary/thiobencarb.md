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
-3.028252, -1.836257, -2.517207, 1, 0, 0, 1,
-2.717378, -0.296793, 0.2516301, 1, 0.007843138, 0, 1,
-2.419993, 1.430172, -0.9620446, 1, 0.01176471, 0, 1,
-2.406044, -0.7828591, -1.527239, 1, 0.01960784, 0, 1,
-2.26926, 1.13098, -0.7531853, 1, 0.02352941, 0, 1,
-2.26674, -1.041287, -2.180439, 1, 0.03137255, 0, 1,
-2.176614, -0.7627319, -0.5744794, 1, 0.03529412, 0, 1,
-2.157044, 0.7724944, -0.6576436, 1, 0.04313726, 0, 1,
-2.141269, -0.8619655, -2.08563, 1, 0.04705882, 0, 1,
-2.101226, 0.1753115, -3.855224, 1, 0.05490196, 0, 1,
-2.076288, -0.1498219, -1.60704, 1, 0.05882353, 0, 1,
-2.025903, -2.122084, -2.934188, 1, 0.06666667, 0, 1,
-2.024921, 2.820363, -2.776756, 1, 0.07058824, 0, 1,
-2.004491, 0.2256897, -1.632666, 1, 0.07843138, 0, 1,
-1.948793, -0.1325111, 0.4260253, 1, 0.08235294, 0, 1,
-1.918337, 0.3011214, -0.1567162, 1, 0.09019608, 0, 1,
-1.886758, 1.800114, 0.4754058, 1, 0.09411765, 0, 1,
-1.858096, -0.2905473, -1.030409, 1, 0.1019608, 0, 1,
-1.82796, 1.21068, -0.6034727, 1, 0.1098039, 0, 1,
-1.798059, -1.179836, -2.062215, 1, 0.1137255, 0, 1,
-1.797341, -2.547961, -2.420511, 1, 0.1215686, 0, 1,
-1.789307, -0.2620218, -1.500283, 1, 0.1254902, 0, 1,
-1.785139, -1.699172, -4.204709, 1, 0.1333333, 0, 1,
-1.752599, 2.667843, -1.107274, 1, 0.1372549, 0, 1,
-1.742053, -0.1100788, -0.9284993, 1, 0.145098, 0, 1,
-1.73105, 0.7796662, -1.88155, 1, 0.1490196, 0, 1,
-1.707961, 1.290314, -0.7517875, 1, 0.1568628, 0, 1,
-1.699506, 0.9306577, -1.140071, 1, 0.1607843, 0, 1,
-1.691944, -1.225171, -3.635658, 1, 0.1686275, 0, 1,
-1.683358, -0.7289198, -0.485014, 1, 0.172549, 0, 1,
-1.682944, -0.6087479, -0.848929, 1, 0.1803922, 0, 1,
-1.665433, -1.947683, -4.657024, 1, 0.1843137, 0, 1,
-1.663637, 0.2301996, -2.356478, 1, 0.1921569, 0, 1,
-1.650385, -1.030041, -1.629339, 1, 0.1960784, 0, 1,
-1.643821, -0.315143, -1.805919, 1, 0.2039216, 0, 1,
-1.629186, 1.278105, -1.560939, 1, 0.2117647, 0, 1,
-1.621422, 0.0753806, -2.901894, 1, 0.2156863, 0, 1,
-1.612875, 1.339213, -0.8305895, 1, 0.2235294, 0, 1,
-1.612099, 0.9853098, 0.069295, 1, 0.227451, 0, 1,
-1.611398, 0.605546, -1.021798, 1, 0.2352941, 0, 1,
-1.610994, 0.3651568, -0.5189431, 1, 0.2392157, 0, 1,
-1.609925, -0.283417, -1.83102, 1, 0.2470588, 0, 1,
-1.584424, 0.3404107, -2.209049, 1, 0.2509804, 0, 1,
-1.584005, -1.438215, -1.322116, 1, 0.2588235, 0, 1,
-1.576189, -1.483376, -2.793124, 1, 0.2627451, 0, 1,
-1.569928, 0.5093713, -1.356019, 1, 0.2705882, 0, 1,
-1.542656, 1.317738, -0.1354189, 1, 0.2745098, 0, 1,
-1.541927, -0.9074502, -1.995397, 1, 0.282353, 0, 1,
-1.531433, 1.165774, 0.5763244, 1, 0.2862745, 0, 1,
-1.52957, -0.4488952, -0.5395163, 1, 0.2941177, 0, 1,
-1.52621, 0.06860571, -1.922233, 1, 0.3019608, 0, 1,
-1.520795, -1.26637, -1.446316, 1, 0.3058824, 0, 1,
-1.520751, -0.2692834, -1.36162, 1, 0.3137255, 0, 1,
-1.501998, 0.3195134, -1.986232, 1, 0.3176471, 0, 1,
-1.493067, 0.7463712, -0.3611487, 1, 0.3254902, 0, 1,
-1.488177, -0.5228292, -2.084908, 1, 0.3294118, 0, 1,
-1.487046, 0.6748551, -1.154288, 1, 0.3372549, 0, 1,
-1.47042, -0.1804391, -0.5040509, 1, 0.3411765, 0, 1,
-1.468976, -0.05857123, -1.796664, 1, 0.3490196, 0, 1,
-1.462595, 1.426786, -1.010353, 1, 0.3529412, 0, 1,
-1.459426, 0.6713775, -1.135207, 1, 0.3607843, 0, 1,
-1.445608, 1.743767, -1.053028, 1, 0.3647059, 0, 1,
-1.444002, -0.3060315, -4.156841, 1, 0.372549, 0, 1,
-1.435951, 0.1685202, -1.160774, 1, 0.3764706, 0, 1,
-1.434437, 0.6470525, -1.262466, 1, 0.3843137, 0, 1,
-1.402836, 1.647265, -0.858804, 1, 0.3882353, 0, 1,
-1.402147, -0.08866207, -0.8321943, 1, 0.3960784, 0, 1,
-1.391549, 0.5026496, -1.975678, 1, 0.4039216, 0, 1,
-1.378413, -0.8129002, -1.025083, 1, 0.4078431, 0, 1,
-1.368301, -0.9927011, -2.999321, 1, 0.4156863, 0, 1,
-1.361381, -0.9751676, -1.690071, 1, 0.4196078, 0, 1,
-1.360751, 1.321421, -2.040063, 1, 0.427451, 0, 1,
-1.347483, 0.108217, -2.367608, 1, 0.4313726, 0, 1,
-1.338889, 2.342663, -0.5315841, 1, 0.4392157, 0, 1,
-1.337251, -0.7049999, -1.698643, 1, 0.4431373, 0, 1,
-1.333412, 1.289265, -1.284524, 1, 0.4509804, 0, 1,
-1.314392, -0.3275656, -2.105973, 1, 0.454902, 0, 1,
-1.313957, 0.8922917, -1.656144, 1, 0.4627451, 0, 1,
-1.309815, 0.3473586, -0.2157039, 1, 0.4666667, 0, 1,
-1.292506, -0.8795569, -2.795805, 1, 0.4745098, 0, 1,
-1.29114, 1.168624, -0.6315006, 1, 0.4784314, 0, 1,
-1.287577, 0.8134512, -0.941511, 1, 0.4862745, 0, 1,
-1.279432, -0.9052101, -0.8641655, 1, 0.4901961, 0, 1,
-1.277097, -0.8113454, 0.1861608, 1, 0.4980392, 0, 1,
-1.271699, 0.0361223, -0.9714078, 1, 0.5058824, 0, 1,
-1.242822, 1.616063, -1.19915, 1, 0.509804, 0, 1,
-1.234569, -0.1741651, -1.298225, 1, 0.5176471, 0, 1,
-1.230914, 0.07038218, -1.877211, 1, 0.5215687, 0, 1,
-1.222604, 0.7249315, -1.134353, 1, 0.5294118, 0, 1,
-1.221429, -0.06429729, -3.054124, 1, 0.5333334, 0, 1,
-1.211105, -2.057188, -4.809345, 1, 0.5411765, 0, 1,
-1.210924, 1.392447, 0.6055656, 1, 0.5450981, 0, 1,
-1.208466, 0.502098, -0.9745883, 1, 0.5529412, 0, 1,
-1.205935, -0.9304971, -1.841608, 1, 0.5568628, 0, 1,
-1.181181, -0.06958465, -2.340451, 1, 0.5647059, 0, 1,
-1.178959, 0.4060546, -1.991869, 1, 0.5686275, 0, 1,
-1.177055, 0.9823416, -1.262526, 1, 0.5764706, 0, 1,
-1.17678, -0.5985805, -0.03437617, 1, 0.5803922, 0, 1,
-1.172452, -1.03547, -1.3739, 1, 0.5882353, 0, 1,
-1.169591, -0.3988143, -2.061502, 1, 0.5921569, 0, 1,
-1.164264, -0.5909695, -2.857556, 1, 0.6, 0, 1,
-1.163082, -1.04462, -4.032954, 1, 0.6078432, 0, 1,
-1.149484, -0.5520595, -1.911676, 1, 0.6117647, 0, 1,
-1.145352, 0.1295554, -1.994758, 1, 0.6196079, 0, 1,
-1.143592, 0.9495496, -0.3548301, 1, 0.6235294, 0, 1,
-1.137353, -0.7536314, -2.911812, 1, 0.6313726, 0, 1,
-1.135102, -0.6476594, -0.9691393, 1, 0.6352941, 0, 1,
-1.134168, 0.7900648, -0.9328674, 1, 0.6431373, 0, 1,
-1.13143, -0.9038562, -1.951968, 1, 0.6470588, 0, 1,
-1.127795, 0.3980967, -1.818576, 1, 0.654902, 0, 1,
-1.110825, 0.67758, -1.183482, 1, 0.6588235, 0, 1,
-1.108569, -1.094405, -2.803064, 1, 0.6666667, 0, 1,
-1.091637, -0.5057678, -1.624889, 1, 0.6705883, 0, 1,
-1.088015, 1.254709, -0.09704618, 1, 0.6784314, 0, 1,
-1.085606, -0.1000104, -1.746904, 1, 0.682353, 0, 1,
-1.084267, 0.09011534, -3.331586, 1, 0.6901961, 0, 1,
-1.076056, 0.06516939, -0.2342443, 1, 0.6941177, 0, 1,
-1.075848, 1.014954, -1.231534, 1, 0.7019608, 0, 1,
-1.075753, -0.5705767, -1.745238, 1, 0.7098039, 0, 1,
-1.074607, 0.5312262, -0.4943365, 1, 0.7137255, 0, 1,
-1.067804, 1.827851, -1.525192, 1, 0.7215686, 0, 1,
-1.063063, 1.110508, -0.9616342, 1, 0.7254902, 0, 1,
-1.05793, -0.04912118, -2.067957, 1, 0.7333333, 0, 1,
-1.054322, 0.8774231, 2.029565, 1, 0.7372549, 0, 1,
-1.052352, 0.1400731, -1.341203, 1, 0.7450981, 0, 1,
-1.028906, -0.550616, -3.154009, 1, 0.7490196, 0, 1,
-1.028865, 0.240156, -0.5865774, 1, 0.7568628, 0, 1,
-1.02758, -0.5595472, -2.67647, 1, 0.7607843, 0, 1,
-1.017456, -1.776779, -1.897239, 1, 0.7686275, 0, 1,
-1.014617, 0.6132144, -0.8689836, 1, 0.772549, 0, 1,
-1.014237, -0.9704974, -2.726071, 1, 0.7803922, 0, 1,
-1.010931, -0.3593906, -2.810046, 1, 0.7843137, 0, 1,
-1.010294, 0.6001564, -2.802036, 1, 0.7921569, 0, 1,
-0.9798198, 0.424609, -1.322031, 1, 0.7960784, 0, 1,
-0.9724162, 1.076361, -0.3206542, 1, 0.8039216, 0, 1,
-0.9667432, -1.20229, -2.863524, 1, 0.8117647, 0, 1,
-0.9649184, 0.1285323, -1.147457, 1, 0.8156863, 0, 1,
-0.9597609, -2.291581, -2.86573, 1, 0.8235294, 0, 1,
-0.9493321, -1.000364, -1.527426, 1, 0.827451, 0, 1,
-0.9451243, -0.9785808, -2.512022, 1, 0.8352941, 0, 1,
-0.9401201, 0.8974128, -1.985406, 1, 0.8392157, 0, 1,
-0.9371693, 0.9644608, -0.6464801, 1, 0.8470588, 0, 1,
-0.9345178, 2.031437, -2.118216, 1, 0.8509804, 0, 1,
-0.9334939, -0.004823347, -2.745847, 1, 0.8588235, 0, 1,
-0.9284909, -0.8354816, -2.038232, 1, 0.8627451, 0, 1,
-0.9236146, -0.3719181, -2.487487, 1, 0.8705882, 0, 1,
-0.9170063, 1.257129, -1.801299, 1, 0.8745098, 0, 1,
-0.9086002, -1.267864, -2.353793, 1, 0.8823529, 0, 1,
-0.9082893, -0.7371565, -0.3506806, 1, 0.8862745, 0, 1,
-0.9051112, 0.8767059, -1.879879, 1, 0.8941177, 0, 1,
-0.9044368, 0.3555385, 0.5748975, 1, 0.8980392, 0, 1,
-0.904094, 0.1730331, -0.8682948, 1, 0.9058824, 0, 1,
-0.9015525, -0.6420013, -2.475443, 1, 0.9137255, 0, 1,
-0.9009382, -0.5220291, -2.518447, 1, 0.9176471, 0, 1,
-0.8996913, 0.3120963, -0.8202605, 1, 0.9254902, 0, 1,
-0.8993743, -0.195211, -1.392564, 1, 0.9294118, 0, 1,
-0.8980353, -1.647952, -1.315405, 1, 0.9372549, 0, 1,
-0.8955525, 1.303116, -0.129009, 1, 0.9411765, 0, 1,
-0.8925182, 0.6917625, -1.498152, 1, 0.9490196, 0, 1,
-0.8921583, -0.7198913, -2.533702, 1, 0.9529412, 0, 1,
-0.8901672, -0.1632426, -0.7808478, 1, 0.9607843, 0, 1,
-0.8883657, 1.025675, -0.1230272, 1, 0.9647059, 0, 1,
-0.8873037, -0.5945486, -1.353107, 1, 0.972549, 0, 1,
-0.882491, -0.77224, 0.002589411, 1, 0.9764706, 0, 1,
-0.8769044, 1.189011, -1.485352, 1, 0.9843137, 0, 1,
-0.8764613, 0.1198465, -1.204778, 1, 0.9882353, 0, 1,
-0.8690877, -0.6915677, -1.769329, 1, 0.9960784, 0, 1,
-0.8690524, -0.6501756, -2.068411, 0.9960784, 1, 0, 1,
-0.8681469, -0.1810761, -1.268137, 0.9921569, 1, 0, 1,
-0.8632878, 0.9031928, -1.181066, 0.9843137, 1, 0, 1,
-0.8549408, 0.5494096, -1.46722, 0.9803922, 1, 0, 1,
-0.8526944, -0.8517756, -2.919436, 0.972549, 1, 0, 1,
-0.8519812, -1.181228, -1.220493, 0.9686275, 1, 0, 1,
-0.8514706, 0.1878041, -2.534356, 0.9607843, 1, 0, 1,
-0.8476318, -0.9690186, -1.474365, 0.9568627, 1, 0, 1,
-0.8457382, 0.8248274, -1.150353, 0.9490196, 1, 0, 1,
-0.8444685, 0.544866, -0.8808896, 0.945098, 1, 0, 1,
-0.8362151, 1.695247, 0.2688427, 0.9372549, 1, 0, 1,
-0.8352631, -0.3882932, -0.5295495, 0.9333333, 1, 0, 1,
-0.8319759, 0.3284255, -1.294011, 0.9254902, 1, 0, 1,
-0.8304216, -1.73421, -2.213751, 0.9215686, 1, 0, 1,
-0.8288603, -1.616788, -4.267971, 0.9137255, 1, 0, 1,
-0.8282353, -0.4251775, -4.079711, 0.9098039, 1, 0, 1,
-0.8267694, -0.003389397, -1.500736, 0.9019608, 1, 0, 1,
-0.8253483, -0.3595027, -2.472535, 0.8941177, 1, 0, 1,
-0.8184173, 0.4743294, -2.453321, 0.8901961, 1, 0, 1,
-0.8051355, 0.8334594, -1.976782, 0.8823529, 1, 0, 1,
-0.8038401, -0.3405441, -0.9624929, 0.8784314, 1, 0, 1,
-0.8010378, -0.7649965, -2.729671, 0.8705882, 1, 0, 1,
-0.7928668, 0.8234804, 0.5542946, 0.8666667, 1, 0, 1,
-0.7911121, 1.200605, 0.4511888, 0.8588235, 1, 0, 1,
-0.7882755, -0.05427084, -5.87559, 0.854902, 1, 0, 1,
-0.7862557, -0.7098998, -2.503006, 0.8470588, 1, 0, 1,
-0.7810339, 1.73312, 0.9480953, 0.8431373, 1, 0, 1,
-0.7771571, -1.04996, -2.600552, 0.8352941, 1, 0, 1,
-0.7753639, 1.320622, -2.329966, 0.8313726, 1, 0, 1,
-0.7708231, 1.000444, -0.1894348, 0.8235294, 1, 0, 1,
-0.7705591, -0.6779723, -2.876987, 0.8196079, 1, 0, 1,
-0.7680738, 0.8420315, -0.7478897, 0.8117647, 1, 0, 1,
-0.7664739, 1.887654, -2.444472, 0.8078431, 1, 0, 1,
-0.7660646, -0.3849959, -3.514332, 0.8, 1, 0, 1,
-0.7646475, 0.07336019, -2.17815, 0.7921569, 1, 0, 1,
-0.7592695, 1.078239, 0.06709282, 0.7882353, 1, 0, 1,
-0.7549842, 0.5714195, -1.532349, 0.7803922, 1, 0, 1,
-0.7522218, 1.31433, -0.3044536, 0.7764706, 1, 0, 1,
-0.7463347, 0.6787263, -0.6557816, 0.7686275, 1, 0, 1,
-0.7428295, 0.5563595, 0.1218975, 0.7647059, 1, 0, 1,
-0.736917, 0.01441974, -1.436157, 0.7568628, 1, 0, 1,
-0.7350714, 1.059711, -0.5734098, 0.7529412, 1, 0, 1,
-0.7267038, 1.695406, 0.7238709, 0.7450981, 1, 0, 1,
-0.7256894, 0.1371029, -0.5932234, 0.7411765, 1, 0, 1,
-0.7240627, -1.242382, -2.519552, 0.7333333, 1, 0, 1,
-0.7239903, 0.3952034, -2.322258, 0.7294118, 1, 0, 1,
-0.7239467, -1.021647, -3.555511, 0.7215686, 1, 0, 1,
-0.7225108, -0.3174505, -2.804554, 0.7176471, 1, 0, 1,
-0.7196189, 0.1863461, -0.5146905, 0.7098039, 1, 0, 1,
-0.7179422, 0.5492612, -1.568431, 0.7058824, 1, 0, 1,
-0.7129392, 1.13755, -0.4099987, 0.6980392, 1, 0, 1,
-0.7108066, -0.5031528, -2.098374, 0.6901961, 1, 0, 1,
-0.7032852, 0.9727435, 0.2167893, 0.6862745, 1, 0, 1,
-0.702441, 0.608947, -2.712063, 0.6784314, 1, 0, 1,
-0.7020941, -1.156173, -2.565015, 0.6745098, 1, 0, 1,
-0.7016352, 1.609176, 0.05253581, 0.6666667, 1, 0, 1,
-0.7009666, -0.08820532, -2.557817, 0.6627451, 1, 0, 1,
-0.6999711, -0.2596764, -1.859065, 0.654902, 1, 0, 1,
-0.6950312, 2.147417, -0.930267, 0.6509804, 1, 0, 1,
-0.6890533, -1.53835, -2.033849, 0.6431373, 1, 0, 1,
-0.6880996, -0.9481015, -1.959615, 0.6392157, 1, 0, 1,
-0.6876944, 0.3496342, -0.4307224, 0.6313726, 1, 0, 1,
-0.6865306, -2.050491, -4.394987, 0.627451, 1, 0, 1,
-0.6840152, 1.176597, -0.8033878, 0.6196079, 1, 0, 1,
-0.6786118, -1.151667, -1.160653, 0.6156863, 1, 0, 1,
-0.675155, -0.3735384, -1.902729, 0.6078432, 1, 0, 1,
-0.6641085, -0.5576574, -2.467352, 0.6039216, 1, 0, 1,
-0.6627006, -0.5844951, -2.753618, 0.5960785, 1, 0, 1,
-0.662128, 0.7572707, -1.289555, 0.5882353, 1, 0, 1,
-0.6579837, 0.127892, -1.090768, 0.5843138, 1, 0, 1,
-0.6571627, 0.7785804, 0.7497586, 0.5764706, 1, 0, 1,
-0.6570449, -0.6225061, -1.70708, 0.572549, 1, 0, 1,
-0.6531842, -0.1848434, -2.615831, 0.5647059, 1, 0, 1,
-0.6523542, -1.093895, -2.998709, 0.5607843, 1, 0, 1,
-0.6512285, 1.498653, -0.5398411, 0.5529412, 1, 0, 1,
-0.6381185, 0.1965509, -1.154592, 0.5490196, 1, 0, 1,
-0.6353807, -0.3643927, -2.543819, 0.5411765, 1, 0, 1,
-0.630456, -0.4524976, -1.139599, 0.5372549, 1, 0, 1,
-0.6297897, 0.1304425, -2.050803, 0.5294118, 1, 0, 1,
-0.6285409, 0.3709269, -0.3653228, 0.5254902, 1, 0, 1,
-0.628525, 2.233062, 0.9082514, 0.5176471, 1, 0, 1,
-0.6249864, -0.6152048, -2.432007, 0.5137255, 1, 0, 1,
-0.6247221, -1.447768, -3.534849, 0.5058824, 1, 0, 1,
-0.6244449, -1.480331, -3.898267, 0.5019608, 1, 0, 1,
-0.6230029, -2.105701, -2.364668, 0.4941176, 1, 0, 1,
-0.6212025, 0.06062911, -3.795261, 0.4862745, 1, 0, 1,
-0.617931, 0.6874205, -0.7583516, 0.4823529, 1, 0, 1,
-0.6167425, 0.7699255, 0.6015511, 0.4745098, 1, 0, 1,
-0.6131446, 0.1282351, -1.91503, 0.4705882, 1, 0, 1,
-0.6104006, 0.2044815, -2.0074, 0.4627451, 1, 0, 1,
-0.6054457, 1.456409, -0.5911634, 0.4588235, 1, 0, 1,
-0.6019939, 1.500069, -0.0112209, 0.4509804, 1, 0, 1,
-0.6015178, -0.8646108, -0.782759, 0.4470588, 1, 0, 1,
-0.5993667, 1.359371, -0.7257385, 0.4392157, 1, 0, 1,
-0.5991144, -1.352349, -3.02187, 0.4352941, 1, 0, 1,
-0.5974954, -0.4502375, -2.472131, 0.427451, 1, 0, 1,
-0.5960935, 1.319625, 0.5922688, 0.4235294, 1, 0, 1,
-0.5943257, -1.095865, -3.119619, 0.4156863, 1, 0, 1,
-0.5899515, 0.6206473, 0.4773202, 0.4117647, 1, 0, 1,
-0.5869023, 1.656817, -0.3053444, 0.4039216, 1, 0, 1,
-0.5832854, 0.494718, -1.103039, 0.3960784, 1, 0, 1,
-0.5772706, 0.001576453, -0.6295282, 0.3921569, 1, 0, 1,
-0.574239, 0.6702408, -0.4005373, 0.3843137, 1, 0, 1,
-0.5717834, -0.3964688, -2.253715, 0.3803922, 1, 0, 1,
-0.5707068, -1.618241, -3.244911, 0.372549, 1, 0, 1,
-0.5667815, 0.2954517, -1.849642, 0.3686275, 1, 0, 1,
-0.5646151, -1.038822, -2.85063, 0.3607843, 1, 0, 1,
-0.5643825, -0.5524861, -2.29057, 0.3568628, 1, 0, 1,
-0.5610411, 0.767482, -1.010516, 0.3490196, 1, 0, 1,
-0.5598996, 3.48479, 0.9094886, 0.345098, 1, 0, 1,
-0.559703, 0.7766515, -0.3961195, 0.3372549, 1, 0, 1,
-0.5587123, 0.5378992, -1.48911, 0.3333333, 1, 0, 1,
-0.557944, 0.9070507, -0.3232329, 0.3254902, 1, 0, 1,
-0.5552474, -0.3628728, -2.965229, 0.3215686, 1, 0, 1,
-0.5480933, -0.3508105, -0.8981603, 0.3137255, 1, 0, 1,
-0.5466293, 0.3290455, -0.4634501, 0.3098039, 1, 0, 1,
-0.5445704, 0.2694328, -0.5382019, 0.3019608, 1, 0, 1,
-0.5436515, -0.775551, -2.981011, 0.2941177, 1, 0, 1,
-0.5382803, 0.434846, -1.750021, 0.2901961, 1, 0, 1,
-0.5349292, 0.3871061, -2.201568, 0.282353, 1, 0, 1,
-0.5338733, -1.863931, -3.892854, 0.2784314, 1, 0, 1,
-0.5311376, 0.8233339, 0.2627537, 0.2705882, 1, 0, 1,
-0.5303426, 0.7533816, -1.046462, 0.2666667, 1, 0, 1,
-0.5291384, -0.4161528, -1.972, 0.2588235, 1, 0, 1,
-0.5250807, 0.05557467, -1.373795, 0.254902, 1, 0, 1,
-0.5207477, -1.400156, -1.889897, 0.2470588, 1, 0, 1,
-0.5183957, -0.3263921, -2.52534, 0.2431373, 1, 0, 1,
-0.5136831, -0.7398612, -3.292344, 0.2352941, 1, 0, 1,
-0.5125721, 1.002311, -0.1465046, 0.2313726, 1, 0, 1,
-0.5045002, -1.661523, -3.593819, 0.2235294, 1, 0, 1,
-0.5026292, -0.7537489, -3.276253, 0.2196078, 1, 0, 1,
-0.5000618, 0.6350733, -0.7311885, 0.2117647, 1, 0, 1,
-0.4996613, 1.245966, -1.952466, 0.2078431, 1, 0, 1,
-0.4985496, 0.7709975, 0.2937942, 0.2, 1, 0, 1,
-0.4977268, -0.7115075, -3.371469, 0.1921569, 1, 0, 1,
-0.4925703, 1.523472, -1.4621, 0.1882353, 1, 0, 1,
-0.4914463, 0.1574919, 0.1886419, 0.1803922, 1, 0, 1,
-0.4911451, 1.951174, 0.8202868, 0.1764706, 1, 0, 1,
-0.491043, 0.7555391, -0.4638377, 0.1686275, 1, 0, 1,
-0.4867078, 2.076903, -1.248323, 0.1647059, 1, 0, 1,
-0.4856445, -1.250953, -3.288183, 0.1568628, 1, 0, 1,
-0.4832106, -1.317387, -2.681296, 0.1529412, 1, 0, 1,
-0.4766415, 0.1502496, -1.274559, 0.145098, 1, 0, 1,
-0.4764232, 0.5040101, -1.556132, 0.1411765, 1, 0, 1,
-0.4741157, -0.09429842, -1.456871, 0.1333333, 1, 0, 1,
-0.4741096, 0.4025749, -2.284417, 0.1294118, 1, 0, 1,
-0.4736308, 0.8551047, 1.318778, 0.1215686, 1, 0, 1,
-0.4724194, -1.947221, -1.012275, 0.1176471, 1, 0, 1,
-0.4702957, -0.6271757, -1.637945, 0.1098039, 1, 0, 1,
-0.4650602, 0.6001421, -0.300862, 0.1058824, 1, 0, 1,
-0.4624656, -0.1130224, -2.196197, 0.09803922, 1, 0, 1,
-0.4615892, -0.2813239, -3.022217, 0.09019608, 1, 0, 1,
-0.4588578, 1.087733, -0.7214553, 0.08627451, 1, 0, 1,
-0.4588217, -0.6478245, -1.63997, 0.07843138, 1, 0, 1,
-0.4569007, -0.1382651, -3.416977, 0.07450981, 1, 0, 1,
-0.453105, -0.1216262, -1.722321, 0.06666667, 1, 0, 1,
-0.4502174, 0.7285625, -0.7751769, 0.0627451, 1, 0, 1,
-0.4497624, -0.3511627, -0.9903802, 0.05490196, 1, 0, 1,
-0.4472961, 0.7083616, -1.625405, 0.05098039, 1, 0, 1,
-0.4471124, -0.3651732, -2.781805, 0.04313726, 1, 0, 1,
-0.4467833, -0.9118505, -2.803602, 0.03921569, 1, 0, 1,
-0.4446317, 0.3141952, -2.117261, 0.03137255, 1, 0, 1,
-0.4423168, 0.9927884, -1.339726, 0.02745098, 1, 0, 1,
-0.4418417, -1.212079, -0.7559391, 0.01960784, 1, 0, 1,
-0.43953, 0.210005, -0.56765, 0.01568628, 1, 0, 1,
-0.4391402, -1.007643, -3.498668, 0.007843138, 1, 0, 1,
-0.4377483, 1.025232, 0.5036572, 0.003921569, 1, 0, 1,
-0.432694, 1.357404, -2.176084, 0, 1, 0.003921569, 1,
-0.4323273, 0.6888891, -0.2398888, 0, 1, 0.01176471, 1,
-0.427773, -0.5952789, -3.377848, 0, 1, 0.01568628, 1,
-0.4233347, 0.9375957, 0.1908167, 0, 1, 0.02352941, 1,
-0.4216737, -1.157349, -1.955242, 0, 1, 0.02745098, 1,
-0.4206007, 0.8336457, -0.3456855, 0, 1, 0.03529412, 1,
-0.4165016, 0.3993856, 0.6039087, 0, 1, 0.03921569, 1,
-0.4155359, 0.4558106, -1.402331, 0, 1, 0.04705882, 1,
-0.415474, -1.996336, -3.239213, 0, 1, 0.05098039, 1,
-0.4153683, -0.6336487, -1.714648, 0, 1, 0.05882353, 1,
-0.4122881, -1.920618, -1.869286, 0, 1, 0.0627451, 1,
-0.4088505, -0.4996321, -3.837917, 0, 1, 0.07058824, 1,
-0.4088145, 0.169857, -1.851768, 0, 1, 0.07450981, 1,
-0.407879, 1.418091, 0.5201368, 0, 1, 0.08235294, 1,
-0.4008255, -0.02709181, 0.9704738, 0, 1, 0.08627451, 1,
-0.3978056, 1.272056, -0.6028495, 0, 1, 0.09411765, 1,
-0.3975752, -0.006968225, -1.991111, 0, 1, 0.1019608, 1,
-0.3967525, -1.400432, -2.019349, 0, 1, 0.1058824, 1,
-0.3926004, 0.4447705, -0.2213742, 0, 1, 0.1137255, 1,
-0.3873275, 1.693332, 1.123168, 0, 1, 0.1176471, 1,
-0.3830298, 0.8735712, -0.7220594, 0, 1, 0.1254902, 1,
-0.3786097, 1.628138, -0.5007867, 0, 1, 0.1294118, 1,
-0.375209, -0.08019259, -0.8226236, 0, 1, 0.1372549, 1,
-0.3714046, -0.4959762, -0.4870457, 0, 1, 0.1411765, 1,
-0.3608152, 1.168451, 0.1895046, 0, 1, 0.1490196, 1,
-0.3511941, 1.295852, -0.1477767, 0, 1, 0.1529412, 1,
-0.3506098, -0.9414911, -3.94668, 0, 1, 0.1607843, 1,
-0.3504159, 0.1187609, -1.375914, 0, 1, 0.1647059, 1,
-0.3489169, -1.340291, -1.723344, 0, 1, 0.172549, 1,
-0.3477217, 1.127552, 0.1031358, 0, 1, 0.1764706, 1,
-0.3454942, 1.866272, -1.033205, 0, 1, 0.1843137, 1,
-0.3446504, -0.7518415, -3.525733, 0, 1, 0.1882353, 1,
-0.3411367, -0.8240014, -2.08427, 0, 1, 0.1960784, 1,
-0.3376229, 0.2671345, -1.904062, 0, 1, 0.2039216, 1,
-0.3372856, 1.232269, 1.932945, 0, 1, 0.2078431, 1,
-0.3342575, -0.4601414, -1.516857, 0, 1, 0.2156863, 1,
-0.3286105, -2.300195, -2.823319, 0, 1, 0.2196078, 1,
-0.3260096, -1.175486, -2.753077, 0, 1, 0.227451, 1,
-0.3253268, -0.1558237, 0.3113133, 0, 1, 0.2313726, 1,
-0.3231402, 0.3911883, -1.846706, 0, 1, 0.2392157, 1,
-0.3219522, -0.6634937, -1.696766, 0, 1, 0.2431373, 1,
-0.3212058, 0.4869711, 1.181148, 0, 1, 0.2509804, 1,
-0.3200217, 0.3192352, -1.409834, 0, 1, 0.254902, 1,
-0.3170832, 1.307755, -0.7684991, 0, 1, 0.2627451, 1,
-0.3167286, -1.871525, -1.314194, 0, 1, 0.2666667, 1,
-0.3125708, -0.09954799, -1.466025, 0, 1, 0.2745098, 1,
-0.3080908, 0.21244, -1.811819, 0, 1, 0.2784314, 1,
-0.3033744, -0.06056498, -1.384563, 0, 1, 0.2862745, 1,
-0.3011207, -0.3399639, -1.794002, 0, 1, 0.2901961, 1,
-0.2994544, -0.2360063, -1.278703, 0, 1, 0.2980392, 1,
-0.2959822, 1.634331, 1.235237, 0, 1, 0.3058824, 1,
-0.2958654, 0.7738814, 0.8140945, 0, 1, 0.3098039, 1,
-0.2958154, -0.4233442, -2.965947, 0, 1, 0.3176471, 1,
-0.2928262, 0.9694635, -0.5738135, 0, 1, 0.3215686, 1,
-0.2903628, -0.7840278, -2.638503, 0, 1, 0.3294118, 1,
-0.2858709, 1.997304, 0.575079, 0, 1, 0.3333333, 1,
-0.2836678, -0.08947247, -2.58106, 0, 1, 0.3411765, 1,
-0.2788463, 0.7578617, 0.09670895, 0, 1, 0.345098, 1,
-0.2772311, 1.746814, -0.539698, 0, 1, 0.3529412, 1,
-0.2735259, 0.1996228, -1.048558, 0, 1, 0.3568628, 1,
-0.2698992, -0.7913638, -3.099308, 0, 1, 0.3647059, 1,
-0.2669327, 0.01078296, -3.135912, 0, 1, 0.3686275, 1,
-0.2656704, -1.617907, -1.624364, 0, 1, 0.3764706, 1,
-0.2654818, -0.3673529, -3.091274, 0, 1, 0.3803922, 1,
-0.2612497, -2.330964, -3.835174, 0, 1, 0.3882353, 1,
-0.2576286, -0.6658137, -2.415435, 0, 1, 0.3921569, 1,
-0.2539821, -0.8924646, -3.026312, 0, 1, 0.4, 1,
-0.2481731, 0.2864315, -0.04859625, 0, 1, 0.4078431, 1,
-0.2435219, -1.818102, -1.40835, 0, 1, 0.4117647, 1,
-0.2306411, -0.1580771, -1.159227, 0, 1, 0.4196078, 1,
-0.2272756, -0.3947413, -2.60752, 0, 1, 0.4235294, 1,
-0.2250804, 1.621823, 2.644452, 0, 1, 0.4313726, 1,
-0.21278, 0.986569, -2.306298, 0, 1, 0.4352941, 1,
-0.2112975, -1.194361, -2.090257, 0, 1, 0.4431373, 1,
-0.2109536, -1.129369, -2.648311, 0, 1, 0.4470588, 1,
-0.2097451, -0.1823161, -1.337716, 0, 1, 0.454902, 1,
-0.2090439, 0.146195, -1.92852, 0, 1, 0.4588235, 1,
-0.2086301, 0.01719365, -0.6781152, 0, 1, 0.4666667, 1,
-0.2074462, -0.04701843, -1.082221, 0, 1, 0.4705882, 1,
-0.2016184, -0.5283125, -2.267758, 0, 1, 0.4784314, 1,
-0.196401, 0.3583371, 0.7638752, 0, 1, 0.4823529, 1,
-0.188692, -0.04192219, -2.351982, 0, 1, 0.4901961, 1,
-0.1862138, -0.06737658, -3.927485, 0, 1, 0.4941176, 1,
-0.182269, -0.961249, -1.764402, 0, 1, 0.5019608, 1,
-0.1816573, 1.14238, 0.8611113, 0, 1, 0.509804, 1,
-0.1807782, -0.7812544, -2.537957, 0, 1, 0.5137255, 1,
-0.1786853, 0.8344744, 0.433839, 0, 1, 0.5215687, 1,
-0.1766329, 0.401528, -1.733878, 0, 1, 0.5254902, 1,
-0.1745753, 0.2452623, -0.8460568, 0, 1, 0.5333334, 1,
-0.1736799, -0.4569886, -1.635605, 0, 1, 0.5372549, 1,
-0.1734421, 1.129075, 0.02848335, 0, 1, 0.5450981, 1,
-0.1720111, 0.04235754, -1.683558, 0, 1, 0.5490196, 1,
-0.1719888, -0.01499949, 0.5234987, 0, 1, 0.5568628, 1,
-0.1716053, 1.559288, -0.285689, 0, 1, 0.5607843, 1,
-0.1657464, 0.02220579, -1.354698, 0, 1, 0.5686275, 1,
-0.1641923, 0.4691353, -0.7301179, 0, 1, 0.572549, 1,
-0.163761, -1.334084, -2.198419, 0, 1, 0.5803922, 1,
-0.1619309, -0.5754329, -4.285352, 0, 1, 0.5843138, 1,
-0.1597852, 0.9245622, 0.7621039, 0, 1, 0.5921569, 1,
-0.154653, -2.075031, -1.871022, 0, 1, 0.5960785, 1,
-0.1488757, 0.6750631, -0.07543895, 0, 1, 0.6039216, 1,
-0.1485748, 0.08958275, -1.973947, 0, 1, 0.6117647, 1,
-0.1461788, 0.9735884, 0.76235, 0, 1, 0.6156863, 1,
-0.145945, -1.323712, -2.800241, 0, 1, 0.6235294, 1,
-0.1440315, -0.8342638, -1.592622, 0, 1, 0.627451, 1,
-0.1419068, 0.3495286, -1.033606, 0, 1, 0.6352941, 1,
-0.1417044, 1.385334, 0.5301445, 0, 1, 0.6392157, 1,
-0.1347206, 0.2928413, -0.1277715, 0, 1, 0.6470588, 1,
-0.1336168, 0.3394271, 0.06641698, 0, 1, 0.6509804, 1,
-0.1324431, 0.9213446, 1.261719, 0, 1, 0.6588235, 1,
-0.1294966, -0.9340268, -3.828854, 0, 1, 0.6627451, 1,
-0.1208051, 0.7833849, -0.3864606, 0, 1, 0.6705883, 1,
-0.1207355, -1.250373, -1.224231, 0, 1, 0.6745098, 1,
-0.1204464, -0.2646495, -1.751859, 0, 1, 0.682353, 1,
-0.1197559, -0.5492269, -3.429976, 0, 1, 0.6862745, 1,
-0.1173542, 0.27218, 0.5788568, 0, 1, 0.6941177, 1,
-0.115679, 0.08557143, -0.109674, 0, 1, 0.7019608, 1,
-0.1126184, -1.470058, -2.803805, 0, 1, 0.7058824, 1,
-0.1004179, 0.4308796, -0.5287222, 0, 1, 0.7137255, 1,
-0.09685583, -0.3303129, -3.058979, 0, 1, 0.7176471, 1,
-0.09158088, 0.4783195, -0.5987732, 0, 1, 0.7254902, 1,
-0.09150428, 0.9490381, 0.6720571, 0, 1, 0.7294118, 1,
-0.09092458, -0.1163994, -1.288022, 0, 1, 0.7372549, 1,
-0.08964944, -0.1273832, -2.181587, 0, 1, 0.7411765, 1,
-0.08794412, -0.6335585, -1.241678, 0, 1, 0.7490196, 1,
-0.08087997, 0.8910274, -0.8383686, 0, 1, 0.7529412, 1,
-0.08070498, 0.1362262, 0.06893083, 0, 1, 0.7607843, 1,
-0.07571998, 1.675164, 0.2166685, 0, 1, 0.7647059, 1,
-0.07494093, -0.9095764, -3.661337, 0, 1, 0.772549, 1,
-0.06664053, 1.160888, -0.8894931, 0, 1, 0.7764706, 1,
-0.06640808, 1.135506, -0.7631316, 0, 1, 0.7843137, 1,
-0.06520624, 0.1899465, -0.09798793, 0, 1, 0.7882353, 1,
-0.06506058, -0.2604588, -2.827039, 0, 1, 0.7960784, 1,
-0.05435113, 1.566398, 0.1135825, 0, 1, 0.8039216, 1,
-0.05126848, -1.336234, -2.177702, 0, 1, 0.8078431, 1,
-0.04951978, -1.512357, -1.590953, 0, 1, 0.8156863, 1,
-0.04698898, -1.498375, -3.28814, 0, 1, 0.8196079, 1,
-0.04493871, -1.077109, -4.076988, 0, 1, 0.827451, 1,
-0.03635076, -0.7781144, -2.877898, 0, 1, 0.8313726, 1,
-0.03624642, -1.304792, -2.818558, 0, 1, 0.8392157, 1,
-0.03600549, 0.2112367, 0.5517011, 0, 1, 0.8431373, 1,
-0.03572535, 0.5417298, 0.8490828, 0, 1, 0.8509804, 1,
-0.03549283, -0.7716307, -3.070368, 0, 1, 0.854902, 1,
-0.0323016, -1.445317, -4.297178, 0, 1, 0.8627451, 1,
-0.02741604, -2.628515, -3.076501, 0, 1, 0.8666667, 1,
-0.02716455, 0.4087293, 1.334679, 0, 1, 0.8745098, 1,
-0.02707716, 0.160668, 0.5900766, 0, 1, 0.8784314, 1,
-0.02690819, -0.04074044, -3.848613, 0, 1, 0.8862745, 1,
-0.02147304, -0.4880077, -4.830292, 0, 1, 0.8901961, 1,
-0.01939613, -0.2744408, -2.79647, 0, 1, 0.8980392, 1,
-0.01742976, 0.4968958, 1.126203, 0, 1, 0.9058824, 1,
-0.01656264, -1.066966, -1.769892, 0, 1, 0.9098039, 1,
-0.008983793, 1.414412, 0.6608126, 0, 1, 0.9176471, 1,
-0.002138745, 1.460672, 0.2006993, 0, 1, 0.9215686, 1,
0.006452278, 0.5690449, -3.147105, 0, 1, 0.9294118, 1,
0.00848436, 0.1740929, 0.8283428, 0, 1, 0.9333333, 1,
0.01097723, 0.04182971, 1.297854, 0, 1, 0.9411765, 1,
0.01147827, 0.53142, -0.9384041, 0, 1, 0.945098, 1,
0.01812061, 0.4495473, -0.9210027, 0, 1, 0.9529412, 1,
0.02126745, 1.618766, -0.02296074, 0, 1, 0.9568627, 1,
0.02351957, -1.921109, 3.603942, 0, 1, 0.9647059, 1,
0.0242944, -0.01920841, 2.088375, 0, 1, 0.9686275, 1,
0.0290265, -1.77547, 3.146557, 0, 1, 0.9764706, 1,
0.03095925, 0.6655198, -0.4384212, 0, 1, 0.9803922, 1,
0.03179789, 0.7084243, 0.4777623, 0, 1, 0.9882353, 1,
0.03716911, 0.1522235, 1.023908, 0, 1, 0.9921569, 1,
0.03922712, 0.4506482, -1.423719, 0, 1, 1, 1,
0.04119131, -1.013642, 4.044029, 0, 0.9921569, 1, 1,
0.04157931, -0.9459041, 3.534443, 0, 0.9882353, 1, 1,
0.0458157, -0.3084604, 2.106685, 0, 0.9803922, 1, 1,
0.0462546, 0.866081, 1.069022, 0, 0.9764706, 1, 1,
0.04654429, 0.08075991, -0.9370279, 0, 0.9686275, 1, 1,
0.05184368, -0.3712874, 2.497879, 0, 0.9647059, 1, 1,
0.05217653, -1.00893, 3.877969, 0, 0.9568627, 1, 1,
0.0563224, 1.319492, 1.664504, 0, 0.9529412, 1, 1,
0.05969378, 0.3478722, 0.2508996, 0, 0.945098, 1, 1,
0.0609184, -0.9717761, 2.829073, 0, 0.9411765, 1, 1,
0.06253611, -0.360344, 4.648791, 0, 0.9333333, 1, 1,
0.06322276, -2.066792, 4.743762, 0, 0.9294118, 1, 1,
0.06636235, 0.3772855, 1.168525, 0, 0.9215686, 1, 1,
0.06839552, 0.1020397, -0.08893571, 0, 0.9176471, 1, 1,
0.06934171, 1.763272, 1.754117, 0, 0.9098039, 1, 1,
0.07192579, 0.3340829, 1.100332, 0, 0.9058824, 1, 1,
0.07225922, -0.1250955, 3.635045, 0, 0.8980392, 1, 1,
0.07371598, 0.6127244, 0.8848335, 0, 0.8901961, 1, 1,
0.07493496, -0.3383226, 1.34489, 0, 0.8862745, 1, 1,
0.07995831, 1.97086, 0.9865946, 0, 0.8784314, 1, 1,
0.08661928, 1.51136, -0.04861411, 0, 0.8745098, 1, 1,
0.09717955, -0.7462817, 2.793131, 0, 0.8666667, 1, 1,
0.09956472, -0.4840254, 2.161896, 0, 0.8627451, 1, 1,
0.1044807, 2.49027, -1.837977, 0, 0.854902, 1, 1,
0.1101639, -0.3259174, 2.678673, 0, 0.8509804, 1, 1,
0.1101983, 3.692322, 0.1676952, 0, 0.8431373, 1, 1,
0.1200611, -0.694379, 4.29013, 0, 0.8392157, 1, 1,
0.1205255, 0.5912519, 1.263417, 0, 0.8313726, 1, 1,
0.1214557, 0.3758872, -0.3551761, 0, 0.827451, 1, 1,
0.1237859, -1.407638, 4.379297, 0, 0.8196079, 1, 1,
0.1253451, -0.678677, 2.147129, 0, 0.8156863, 1, 1,
0.1285792, -0.2198181, 3.180626, 0, 0.8078431, 1, 1,
0.1332988, -1.705101, 3.502402, 0, 0.8039216, 1, 1,
0.1355006, -0.07101676, 2.251522, 0, 0.7960784, 1, 1,
0.1355069, 0.1221876, 0.4678379, 0, 0.7882353, 1, 1,
0.1355166, 0.9357042, 0.08216895, 0, 0.7843137, 1, 1,
0.1427172, -0.8053479, 2.266209, 0, 0.7764706, 1, 1,
0.1438503, 0.3202361, -0.8705136, 0, 0.772549, 1, 1,
0.1445553, 1.134171, -0.6968254, 0, 0.7647059, 1, 1,
0.1446986, -1.470218, 3.199677, 0, 0.7607843, 1, 1,
0.1456308, -0.4896941, 3.107669, 0, 0.7529412, 1, 1,
0.150406, -0.7492748, 4.401583, 0, 0.7490196, 1, 1,
0.151989, 2.468419, 0.818314, 0, 0.7411765, 1, 1,
0.1550732, 1.840654, -1.16164, 0, 0.7372549, 1, 1,
0.1605903, -0.710206, 1.436452, 0, 0.7294118, 1, 1,
0.163331, -0.51684, 3.770273, 0, 0.7254902, 1, 1,
0.164192, 1.016164, -2.127213, 0, 0.7176471, 1, 1,
0.1648329, 0.2805777, -1.187748, 0, 0.7137255, 1, 1,
0.1656541, -0.7047128, 5.325548, 0, 0.7058824, 1, 1,
0.1685413, -0.3416842, 1.394282, 0, 0.6980392, 1, 1,
0.1821392, 0.7547284, -2.133025, 0, 0.6941177, 1, 1,
0.1833103, -0.7586948, 3.292791, 0, 0.6862745, 1, 1,
0.1846847, 0.09918948, 0.676431, 0, 0.682353, 1, 1,
0.1864488, 0.004219401, 2.171775, 0, 0.6745098, 1, 1,
0.186866, -1.940242, 0.4560781, 0, 0.6705883, 1, 1,
0.187673, -0.004487818, 2.210968, 0, 0.6627451, 1, 1,
0.1885912, 0.2715748, 1.284688, 0, 0.6588235, 1, 1,
0.1895995, 0.1750872, 0.6228821, 0, 0.6509804, 1, 1,
0.1908401, -0.1624156, 3.240037, 0, 0.6470588, 1, 1,
0.1933099, -1.29819, 2.951209, 0, 0.6392157, 1, 1,
0.1995588, 0.6034684, -0.6332074, 0, 0.6352941, 1, 1,
0.1997056, 0.7417072, -0.4722877, 0, 0.627451, 1, 1,
0.200665, 0.09264502, 2.579511, 0, 0.6235294, 1, 1,
0.2008613, 0.7327138, -1.688878, 0, 0.6156863, 1, 1,
0.2014991, -2.127587, 0.8760791, 0, 0.6117647, 1, 1,
0.2023316, -1.350032, 3.06636, 0, 0.6039216, 1, 1,
0.2111894, -0.06459684, 0.5793729, 0, 0.5960785, 1, 1,
0.2123237, 0.6547085, 1.527201, 0, 0.5921569, 1, 1,
0.215367, 0.5554011, -0.1542542, 0, 0.5843138, 1, 1,
0.2222394, 0.6738332, -0.1966334, 0, 0.5803922, 1, 1,
0.2323291, -0.07716558, 1.41961, 0, 0.572549, 1, 1,
0.2348947, 1.680204, 1.474359, 0, 0.5686275, 1, 1,
0.2390818, 0.7336075, 1.192366, 0, 0.5607843, 1, 1,
0.251562, -0.1539574, 2.912954, 0, 0.5568628, 1, 1,
0.2540394, -2.772386, 3.194708, 0, 0.5490196, 1, 1,
0.254508, -0.4426933, 2.504839, 0, 0.5450981, 1, 1,
0.2566594, -0.4662864, 1.785973, 0, 0.5372549, 1, 1,
0.2572507, 1.381527, 0.9088173, 0, 0.5333334, 1, 1,
0.2624544, -0.2275003, 2.649215, 0, 0.5254902, 1, 1,
0.2644989, 1.072939, 1.200216, 0, 0.5215687, 1, 1,
0.2645417, 1.252715, -1.630043, 0, 0.5137255, 1, 1,
0.2646311, 0.7827331, 1.24242, 0, 0.509804, 1, 1,
0.2654815, -0.4527492, 2.858352, 0, 0.5019608, 1, 1,
0.2664095, -0.1043246, 0.325462, 0, 0.4941176, 1, 1,
0.2733122, -0.9487455, 2.569516, 0, 0.4901961, 1, 1,
0.2744545, 0.4210541, 0.7419409, 0, 0.4823529, 1, 1,
0.2759303, 0.04928428, 2.851002, 0, 0.4784314, 1, 1,
0.2759724, 0.1695253, -1.009913, 0, 0.4705882, 1, 1,
0.2831171, -0.1982492, 0.7284437, 0, 0.4666667, 1, 1,
0.2835435, 0.2523718, 1.150731, 0, 0.4588235, 1, 1,
0.2846504, -1.885528, 3.871333, 0, 0.454902, 1, 1,
0.287347, -0.9360293, 3.249588, 0, 0.4470588, 1, 1,
0.2875918, 1.544212, -0.5314567, 0, 0.4431373, 1, 1,
0.2901022, 0.1104623, 3.118615, 0, 0.4352941, 1, 1,
0.2910428, 1.579202, -0.8982469, 0, 0.4313726, 1, 1,
0.3056324, -1.890345, 4.346025, 0, 0.4235294, 1, 1,
0.3063293, -0.2191861, 3.678807, 0, 0.4196078, 1, 1,
0.3071647, 0.04200722, 0.2859282, 0, 0.4117647, 1, 1,
0.3073758, -1.666522, 1.673763, 0, 0.4078431, 1, 1,
0.3102169, 1.022731, -1.033414, 0, 0.4, 1, 1,
0.3106009, -1.436704, 2.274996, 0, 0.3921569, 1, 1,
0.3112454, -1.200354, 2.559788, 0, 0.3882353, 1, 1,
0.3115984, 0.3993896, 0.4803185, 0, 0.3803922, 1, 1,
0.3163358, -0.2950091, 1.984272, 0, 0.3764706, 1, 1,
0.3186322, -0.03738971, 1.940263, 0, 0.3686275, 1, 1,
0.3191007, 0.7931203, 0.8132489, 0, 0.3647059, 1, 1,
0.3208564, 1.199474, 0.1264252, 0, 0.3568628, 1, 1,
0.3226981, 0.06336793, 0.08542058, 0, 0.3529412, 1, 1,
0.329232, -1.001402, 1.669977, 0, 0.345098, 1, 1,
0.331935, 0.03839647, 1.593675, 0, 0.3411765, 1, 1,
0.3362541, 0.3953802, 2.90266, 0, 0.3333333, 1, 1,
0.3378599, 0.2548227, 2.307671, 0, 0.3294118, 1, 1,
0.3402981, -0.9526868, 2.623037, 0, 0.3215686, 1, 1,
0.3426519, -1.900759, 1.328971, 0, 0.3176471, 1, 1,
0.3484559, -1.081398, 2.842111, 0, 0.3098039, 1, 1,
0.3528945, -1.226118, 3.985489, 0, 0.3058824, 1, 1,
0.3547996, 1.136608, 0.1020658, 0, 0.2980392, 1, 1,
0.3580211, -1.013764, 2.893953, 0, 0.2901961, 1, 1,
0.3598657, 0.657683, 1.634962, 0, 0.2862745, 1, 1,
0.3599719, -0.2916288, 3.287004, 0, 0.2784314, 1, 1,
0.3607048, -0.8452673, 4.25096, 0, 0.2745098, 1, 1,
0.3609652, -0.912136, 2.315145, 0, 0.2666667, 1, 1,
0.3641867, 0.2116555, 0.8251784, 0, 0.2627451, 1, 1,
0.3674626, 0.4488108, 0.3393597, 0, 0.254902, 1, 1,
0.3757298, -0.2194048, 2.575878, 0, 0.2509804, 1, 1,
0.3787662, -1.792213, 2.59903, 0, 0.2431373, 1, 1,
0.3813208, 0.4159521, 0.2781391, 0, 0.2392157, 1, 1,
0.3855351, 0.3389578, -0.1036397, 0, 0.2313726, 1, 1,
0.387305, 0.9873624, -1.193089, 0, 0.227451, 1, 1,
0.3902152, -0.1955644, 1.808057, 0, 0.2196078, 1, 1,
0.3942875, 1.670817, 0.08700543, 0, 0.2156863, 1, 1,
0.3947666, 0.4942513, 1.344401, 0, 0.2078431, 1, 1,
0.3961396, -0.878149, -0.2248169, 0, 0.2039216, 1, 1,
0.3968127, 0.4235107, 1.342921, 0, 0.1960784, 1, 1,
0.3973092, -1.174588, 4.670926, 0, 0.1882353, 1, 1,
0.4003001, 1.634924, 0.06485637, 0, 0.1843137, 1, 1,
0.4048645, -0.2544321, 3.197577, 0, 0.1764706, 1, 1,
0.4071694, 1.391191, 1.452652, 0, 0.172549, 1, 1,
0.4086299, 1.258339, 0.09017061, 0, 0.1647059, 1, 1,
0.4111508, -0.2231305, 1.534622, 0, 0.1607843, 1, 1,
0.4130766, 0.382987, -0.3459412, 0, 0.1529412, 1, 1,
0.4132335, -1.228094, 3.734439, 0, 0.1490196, 1, 1,
0.4168856, 0.9629653, -0.03980987, 0, 0.1411765, 1, 1,
0.4176471, 0.03734437, 1.529543, 0, 0.1372549, 1, 1,
0.4188711, -0.4153321, 2.516105, 0, 0.1294118, 1, 1,
0.4200766, -0.02917345, 1.926368, 0, 0.1254902, 1, 1,
0.4212681, -0.7923539, 2.660263, 0, 0.1176471, 1, 1,
0.4279402, 2.164863, 0.2793393, 0, 0.1137255, 1, 1,
0.4290771, 1.563026, 0.237196, 0, 0.1058824, 1, 1,
0.4296453, -0.214754, 3.07118, 0, 0.09803922, 1, 1,
0.4395157, -0.07161688, 0.8812296, 0, 0.09411765, 1, 1,
0.4409819, -1.572639, 3.174041, 0, 0.08627451, 1, 1,
0.4415178, -0.7892493, 1.657881, 0, 0.08235294, 1, 1,
0.4435661, -1.278861, 2.606591, 0, 0.07450981, 1, 1,
0.4564294, -0.3812386, 0.01000692, 0, 0.07058824, 1, 1,
0.4572625, 0.2440385, 2.262149, 0, 0.0627451, 1, 1,
0.4617904, -1.23286, 2.69378, 0, 0.05882353, 1, 1,
0.4661136, 1.679927, -1.172469, 0, 0.05098039, 1, 1,
0.4669512, 0.5069901, 1.315637, 0, 0.04705882, 1, 1,
0.4687161, 0.8176895, 0.4532738, 0, 0.03921569, 1, 1,
0.4705962, -1.606132, 2.316663, 0, 0.03529412, 1, 1,
0.4743138, -0.2495369, 2.003655, 0, 0.02745098, 1, 1,
0.4744049, 0.8265774, 1.451413, 0, 0.02352941, 1, 1,
0.4758078, 0.4456817, -0.1556417, 0, 0.01568628, 1, 1,
0.4775416, 0.4625498, 1.975052, 0, 0.01176471, 1, 1,
0.4787497, -0.4743021, 1.897487, 0, 0.003921569, 1, 1,
0.4850208, -0.4304772, 2.297843, 0.003921569, 0, 1, 1,
0.4867231, -0.1430299, 3.149243, 0.007843138, 0, 1, 1,
0.4868797, 0.5784141, 0.9838529, 0.01568628, 0, 1, 1,
0.4885509, 0.2394566, -0.02103744, 0.01960784, 0, 1, 1,
0.4908203, 0.7871788, 1.854084, 0.02745098, 0, 1, 1,
0.4923287, 1.123221, -0.5464947, 0.03137255, 0, 1, 1,
0.4957357, -1.250157, 3.701106, 0.03921569, 0, 1, 1,
0.4986595, 0.8850909, 0.8082889, 0.04313726, 0, 1, 1,
0.4986836, 0.4362898, 0.4270109, 0.05098039, 0, 1, 1,
0.5005626, 0.3818926, 1.635935, 0.05490196, 0, 1, 1,
0.5096844, 2.233014, 0.4773446, 0.0627451, 0, 1, 1,
0.5140454, 0.4602428, 0.04103374, 0.06666667, 0, 1, 1,
0.5186508, -0.2641458, 2.77475, 0.07450981, 0, 1, 1,
0.5190454, 0.03891527, 3.185519, 0.07843138, 0, 1, 1,
0.5194378, -1.16276, 3.457024, 0.08627451, 0, 1, 1,
0.5195321, 0.4188495, 0.7604719, 0.09019608, 0, 1, 1,
0.5219736, 0.8838846, -0.6731849, 0.09803922, 0, 1, 1,
0.5230278, -0.5908739, 2.714216, 0.1058824, 0, 1, 1,
0.52335, -1.137384, 1.996832, 0.1098039, 0, 1, 1,
0.5245826, -0.3159446, 2.121371, 0.1176471, 0, 1, 1,
0.530408, 0.8887853, -0.8539743, 0.1215686, 0, 1, 1,
0.5315709, 0.4721897, 2.743848, 0.1294118, 0, 1, 1,
0.5349635, 0.09479059, 2.843222, 0.1333333, 0, 1, 1,
0.5349723, 0.7048472, -0.1993747, 0.1411765, 0, 1, 1,
0.5404522, -1.283054, 1.171762, 0.145098, 0, 1, 1,
0.5410293, 0.9064799, -1.46178, 0.1529412, 0, 1, 1,
0.5422018, 0.631678, 0.2628853, 0.1568628, 0, 1, 1,
0.5430724, 0.02876093, 1.291445, 0.1647059, 0, 1, 1,
0.5462258, -0.9218329, 3.201396, 0.1686275, 0, 1, 1,
0.5474764, 0.6007903, 0.5498298, 0.1764706, 0, 1, 1,
0.5517236, -0.4912744, 0.5697797, 0.1803922, 0, 1, 1,
0.5532152, -0.7950245, 3.052389, 0.1882353, 0, 1, 1,
0.5535047, -1.945758, 2.935706, 0.1921569, 0, 1, 1,
0.5553294, 1.105662, 0.1745425, 0.2, 0, 1, 1,
0.5563081, 0.3765672, 1.412398, 0.2078431, 0, 1, 1,
0.5590178, -0.4638746, 0.9037724, 0.2117647, 0, 1, 1,
0.5630488, 0.8185294, 0.8739134, 0.2196078, 0, 1, 1,
0.5657475, -0.2830544, 2.827344, 0.2235294, 0, 1, 1,
0.5714275, 0.6062509, 1.000225, 0.2313726, 0, 1, 1,
0.5739266, -1.106907, 3.366484, 0.2352941, 0, 1, 1,
0.5743273, 0.3244471, 2.260252, 0.2431373, 0, 1, 1,
0.5802426, 0.1803646, 1.786087, 0.2470588, 0, 1, 1,
0.5812224, -0.8387999, 1.268046, 0.254902, 0, 1, 1,
0.5894824, 0.02192246, 2.594894, 0.2588235, 0, 1, 1,
0.5949951, 0.6913837, -0.366309, 0.2666667, 0, 1, 1,
0.602595, 0.2185274, 1.875625, 0.2705882, 0, 1, 1,
0.6065986, -0.9939354, 2.887089, 0.2784314, 0, 1, 1,
0.6084847, 0.1876017, 2.942165, 0.282353, 0, 1, 1,
0.6101521, -0.1804358, 3.782241, 0.2901961, 0, 1, 1,
0.615871, 0.9921456, 0.1341351, 0.2941177, 0, 1, 1,
0.616394, 0.6100581, -0.8619744, 0.3019608, 0, 1, 1,
0.6178655, 0.9845656, -0.6912009, 0.3098039, 0, 1, 1,
0.6196226, -3.16677, 1.106097, 0.3137255, 0, 1, 1,
0.622059, -1.116596, 1.555338, 0.3215686, 0, 1, 1,
0.6234559, -1.660035, 2.380781, 0.3254902, 0, 1, 1,
0.6283414, 1.699132, 2.0942, 0.3333333, 0, 1, 1,
0.6295915, 1.293567, -0.669597, 0.3372549, 0, 1, 1,
0.6342768, 0.3484038, 1.597489, 0.345098, 0, 1, 1,
0.6346306, -0.1196022, 0.7945723, 0.3490196, 0, 1, 1,
0.6393102, -1.199968, 3.164925, 0.3568628, 0, 1, 1,
0.640364, 0.1878564, 1.519785, 0.3607843, 0, 1, 1,
0.6467113, 0.02759456, 1.99098, 0.3686275, 0, 1, 1,
0.6477339, 0.97751, 0.9406514, 0.372549, 0, 1, 1,
0.6488229, 0.07440207, 1.291406, 0.3803922, 0, 1, 1,
0.6496423, -0.6227118, 2.024719, 0.3843137, 0, 1, 1,
0.6544178, -1.091305, 2.65238, 0.3921569, 0, 1, 1,
0.6556026, -0.2473458, 1.65445, 0.3960784, 0, 1, 1,
0.6580202, 0.05230372, 1.739435, 0.4039216, 0, 1, 1,
0.6612325, 0.470549, 0.3674222, 0.4117647, 0, 1, 1,
0.6635263, -1.817648, 2.392987, 0.4156863, 0, 1, 1,
0.6762483, -0.03443098, 0.2625664, 0.4235294, 0, 1, 1,
0.6769657, 2.069951, -0.2897823, 0.427451, 0, 1, 1,
0.6882935, 0.7932286, 0.266398, 0.4352941, 0, 1, 1,
0.6947542, 0.9644578, 1.478988, 0.4392157, 0, 1, 1,
0.6953303, -1.27539, 3.089711, 0.4470588, 0, 1, 1,
0.6971359, 0.5235194, 0.8641157, 0.4509804, 0, 1, 1,
0.6988385, 0.717034, -0.4053304, 0.4588235, 0, 1, 1,
0.6992053, 0.5858514, 1.749815, 0.4627451, 0, 1, 1,
0.7054603, -0.3508548, 1.822695, 0.4705882, 0, 1, 1,
0.706971, 0.2072658, 2.870061, 0.4745098, 0, 1, 1,
0.709171, 0.1807709, 3.741785, 0.4823529, 0, 1, 1,
0.7147646, -0.3703569, 3.676987, 0.4862745, 0, 1, 1,
0.7165474, -0.4022857, 3.039139, 0.4941176, 0, 1, 1,
0.716947, -0.7141711, 1.231123, 0.5019608, 0, 1, 1,
0.724063, -0.2365031, 3.748709, 0.5058824, 0, 1, 1,
0.7241361, 1.719031, 0.08409663, 0.5137255, 0, 1, 1,
0.7314256, -2.622978, 4.067887, 0.5176471, 0, 1, 1,
0.7322738, 1.193472, 1.656826, 0.5254902, 0, 1, 1,
0.7333949, -1.268089, 2.128949, 0.5294118, 0, 1, 1,
0.7382544, 1.146618, 0.9328405, 0.5372549, 0, 1, 1,
0.7410653, -1.164803, 1.541717, 0.5411765, 0, 1, 1,
0.7414877, -0.9794103, 1.927589, 0.5490196, 0, 1, 1,
0.7437422, 0.05568721, 2.285244, 0.5529412, 0, 1, 1,
0.7455353, -1.28879, 1.907789, 0.5607843, 0, 1, 1,
0.7476459, -1.960994, 3.103216, 0.5647059, 0, 1, 1,
0.7492559, 0.866267, 2.537579, 0.572549, 0, 1, 1,
0.7501601, 0.1148471, 2.846636, 0.5764706, 0, 1, 1,
0.7635113, 0.2279009, 1.15111, 0.5843138, 0, 1, 1,
0.7672638, 1.937906, -0.139691, 0.5882353, 0, 1, 1,
0.7733554, -0.5366368, 0.1910794, 0.5960785, 0, 1, 1,
0.7765309, 0.9186038, 0.5321305, 0.6039216, 0, 1, 1,
0.7799669, -1.438467, 2.698014, 0.6078432, 0, 1, 1,
0.785512, -0.2715006, 2.559106, 0.6156863, 0, 1, 1,
0.7855365, -0.1096577, 2.238848, 0.6196079, 0, 1, 1,
0.785679, -1.240891, 2.21745, 0.627451, 0, 1, 1,
0.7906309, -1.709779, 3.131059, 0.6313726, 0, 1, 1,
0.7953805, 0.1561923, 3.406193, 0.6392157, 0, 1, 1,
0.7957182, 0.2743424, 1.879296, 0.6431373, 0, 1, 1,
0.797362, 2.068675, 0.4180135, 0.6509804, 0, 1, 1,
0.7975814, 1.404268, 0.0486288, 0.654902, 0, 1, 1,
0.7993261, 0.6894171, 0.976458, 0.6627451, 0, 1, 1,
0.8015074, 0.8146254, 1.366628, 0.6666667, 0, 1, 1,
0.8083302, 0.4312092, 0.8626371, 0.6745098, 0, 1, 1,
0.8105395, 0.8522286, 0.4354542, 0.6784314, 0, 1, 1,
0.8121064, 0.2936828, 2.236092, 0.6862745, 0, 1, 1,
0.8178551, 1.390587, 0.1176879, 0.6901961, 0, 1, 1,
0.8188637, -1.189507, 1.019846, 0.6980392, 0, 1, 1,
0.8225853, -2.207231, 3.349297, 0.7058824, 0, 1, 1,
0.8281967, -0.3380474, 0.5286274, 0.7098039, 0, 1, 1,
0.8294991, -0.337703, 0.08167215, 0.7176471, 0, 1, 1,
0.8305922, 1.012411, 0.1321617, 0.7215686, 0, 1, 1,
0.8340121, 0.8811113, 1.072361, 0.7294118, 0, 1, 1,
0.8447123, -0.1637358, 0.5496377, 0.7333333, 0, 1, 1,
0.8507, 0.2460051, 2.353007, 0.7411765, 0, 1, 1,
0.8581307, -0.9517007, 1.655225, 0.7450981, 0, 1, 1,
0.8629661, -0.1771794, 1.845244, 0.7529412, 0, 1, 1,
0.8652416, -1.068959, 1.996198, 0.7568628, 0, 1, 1,
0.8687514, 1.040648, 1.41497, 0.7647059, 0, 1, 1,
0.8706617, -1.124908, 2.046365, 0.7686275, 0, 1, 1,
0.8730964, 1.340288, 0.932722, 0.7764706, 0, 1, 1,
0.8749245, -0.2090717, 0.224236, 0.7803922, 0, 1, 1,
0.8883471, 1.130346, -0.4329738, 0.7882353, 0, 1, 1,
0.8918703, 0.129816, 1.204077, 0.7921569, 0, 1, 1,
0.9013919, -0.8912745, -0.1339303, 0.8, 0, 1, 1,
0.9055278, -0.6099269, 0.2323684, 0.8078431, 0, 1, 1,
0.9098454, 2.201513, 0.5811037, 0.8117647, 0, 1, 1,
0.9118155, 0.5728868, 1.648183, 0.8196079, 0, 1, 1,
0.9183927, 0.4165116, 2.001212, 0.8235294, 0, 1, 1,
0.9198976, -0.4162768, 1.271103, 0.8313726, 0, 1, 1,
0.9202576, -0.0582854, 1.519342, 0.8352941, 0, 1, 1,
0.9237548, -0.8777305, 3.01808, 0.8431373, 0, 1, 1,
0.9258897, 1.024277, -0.1199516, 0.8470588, 0, 1, 1,
0.9316036, -0.5283991, 2.475151, 0.854902, 0, 1, 1,
0.9318658, -1.268271, 1.897063, 0.8588235, 0, 1, 1,
0.9343228, 0.5633846, 0.1958671, 0.8666667, 0, 1, 1,
0.9357643, -0.05418615, 2.014522, 0.8705882, 0, 1, 1,
0.9415426, -1.719768, 1.434395, 0.8784314, 0, 1, 1,
0.948954, -0.442517, 1.182728, 0.8823529, 0, 1, 1,
0.9496623, -0.4815415, 1.135156, 0.8901961, 0, 1, 1,
0.9523276, -1.187368, 2.059671, 0.8941177, 0, 1, 1,
0.9572804, 0.4612539, -0.7826529, 0.9019608, 0, 1, 1,
0.9585113, -0.233882, 1.661749, 0.9098039, 0, 1, 1,
0.9695695, -0.1569235, 0.6418059, 0.9137255, 0, 1, 1,
0.9746322, 0.4826141, 2.254221, 0.9215686, 0, 1, 1,
0.9788002, 0.2007561, 1.006012, 0.9254902, 0, 1, 1,
0.9802508, -0.004260192, 2.485655, 0.9333333, 0, 1, 1,
0.9811378, 0.9881285, 1.12155, 0.9372549, 0, 1, 1,
1.00081, -0.2601859, 2.511815, 0.945098, 0, 1, 1,
1.004119, 0.05641004, 1.024876, 0.9490196, 0, 1, 1,
1.004547, 0.7598431, 1.021894, 0.9568627, 0, 1, 1,
1.012537, -0.7136297, 2.014132, 0.9607843, 0, 1, 1,
1.01285, 0.1939549, 1.095858, 0.9686275, 0, 1, 1,
1.016055, 1.129626, 1.62781, 0.972549, 0, 1, 1,
1.021688, 2.447461, 1.917344, 0.9803922, 0, 1, 1,
1.021781, 0.591857, 1.042901, 0.9843137, 0, 1, 1,
1.023076, -1.275664, 1.825521, 0.9921569, 0, 1, 1,
1.024678, -0.1290282, 2.205123, 0.9960784, 0, 1, 1,
1.029421, 0.3069052, 2.412097, 1, 0, 0.9960784, 1,
1.031084, 0.8911397, 1.676843, 1, 0, 0.9882353, 1,
1.033428, 1.013089, 2.729229, 1, 0, 0.9843137, 1,
1.033851, -0.2628674, 3.548452, 1, 0, 0.9764706, 1,
1.046779, 0.3823774, -0.232561, 1, 0, 0.972549, 1,
1.053228, 1.003563, 0.9815117, 1, 0, 0.9647059, 1,
1.057627, -0.2862787, 0.2299441, 1, 0, 0.9607843, 1,
1.071814, 0.07055865, 1.191968, 1, 0, 0.9529412, 1,
1.07202, -0.222551, 1.496544, 1, 0, 0.9490196, 1,
1.074215, -0.6344676, 3.37818, 1, 0, 0.9411765, 1,
1.08511, 0.07693633, 0.6143928, 1, 0, 0.9372549, 1,
1.086203, 0.4119974, 2.085206, 1, 0, 0.9294118, 1,
1.095055, 0.1062036, 2.206732, 1, 0, 0.9254902, 1,
1.100331, 0.3023097, 3.014131, 1, 0, 0.9176471, 1,
1.10556, -0.1949358, 0.8489774, 1, 0, 0.9137255, 1,
1.107844, 0.4226198, 2.092407, 1, 0, 0.9058824, 1,
1.121049, -0.4695278, 1.792461, 1, 0, 0.9019608, 1,
1.124791, -0.3248121, 3.658237, 1, 0, 0.8941177, 1,
1.125529, 2.59632, -0.7003042, 1, 0, 0.8862745, 1,
1.126116, -0.4764138, 2.474467, 1, 0, 0.8823529, 1,
1.129196, -0.3625051, 0.9595668, 1, 0, 0.8745098, 1,
1.131134, 1.931772, -0.5668606, 1, 0, 0.8705882, 1,
1.13222, -0.8961967, 0.2063079, 1, 0, 0.8627451, 1,
1.134055, 0.6833894, 1.849993, 1, 0, 0.8588235, 1,
1.140167, 1.452207, 1.79897, 1, 0, 0.8509804, 1,
1.142149, 0.1582107, 1.405465, 1, 0, 0.8470588, 1,
1.145042, -1.03524, 1.868868, 1, 0, 0.8392157, 1,
1.152991, 0.3578027, 0.3665899, 1, 0, 0.8352941, 1,
1.154435, 0.6383311, 0.3875302, 1, 0, 0.827451, 1,
1.157594, 0.3651177, 0.02490156, 1, 0, 0.8235294, 1,
1.158351, -0.3875122, 2.245604, 1, 0, 0.8156863, 1,
1.159034, -1.534921, 2.9164, 1, 0, 0.8117647, 1,
1.159347, -1.761321, 2.3879, 1, 0, 0.8039216, 1,
1.159439, -1.587536, 3.429025, 1, 0, 0.7960784, 1,
1.175671, 0.5580258, 1.237489, 1, 0, 0.7921569, 1,
1.176057, 0.1010353, 3.155591, 1, 0, 0.7843137, 1,
1.176303, 0.5953919, 2.301655, 1, 0, 0.7803922, 1,
1.176679, 1.348979, 1.011592, 1, 0, 0.772549, 1,
1.178108, 0.7343343, 1.296991, 1, 0, 0.7686275, 1,
1.178432, 0.01343842, 3.433036, 1, 0, 0.7607843, 1,
1.179134, 1.086268, 0.751566, 1, 0, 0.7568628, 1,
1.180581, 0.2150316, 2.043005, 1, 0, 0.7490196, 1,
1.184018, 2.216199, 0.4149203, 1, 0, 0.7450981, 1,
1.184061, -1.106248, 0.389022, 1, 0, 0.7372549, 1,
1.186062, 0.5197526, 2.00385, 1, 0, 0.7333333, 1,
1.193197, 1.209416, 3.31674, 1, 0, 0.7254902, 1,
1.19376, 0.08995163, 2.48345, 1, 0, 0.7215686, 1,
1.194231, 1.623026, 0.4312205, 1, 0, 0.7137255, 1,
1.194384, 0.8347126, -0.9807745, 1, 0, 0.7098039, 1,
1.199987, -0.4140026, -0.03238804, 1, 0, 0.7019608, 1,
1.212721, -0.06860328, 2.203238, 1, 0, 0.6941177, 1,
1.21552, 0.08107927, 2.070439, 1, 0, 0.6901961, 1,
1.216278, 0.8140327, 0.8983546, 1, 0, 0.682353, 1,
1.2165, 0.2821283, 0.9187025, 1, 0, 0.6784314, 1,
1.2192, -0.4263247, 2.127361, 1, 0, 0.6705883, 1,
1.259911, -0.9344786, 1.894517, 1, 0, 0.6666667, 1,
1.260461, 0.1413746, 3.037107, 1, 0, 0.6588235, 1,
1.268635, 1.035332, 0.7339272, 1, 0, 0.654902, 1,
1.270381, -0.09844281, 1.822451, 1, 0, 0.6470588, 1,
1.276051, 0.1010448, 1.922321, 1, 0, 0.6431373, 1,
1.278472, 1.56886, 2.869385, 1, 0, 0.6352941, 1,
1.289448, 0.09462006, 1.777874, 1, 0, 0.6313726, 1,
1.290683, -0.5551495, 2.375768, 1, 0, 0.6235294, 1,
1.293812, -1.757382, 0.7616824, 1, 0, 0.6196079, 1,
1.297197, 0.1119532, 2.703725, 1, 0, 0.6117647, 1,
1.297495, 1.5025, 3.305385, 1, 0, 0.6078432, 1,
1.298571, 0.5370339, 0.5029227, 1, 0, 0.6, 1,
1.310268, 0.7664452, 1.991343, 1, 0, 0.5921569, 1,
1.310467, 0.8294149, 0.6310623, 1, 0, 0.5882353, 1,
1.315202, 2.078477, -1.817252, 1, 0, 0.5803922, 1,
1.317345, -0.712199, 3.584575, 1, 0, 0.5764706, 1,
1.319244, 0.9043511, -0.366785, 1, 0, 0.5686275, 1,
1.329545, -0.514793, 0.3177434, 1, 0, 0.5647059, 1,
1.337435, -0.2185982, 3.210975, 1, 0, 0.5568628, 1,
1.342199, -1.228883, 0.2594323, 1, 0, 0.5529412, 1,
1.346735, -1.707166, 1.152135, 1, 0, 0.5450981, 1,
1.356369, 1.955497, 0.1089583, 1, 0, 0.5411765, 1,
1.357054, 0.3310527, 1.484238, 1, 0, 0.5333334, 1,
1.357698, -0.7063628, 3.129946, 1, 0, 0.5294118, 1,
1.362663, 0.3079113, 2.300701, 1, 0, 0.5215687, 1,
1.365022, -0.8380356, 2.314283, 1, 0, 0.5176471, 1,
1.365441, 0.3502876, 1.517622, 1, 0, 0.509804, 1,
1.369205, -0.5685436, 2.190485, 1, 0, 0.5058824, 1,
1.394234, 1.182378, 0.9747636, 1, 0, 0.4980392, 1,
1.415179, 0.852283, -0.3800384, 1, 0, 0.4901961, 1,
1.417282, 0.01454059, 0.2037786, 1, 0, 0.4862745, 1,
1.421613, 2.055466, -0.1125522, 1, 0, 0.4784314, 1,
1.423639, -1.165928, 0.3095454, 1, 0, 0.4745098, 1,
1.431244, 0.1333396, 3.580432, 1, 0, 0.4666667, 1,
1.431605, 0.9243226, 2.920567, 1, 0, 0.4627451, 1,
1.432448, 0.9534404, 0.3824059, 1, 0, 0.454902, 1,
1.434927, -0.2468272, 1.06843, 1, 0, 0.4509804, 1,
1.437959, -0.1866487, 1.903011, 1, 0, 0.4431373, 1,
1.445765, -1.962082, 2.390662, 1, 0, 0.4392157, 1,
1.452781, -1.317134, 1.779193, 1, 0, 0.4313726, 1,
1.455809, 0.08124609, 0.000189698, 1, 0, 0.427451, 1,
1.461708, -0.7016597, 2.086323, 1, 0, 0.4196078, 1,
1.463409, 1.526804, 1.734968, 1, 0, 0.4156863, 1,
1.467951, -0.5297972, 0.9097839, 1, 0, 0.4078431, 1,
1.477584, -0.3000389, 2.091189, 1, 0, 0.4039216, 1,
1.49157, -0.2038361, 1.628028, 1, 0, 0.3960784, 1,
1.494892, 0.6680009, 0.6433517, 1, 0, 0.3882353, 1,
1.504889, -1.50885, 2.226104, 1, 0, 0.3843137, 1,
1.5093, 0.7664284, -0.6664497, 1, 0, 0.3764706, 1,
1.52479, -1.489357, 3.039412, 1, 0, 0.372549, 1,
1.544288, -0.1731772, 0.6179661, 1, 0, 0.3647059, 1,
1.557477, 1.477551, 1.901172, 1, 0, 0.3607843, 1,
1.577962, -1.873146, 4.034251, 1, 0, 0.3529412, 1,
1.578077, 0.5259574, 0.9822981, 1, 0, 0.3490196, 1,
1.581692, 1.319547, 2.172776, 1, 0, 0.3411765, 1,
1.582282, -1.112676, 2.34735, 1, 0, 0.3372549, 1,
1.594036, 0.4752249, 2.475616, 1, 0, 0.3294118, 1,
1.599128, -0.6144847, 2.278409, 1, 0, 0.3254902, 1,
1.603306, 1.309252, -0.5517947, 1, 0, 0.3176471, 1,
1.620662, -0.7951902, 1.689072, 1, 0, 0.3137255, 1,
1.632063, -0.03277226, 0.5436704, 1, 0, 0.3058824, 1,
1.657537, -0.665599, 1.483117, 1, 0, 0.2980392, 1,
1.661681, -0.000356075, 1.756785, 1, 0, 0.2941177, 1,
1.69792, -1.164246, 1.384742, 1, 0, 0.2862745, 1,
1.703971, -0.1222799, 2.217029, 1, 0, 0.282353, 1,
1.71409, -0.146378, 0.6875346, 1, 0, 0.2745098, 1,
1.721718, 0.454543, 1.661158, 1, 0, 0.2705882, 1,
1.737459, -0.3283479, 1.794482, 1, 0, 0.2627451, 1,
1.742849, -1.112261, 2.576816, 1, 0, 0.2588235, 1,
1.74501, -0.06865688, 2.795683, 1, 0, 0.2509804, 1,
1.766304, -0.7338138, 2.519577, 1, 0, 0.2470588, 1,
1.767666, 1.007697, 0.4363924, 1, 0, 0.2392157, 1,
1.778181, -1.113274, 2.656898, 1, 0, 0.2352941, 1,
1.807527, -0.6648386, 2.033571, 1, 0, 0.227451, 1,
1.813861, -1.291384, 2.777558, 1, 0, 0.2235294, 1,
1.834333, 0.3160653, 0.7502444, 1, 0, 0.2156863, 1,
1.847188, 1.359946, 1.020262, 1, 0, 0.2117647, 1,
1.877527, -0.483759, 0.4616414, 1, 0, 0.2039216, 1,
1.884806, 0.05939538, 1.345365, 1, 0, 0.1960784, 1,
1.887257, -1.082872, 2.224986, 1, 0, 0.1921569, 1,
1.889442, 1.418031, 0.9489806, 1, 0, 0.1843137, 1,
1.892451, -2.155558, 2.148723, 1, 0, 0.1803922, 1,
1.932262, 0.794985, 1.576699, 1, 0, 0.172549, 1,
1.93613, -0.8077159, 1.638972, 1, 0, 0.1686275, 1,
1.949278, 0.7495883, -0.08682947, 1, 0, 0.1607843, 1,
1.964644, -0.324701, -0.2193556, 1, 0, 0.1568628, 1,
1.999107, -0.5592284, 3.692084, 1, 0, 0.1490196, 1,
2.00568, -0.2199502, 1.118233, 1, 0, 0.145098, 1,
2.006097, -0.310459, 1.016792, 1, 0, 0.1372549, 1,
2.05412, 0.2637274, 0.937443, 1, 0, 0.1333333, 1,
2.057159, 0.2693224, 1.429379, 1, 0, 0.1254902, 1,
2.064489, 0.4015937, 0.7393236, 1, 0, 0.1215686, 1,
2.114743, -0.3802939, 2.709784, 1, 0, 0.1137255, 1,
2.234609, -2.594052, 2.581474, 1, 0, 0.1098039, 1,
2.247307, -1.337487, 2.664612, 1, 0, 0.1019608, 1,
2.307997, -0.9859583, 2.801091, 1, 0, 0.09411765, 1,
2.344686, -0.433242, 0.2189212, 1, 0, 0.09019608, 1,
2.359183, -0.06402005, 0.7023412, 1, 0, 0.08235294, 1,
2.362348, 1.118988, 3.529992, 1, 0, 0.07843138, 1,
2.368882, 1.409327, 1.191394, 1, 0, 0.07058824, 1,
2.416119, 0.1494015, 2.434017, 1, 0, 0.06666667, 1,
2.417115, 0.5858662, 1.479412, 1, 0, 0.05882353, 1,
2.478899, 0.6724384, 1.140241, 1, 0, 0.05490196, 1,
2.548676, -0.5529454, 1.690331, 1, 0, 0.04705882, 1,
2.611572, -0.498826, 3.294622, 1, 0, 0.04313726, 1,
2.879338, -0.9918976, 1.625861, 1, 0, 0.03529412, 1,
2.901019, 1.175556, 0.7748615, 1, 0, 0.03137255, 1,
3.079208, -0.5391422, 3.295898, 1, 0, 0.02352941, 1,
3.148152, 0.059539, 0.9583426, 1, 0, 0.01960784, 1,
3.214871, -0.4076742, 1.214216, 1, 0, 0.01176471, 1,
3.27063, 0.405965, 1.515458, 1, 0, 0.007843138, 1
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
0.121189, -4.329386, -7.774183, 0, -0.5, 0.5, 0.5,
0.121189, -4.329386, -7.774183, 1, -0.5, 0.5, 0.5,
0.121189, -4.329386, -7.774183, 1, 1.5, 0.5, 0.5,
0.121189, -4.329386, -7.774183, 0, 1.5, 0.5, 0.5
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
-4.095913, 0.2627758, -7.774183, 0, -0.5, 0.5, 0.5,
-4.095913, 0.2627758, -7.774183, 1, -0.5, 0.5, 0.5,
-4.095913, 0.2627758, -7.774183, 1, 1.5, 0.5, 0.5,
-4.095913, 0.2627758, -7.774183, 0, 1.5, 0.5, 0.5
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
-4.095913, -4.329386, -0.2750211, 0, -0.5, 0.5, 0.5,
-4.095913, -4.329386, -0.2750211, 1, -0.5, 0.5, 0.5,
-4.095913, -4.329386, -0.2750211, 1, 1.5, 0.5, 0.5,
-4.095913, -4.329386, -0.2750211, 0, 1.5, 0.5, 0.5
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
-3, -3.269656, -6.043607,
3, -3.269656, -6.043607,
-3, -3.269656, -6.043607,
-3, -3.446278, -6.332036,
-2, -3.269656, -6.043607,
-2, -3.446278, -6.332036,
-1, -3.269656, -6.043607,
-1, -3.446278, -6.332036,
0, -3.269656, -6.043607,
0, -3.446278, -6.332036,
1, -3.269656, -6.043607,
1, -3.446278, -6.332036,
2, -3.269656, -6.043607,
2, -3.446278, -6.332036,
3, -3.269656, -6.043607,
3, -3.446278, -6.332036
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
-3, -3.799521, -6.908895, 0, -0.5, 0.5, 0.5,
-3, -3.799521, -6.908895, 1, -0.5, 0.5, 0.5,
-3, -3.799521, -6.908895, 1, 1.5, 0.5, 0.5,
-3, -3.799521, -6.908895, 0, 1.5, 0.5, 0.5,
-2, -3.799521, -6.908895, 0, -0.5, 0.5, 0.5,
-2, -3.799521, -6.908895, 1, -0.5, 0.5, 0.5,
-2, -3.799521, -6.908895, 1, 1.5, 0.5, 0.5,
-2, -3.799521, -6.908895, 0, 1.5, 0.5, 0.5,
-1, -3.799521, -6.908895, 0, -0.5, 0.5, 0.5,
-1, -3.799521, -6.908895, 1, -0.5, 0.5, 0.5,
-1, -3.799521, -6.908895, 1, 1.5, 0.5, 0.5,
-1, -3.799521, -6.908895, 0, 1.5, 0.5, 0.5,
0, -3.799521, -6.908895, 0, -0.5, 0.5, 0.5,
0, -3.799521, -6.908895, 1, -0.5, 0.5, 0.5,
0, -3.799521, -6.908895, 1, 1.5, 0.5, 0.5,
0, -3.799521, -6.908895, 0, 1.5, 0.5, 0.5,
1, -3.799521, -6.908895, 0, -0.5, 0.5, 0.5,
1, -3.799521, -6.908895, 1, -0.5, 0.5, 0.5,
1, -3.799521, -6.908895, 1, 1.5, 0.5, 0.5,
1, -3.799521, -6.908895, 0, 1.5, 0.5, 0.5,
2, -3.799521, -6.908895, 0, -0.5, 0.5, 0.5,
2, -3.799521, -6.908895, 1, -0.5, 0.5, 0.5,
2, -3.799521, -6.908895, 1, 1.5, 0.5, 0.5,
2, -3.799521, -6.908895, 0, 1.5, 0.5, 0.5,
3, -3.799521, -6.908895, 0, -0.5, 0.5, 0.5,
3, -3.799521, -6.908895, 1, -0.5, 0.5, 0.5,
3, -3.799521, -6.908895, 1, 1.5, 0.5, 0.5,
3, -3.799521, -6.908895, 0, 1.5, 0.5, 0.5
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
-3.122736, -3, -6.043607,
-3.122736, 3, -6.043607,
-3.122736, -3, -6.043607,
-3.284932, -3, -6.332036,
-3.122736, -2, -6.043607,
-3.284932, -2, -6.332036,
-3.122736, -1, -6.043607,
-3.284932, -1, -6.332036,
-3.122736, 0, -6.043607,
-3.284932, 0, -6.332036,
-3.122736, 1, -6.043607,
-3.284932, 1, -6.332036,
-3.122736, 2, -6.043607,
-3.284932, 2, -6.332036,
-3.122736, 3, -6.043607,
-3.284932, 3, -6.332036
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
-3.609324, -3, -6.908895, 0, -0.5, 0.5, 0.5,
-3.609324, -3, -6.908895, 1, -0.5, 0.5, 0.5,
-3.609324, -3, -6.908895, 1, 1.5, 0.5, 0.5,
-3.609324, -3, -6.908895, 0, 1.5, 0.5, 0.5,
-3.609324, -2, -6.908895, 0, -0.5, 0.5, 0.5,
-3.609324, -2, -6.908895, 1, -0.5, 0.5, 0.5,
-3.609324, -2, -6.908895, 1, 1.5, 0.5, 0.5,
-3.609324, -2, -6.908895, 0, 1.5, 0.5, 0.5,
-3.609324, -1, -6.908895, 0, -0.5, 0.5, 0.5,
-3.609324, -1, -6.908895, 1, -0.5, 0.5, 0.5,
-3.609324, -1, -6.908895, 1, 1.5, 0.5, 0.5,
-3.609324, -1, -6.908895, 0, 1.5, 0.5, 0.5,
-3.609324, 0, -6.908895, 0, -0.5, 0.5, 0.5,
-3.609324, 0, -6.908895, 1, -0.5, 0.5, 0.5,
-3.609324, 0, -6.908895, 1, 1.5, 0.5, 0.5,
-3.609324, 0, -6.908895, 0, 1.5, 0.5, 0.5,
-3.609324, 1, -6.908895, 0, -0.5, 0.5, 0.5,
-3.609324, 1, -6.908895, 1, -0.5, 0.5, 0.5,
-3.609324, 1, -6.908895, 1, 1.5, 0.5, 0.5,
-3.609324, 1, -6.908895, 0, 1.5, 0.5, 0.5,
-3.609324, 2, -6.908895, 0, -0.5, 0.5, 0.5,
-3.609324, 2, -6.908895, 1, -0.5, 0.5, 0.5,
-3.609324, 2, -6.908895, 1, 1.5, 0.5, 0.5,
-3.609324, 2, -6.908895, 0, 1.5, 0.5, 0.5,
-3.609324, 3, -6.908895, 0, -0.5, 0.5, 0.5,
-3.609324, 3, -6.908895, 1, -0.5, 0.5, 0.5,
-3.609324, 3, -6.908895, 1, 1.5, 0.5, 0.5,
-3.609324, 3, -6.908895, 0, 1.5, 0.5, 0.5
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
-3.122736, -3.269656, -4,
-3.122736, -3.269656, 4,
-3.122736, -3.269656, -4,
-3.284932, -3.446278, -4,
-3.122736, -3.269656, -2,
-3.284932, -3.446278, -2,
-3.122736, -3.269656, 0,
-3.284932, -3.446278, 0,
-3.122736, -3.269656, 2,
-3.284932, -3.446278, 2,
-3.122736, -3.269656, 4,
-3.284932, -3.446278, 4
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
-3.609324, -3.799521, -4, 0, -0.5, 0.5, 0.5,
-3.609324, -3.799521, -4, 1, -0.5, 0.5, 0.5,
-3.609324, -3.799521, -4, 1, 1.5, 0.5, 0.5,
-3.609324, -3.799521, -4, 0, 1.5, 0.5, 0.5,
-3.609324, -3.799521, -2, 0, -0.5, 0.5, 0.5,
-3.609324, -3.799521, -2, 1, -0.5, 0.5, 0.5,
-3.609324, -3.799521, -2, 1, 1.5, 0.5, 0.5,
-3.609324, -3.799521, -2, 0, 1.5, 0.5, 0.5,
-3.609324, -3.799521, 0, 0, -0.5, 0.5, 0.5,
-3.609324, -3.799521, 0, 1, -0.5, 0.5, 0.5,
-3.609324, -3.799521, 0, 1, 1.5, 0.5, 0.5,
-3.609324, -3.799521, 0, 0, 1.5, 0.5, 0.5,
-3.609324, -3.799521, 2, 0, -0.5, 0.5, 0.5,
-3.609324, -3.799521, 2, 1, -0.5, 0.5, 0.5,
-3.609324, -3.799521, 2, 1, 1.5, 0.5, 0.5,
-3.609324, -3.799521, 2, 0, 1.5, 0.5, 0.5,
-3.609324, -3.799521, 4, 0, -0.5, 0.5, 0.5,
-3.609324, -3.799521, 4, 1, -0.5, 0.5, 0.5,
-3.609324, -3.799521, 4, 1, 1.5, 0.5, 0.5,
-3.609324, -3.799521, 4, 0, 1.5, 0.5, 0.5
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
-3.122736, -3.269656, -6.043607,
-3.122736, 3.795208, -6.043607,
-3.122736, -3.269656, 5.493565,
-3.122736, 3.795208, 5.493565,
-3.122736, -3.269656, -6.043607,
-3.122736, -3.269656, 5.493565,
-3.122736, 3.795208, -6.043607,
-3.122736, 3.795208, 5.493565,
-3.122736, -3.269656, -6.043607,
3.365113, -3.269656, -6.043607,
-3.122736, -3.269656, 5.493565,
3.365113, -3.269656, 5.493565,
-3.122736, 3.795208, -6.043607,
3.365113, 3.795208, -6.043607,
-3.122736, 3.795208, 5.493565,
3.365113, 3.795208, 5.493565,
3.365113, -3.269656, -6.043607,
3.365113, 3.795208, -6.043607,
3.365113, -3.269656, 5.493565,
3.365113, 3.795208, 5.493565,
3.365113, -3.269656, -6.043607,
3.365113, -3.269656, 5.493565,
3.365113, 3.795208, -6.043607,
3.365113, 3.795208, 5.493565
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
var radius = 8.011681;
var distance = 35.64487;
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
mvMatrix.translate( -0.121189, -0.2627758, 0.2750211 );
mvMatrix.scale( 1.335171, 1.226122, 0.7508241 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.64487);
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
thiobencarb<-read.table("thiobencarb.xyz")
```

```
## Error in read.table("thiobencarb.xyz"): no lines available in input
```

```r
x<-thiobencarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'thiobencarb' not found
```

```r
y<-thiobencarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'thiobencarb' not found
```

```r
z<-thiobencarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'thiobencarb' not found
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
-3.028252, -1.836257, -2.517207, 0, 0, 1, 1, 1,
-2.717378, -0.296793, 0.2516301, 1, 0, 0, 1, 1,
-2.419993, 1.430172, -0.9620446, 1, 0, 0, 1, 1,
-2.406044, -0.7828591, -1.527239, 1, 0, 0, 1, 1,
-2.26926, 1.13098, -0.7531853, 1, 0, 0, 1, 1,
-2.26674, -1.041287, -2.180439, 1, 0, 0, 1, 1,
-2.176614, -0.7627319, -0.5744794, 0, 0, 0, 1, 1,
-2.157044, 0.7724944, -0.6576436, 0, 0, 0, 1, 1,
-2.141269, -0.8619655, -2.08563, 0, 0, 0, 1, 1,
-2.101226, 0.1753115, -3.855224, 0, 0, 0, 1, 1,
-2.076288, -0.1498219, -1.60704, 0, 0, 0, 1, 1,
-2.025903, -2.122084, -2.934188, 0, 0, 0, 1, 1,
-2.024921, 2.820363, -2.776756, 0, 0, 0, 1, 1,
-2.004491, 0.2256897, -1.632666, 1, 1, 1, 1, 1,
-1.948793, -0.1325111, 0.4260253, 1, 1, 1, 1, 1,
-1.918337, 0.3011214, -0.1567162, 1, 1, 1, 1, 1,
-1.886758, 1.800114, 0.4754058, 1, 1, 1, 1, 1,
-1.858096, -0.2905473, -1.030409, 1, 1, 1, 1, 1,
-1.82796, 1.21068, -0.6034727, 1, 1, 1, 1, 1,
-1.798059, -1.179836, -2.062215, 1, 1, 1, 1, 1,
-1.797341, -2.547961, -2.420511, 1, 1, 1, 1, 1,
-1.789307, -0.2620218, -1.500283, 1, 1, 1, 1, 1,
-1.785139, -1.699172, -4.204709, 1, 1, 1, 1, 1,
-1.752599, 2.667843, -1.107274, 1, 1, 1, 1, 1,
-1.742053, -0.1100788, -0.9284993, 1, 1, 1, 1, 1,
-1.73105, 0.7796662, -1.88155, 1, 1, 1, 1, 1,
-1.707961, 1.290314, -0.7517875, 1, 1, 1, 1, 1,
-1.699506, 0.9306577, -1.140071, 1, 1, 1, 1, 1,
-1.691944, -1.225171, -3.635658, 0, 0, 1, 1, 1,
-1.683358, -0.7289198, -0.485014, 1, 0, 0, 1, 1,
-1.682944, -0.6087479, -0.848929, 1, 0, 0, 1, 1,
-1.665433, -1.947683, -4.657024, 1, 0, 0, 1, 1,
-1.663637, 0.2301996, -2.356478, 1, 0, 0, 1, 1,
-1.650385, -1.030041, -1.629339, 1, 0, 0, 1, 1,
-1.643821, -0.315143, -1.805919, 0, 0, 0, 1, 1,
-1.629186, 1.278105, -1.560939, 0, 0, 0, 1, 1,
-1.621422, 0.0753806, -2.901894, 0, 0, 0, 1, 1,
-1.612875, 1.339213, -0.8305895, 0, 0, 0, 1, 1,
-1.612099, 0.9853098, 0.069295, 0, 0, 0, 1, 1,
-1.611398, 0.605546, -1.021798, 0, 0, 0, 1, 1,
-1.610994, 0.3651568, -0.5189431, 0, 0, 0, 1, 1,
-1.609925, -0.283417, -1.83102, 1, 1, 1, 1, 1,
-1.584424, 0.3404107, -2.209049, 1, 1, 1, 1, 1,
-1.584005, -1.438215, -1.322116, 1, 1, 1, 1, 1,
-1.576189, -1.483376, -2.793124, 1, 1, 1, 1, 1,
-1.569928, 0.5093713, -1.356019, 1, 1, 1, 1, 1,
-1.542656, 1.317738, -0.1354189, 1, 1, 1, 1, 1,
-1.541927, -0.9074502, -1.995397, 1, 1, 1, 1, 1,
-1.531433, 1.165774, 0.5763244, 1, 1, 1, 1, 1,
-1.52957, -0.4488952, -0.5395163, 1, 1, 1, 1, 1,
-1.52621, 0.06860571, -1.922233, 1, 1, 1, 1, 1,
-1.520795, -1.26637, -1.446316, 1, 1, 1, 1, 1,
-1.520751, -0.2692834, -1.36162, 1, 1, 1, 1, 1,
-1.501998, 0.3195134, -1.986232, 1, 1, 1, 1, 1,
-1.493067, 0.7463712, -0.3611487, 1, 1, 1, 1, 1,
-1.488177, -0.5228292, -2.084908, 1, 1, 1, 1, 1,
-1.487046, 0.6748551, -1.154288, 0, 0, 1, 1, 1,
-1.47042, -0.1804391, -0.5040509, 1, 0, 0, 1, 1,
-1.468976, -0.05857123, -1.796664, 1, 0, 0, 1, 1,
-1.462595, 1.426786, -1.010353, 1, 0, 0, 1, 1,
-1.459426, 0.6713775, -1.135207, 1, 0, 0, 1, 1,
-1.445608, 1.743767, -1.053028, 1, 0, 0, 1, 1,
-1.444002, -0.3060315, -4.156841, 0, 0, 0, 1, 1,
-1.435951, 0.1685202, -1.160774, 0, 0, 0, 1, 1,
-1.434437, 0.6470525, -1.262466, 0, 0, 0, 1, 1,
-1.402836, 1.647265, -0.858804, 0, 0, 0, 1, 1,
-1.402147, -0.08866207, -0.8321943, 0, 0, 0, 1, 1,
-1.391549, 0.5026496, -1.975678, 0, 0, 0, 1, 1,
-1.378413, -0.8129002, -1.025083, 0, 0, 0, 1, 1,
-1.368301, -0.9927011, -2.999321, 1, 1, 1, 1, 1,
-1.361381, -0.9751676, -1.690071, 1, 1, 1, 1, 1,
-1.360751, 1.321421, -2.040063, 1, 1, 1, 1, 1,
-1.347483, 0.108217, -2.367608, 1, 1, 1, 1, 1,
-1.338889, 2.342663, -0.5315841, 1, 1, 1, 1, 1,
-1.337251, -0.7049999, -1.698643, 1, 1, 1, 1, 1,
-1.333412, 1.289265, -1.284524, 1, 1, 1, 1, 1,
-1.314392, -0.3275656, -2.105973, 1, 1, 1, 1, 1,
-1.313957, 0.8922917, -1.656144, 1, 1, 1, 1, 1,
-1.309815, 0.3473586, -0.2157039, 1, 1, 1, 1, 1,
-1.292506, -0.8795569, -2.795805, 1, 1, 1, 1, 1,
-1.29114, 1.168624, -0.6315006, 1, 1, 1, 1, 1,
-1.287577, 0.8134512, -0.941511, 1, 1, 1, 1, 1,
-1.279432, -0.9052101, -0.8641655, 1, 1, 1, 1, 1,
-1.277097, -0.8113454, 0.1861608, 1, 1, 1, 1, 1,
-1.271699, 0.0361223, -0.9714078, 0, 0, 1, 1, 1,
-1.242822, 1.616063, -1.19915, 1, 0, 0, 1, 1,
-1.234569, -0.1741651, -1.298225, 1, 0, 0, 1, 1,
-1.230914, 0.07038218, -1.877211, 1, 0, 0, 1, 1,
-1.222604, 0.7249315, -1.134353, 1, 0, 0, 1, 1,
-1.221429, -0.06429729, -3.054124, 1, 0, 0, 1, 1,
-1.211105, -2.057188, -4.809345, 0, 0, 0, 1, 1,
-1.210924, 1.392447, 0.6055656, 0, 0, 0, 1, 1,
-1.208466, 0.502098, -0.9745883, 0, 0, 0, 1, 1,
-1.205935, -0.9304971, -1.841608, 0, 0, 0, 1, 1,
-1.181181, -0.06958465, -2.340451, 0, 0, 0, 1, 1,
-1.178959, 0.4060546, -1.991869, 0, 0, 0, 1, 1,
-1.177055, 0.9823416, -1.262526, 0, 0, 0, 1, 1,
-1.17678, -0.5985805, -0.03437617, 1, 1, 1, 1, 1,
-1.172452, -1.03547, -1.3739, 1, 1, 1, 1, 1,
-1.169591, -0.3988143, -2.061502, 1, 1, 1, 1, 1,
-1.164264, -0.5909695, -2.857556, 1, 1, 1, 1, 1,
-1.163082, -1.04462, -4.032954, 1, 1, 1, 1, 1,
-1.149484, -0.5520595, -1.911676, 1, 1, 1, 1, 1,
-1.145352, 0.1295554, -1.994758, 1, 1, 1, 1, 1,
-1.143592, 0.9495496, -0.3548301, 1, 1, 1, 1, 1,
-1.137353, -0.7536314, -2.911812, 1, 1, 1, 1, 1,
-1.135102, -0.6476594, -0.9691393, 1, 1, 1, 1, 1,
-1.134168, 0.7900648, -0.9328674, 1, 1, 1, 1, 1,
-1.13143, -0.9038562, -1.951968, 1, 1, 1, 1, 1,
-1.127795, 0.3980967, -1.818576, 1, 1, 1, 1, 1,
-1.110825, 0.67758, -1.183482, 1, 1, 1, 1, 1,
-1.108569, -1.094405, -2.803064, 1, 1, 1, 1, 1,
-1.091637, -0.5057678, -1.624889, 0, 0, 1, 1, 1,
-1.088015, 1.254709, -0.09704618, 1, 0, 0, 1, 1,
-1.085606, -0.1000104, -1.746904, 1, 0, 0, 1, 1,
-1.084267, 0.09011534, -3.331586, 1, 0, 0, 1, 1,
-1.076056, 0.06516939, -0.2342443, 1, 0, 0, 1, 1,
-1.075848, 1.014954, -1.231534, 1, 0, 0, 1, 1,
-1.075753, -0.5705767, -1.745238, 0, 0, 0, 1, 1,
-1.074607, 0.5312262, -0.4943365, 0, 0, 0, 1, 1,
-1.067804, 1.827851, -1.525192, 0, 0, 0, 1, 1,
-1.063063, 1.110508, -0.9616342, 0, 0, 0, 1, 1,
-1.05793, -0.04912118, -2.067957, 0, 0, 0, 1, 1,
-1.054322, 0.8774231, 2.029565, 0, 0, 0, 1, 1,
-1.052352, 0.1400731, -1.341203, 0, 0, 0, 1, 1,
-1.028906, -0.550616, -3.154009, 1, 1, 1, 1, 1,
-1.028865, 0.240156, -0.5865774, 1, 1, 1, 1, 1,
-1.02758, -0.5595472, -2.67647, 1, 1, 1, 1, 1,
-1.017456, -1.776779, -1.897239, 1, 1, 1, 1, 1,
-1.014617, 0.6132144, -0.8689836, 1, 1, 1, 1, 1,
-1.014237, -0.9704974, -2.726071, 1, 1, 1, 1, 1,
-1.010931, -0.3593906, -2.810046, 1, 1, 1, 1, 1,
-1.010294, 0.6001564, -2.802036, 1, 1, 1, 1, 1,
-0.9798198, 0.424609, -1.322031, 1, 1, 1, 1, 1,
-0.9724162, 1.076361, -0.3206542, 1, 1, 1, 1, 1,
-0.9667432, -1.20229, -2.863524, 1, 1, 1, 1, 1,
-0.9649184, 0.1285323, -1.147457, 1, 1, 1, 1, 1,
-0.9597609, -2.291581, -2.86573, 1, 1, 1, 1, 1,
-0.9493321, -1.000364, -1.527426, 1, 1, 1, 1, 1,
-0.9451243, -0.9785808, -2.512022, 1, 1, 1, 1, 1,
-0.9401201, 0.8974128, -1.985406, 0, 0, 1, 1, 1,
-0.9371693, 0.9644608, -0.6464801, 1, 0, 0, 1, 1,
-0.9345178, 2.031437, -2.118216, 1, 0, 0, 1, 1,
-0.9334939, -0.004823347, -2.745847, 1, 0, 0, 1, 1,
-0.9284909, -0.8354816, -2.038232, 1, 0, 0, 1, 1,
-0.9236146, -0.3719181, -2.487487, 1, 0, 0, 1, 1,
-0.9170063, 1.257129, -1.801299, 0, 0, 0, 1, 1,
-0.9086002, -1.267864, -2.353793, 0, 0, 0, 1, 1,
-0.9082893, -0.7371565, -0.3506806, 0, 0, 0, 1, 1,
-0.9051112, 0.8767059, -1.879879, 0, 0, 0, 1, 1,
-0.9044368, 0.3555385, 0.5748975, 0, 0, 0, 1, 1,
-0.904094, 0.1730331, -0.8682948, 0, 0, 0, 1, 1,
-0.9015525, -0.6420013, -2.475443, 0, 0, 0, 1, 1,
-0.9009382, -0.5220291, -2.518447, 1, 1, 1, 1, 1,
-0.8996913, 0.3120963, -0.8202605, 1, 1, 1, 1, 1,
-0.8993743, -0.195211, -1.392564, 1, 1, 1, 1, 1,
-0.8980353, -1.647952, -1.315405, 1, 1, 1, 1, 1,
-0.8955525, 1.303116, -0.129009, 1, 1, 1, 1, 1,
-0.8925182, 0.6917625, -1.498152, 1, 1, 1, 1, 1,
-0.8921583, -0.7198913, -2.533702, 1, 1, 1, 1, 1,
-0.8901672, -0.1632426, -0.7808478, 1, 1, 1, 1, 1,
-0.8883657, 1.025675, -0.1230272, 1, 1, 1, 1, 1,
-0.8873037, -0.5945486, -1.353107, 1, 1, 1, 1, 1,
-0.882491, -0.77224, 0.002589411, 1, 1, 1, 1, 1,
-0.8769044, 1.189011, -1.485352, 1, 1, 1, 1, 1,
-0.8764613, 0.1198465, -1.204778, 1, 1, 1, 1, 1,
-0.8690877, -0.6915677, -1.769329, 1, 1, 1, 1, 1,
-0.8690524, -0.6501756, -2.068411, 1, 1, 1, 1, 1,
-0.8681469, -0.1810761, -1.268137, 0, 0, 1, 1, 1,
-0.8632878, 0.9031928, -1.181066, 1, 0, 0, 1, 1,
-0.8549408, 0.5494096, -1.46722, 1, 0, 0, 1, 1,
-0.8526944, -0.8517756, -2.919436, 1, 0, 0, 1, 1,
-0.8519812, -1.181228, -1.220493, 1, 0, 0, 1, 1,
-0.8514706, 0.1878041, -2.534356, 1, 0, 0, 1, 1,
-0.8476318, -0.9690186, -1.474365, 0, 0, 0, 1, 1,
-0.8457382, 0.8248274, -1.150353, 0, 0, 0, 1, 1,
-0.8444685, 0.544866, -0.8808896, 0, 0, 0, 1, 1,
-0.8362151, 1.695247, 0.2688427, 0, 0, 0, 1, 1,
-0.8352631, -0.3882932, -0.5295495, 0, 0, 0, 1, 1,
-0.8319759, 0.3284255, -1.294011, 0, 0, 0, 1, 1,
-0.8304216, -1.73421, -2.213751, 0, 0, 0, 1, 1,
-0.8288603, -1.616788, -4.267971, 1, 1, 1, 1, 1,
-0.8282353, -0.4251775, -4.079711, 1, 1, 1, 1, 1,
-0.8267694, -0.003389397, -1.500736, 1, 1, 1, 1, 1,
-0.8253483, -0.3595027, -2.472535, 1, 1, 1, 1, 1,
-0.8184173, 0.4743294, -2.453321, 1, 1, 1, 1, 1,
-0.8051355, 0.8334594, -1.976782, 1, 1, 1, 1, 1,
-0.8038401, -0.3405441, -0.9624929, 1, 1, 1, 1, 1,
-0.8010378, -0.7649965, -2.729671, 1, 1, 1, 1, 1,
-0.7928668, 0.8234804, 0.5542946, 1, 1, 1, 1, 1,
-0.7911121, 1.200605, 0.4511888, 1, 1, 1, 1, 1,
-0.7882755, -0.05427084, -5.87559, 1, 1, 1, 1, 1,
-0.7862557, -0.7098998, -2.503006, 1, 1, 1, 1, 1,
-0.7810339, 1.73312, 0.9480953, 1, 1, 1, 1, 1,
-0.7771571, -1.04996, -2.600552, 1, 1, 1, 1, 1,
-0.7753639, 1.320622, -2.329966, 1, 1, 1, 1, 1,
-0.7708231, 1.000444, -0.1894348, 0, 0, 1, 1, 1,
-0.7705591, -0.6779723, -2.876987, 1, 0, 0, 1, 1,
-0.7680738, 0.8420315, -0.7478897, 1, 0, 0, 1, 1,
-0.7664739, 1.887654, -2.444472, 1, 0, 0, 1, 1,
-0.7660646, -0.3849959, -3.514332, 1, 0, 0, 1, 1,
-0.7646475, 0.07336019, -2.17815, 1, 0, 0, 1, 1,
-0.7592695, 1.078239, 0.06709282, 0, 0, 0, 1, 1,
-0.7549842, 0.5714195, -1.532349, 0, 0, 0, 1, 1,
-0.7522218, 1.31433, -0.3044536, 0, 0, 0, 1, 1,
-0.7463347, 0.6787263, -0.6557816, 0, 0, 0, 1, 1,
-0.7428295, 0.5563595, 0.1218975, 0, 0, 0, 1, 1,
-0.736917, 0.01441974, -1.436157, 0, 0, 0, 1, 1,
-0.7350714, 1.059711, -0.5734098, 0, 0, 0, 1, 1,
-0.7267038, 1.695406, 0.7238709, 1, 1, 1, 1, 1,
-0.7256894, 0.1371029, -0.5932234, 1, 1, 1, 1, 1,
-0.7240627, -1.242382, -2.519552, 1, 1, 1, 1, 1,
-0.7239903, 0.3952034, -2.322258, 1, 1, 1, 1, 1,
-0.7239467, -1.021647, -3.555511, 1, 1, 1, 1, 1,
-0.7225108, -0.3174505, -2.804554, 1, 1, 1, 1, 1,
-0.7196189, 0.1863461, -0.5146905, 1, 1, 1, 1, 1,
-0.7179422, 0.5492612, -1.568431, 1, 1, 1, 1, 1,
-0.7129392, 1.13755, -0.4099987, 1, 1, 1, 1, 1,
-0.7108066, -0.5031528, -2.098374, 1, 1, 1, 1, 1,
-0.7032852, 0.9727435, 0.2167893, 1, 1, 1, 1, 1,
-0.702441, 0.608947, -2.712063, 1, 1, 1, 1, 1,
-0.7020941, -1.156173, -2.565015, 1, 1, 1, 1, 1,
-0.7016352, 1.609176, 0.05253581, 1, 1, 1, 1, 1,
-0.7009666, -0.08820532, -2.557817, 1, 1, 1, 1, 1,
-0.6999711, -0.2596764, -1.859065, 0, 0, 1, 1, 1,
-0.6950312, 2.147417, -0.930267, 1, 0, 0, 1, 1,
-0.6890533, -1.53835, -2.033849, 1, 0, 0, 1, 1,
-0.6880996, -0.9481015, -1.959615, 1, 0, 0, 1, 1,
-0.6876944, 0.3496342, -0.4307224, 1, 0, 0, 1, 1,
-0.6865306, -2.050491, -4.394987, 1, 0, 0, 1, 1,
-0.6840152, 1.176597, -0.8033878, 0, 0, 0, 1, 1,
-0.6786118, -1.151667, -1.160653, 0, 0, 0, 1, 1,
-0.675155, -0.3735384, -1.902729, 0, 0, 0, 1, 1,
-0.6641085, -0.5576574, -2.467352, 0, 0, 0, 1, 1,
-0.6627006, -0.5844951, -2.753618, 0, 0, 0, 1, 1,
-0.662128, 0.7572707, -1.289555, 0, 0, 0, 1, 1,
-0.6579837, 0.127892, -1.090768, 0, 0, 0, 1, 1,
-0.6571627, 0.7785804, 0.7497586, 1, 1, 1, 1, 1,
-0.6570449, -0.6225061, -1.70708, 1, 1, 1, 1, 1,
-0.6531842, -0.1848434, -2.615831, 1, 1, 1, 1, 1,
-0.6523542, -1.093895, -2.998709, 1, 1, 1, 1, 1,
-0.6512285, 1.498653, -0.5398411, 1, 1, 1, 1, 1,
-0.6381185, 0.1965509, -1.154592, 1, 1, 1, 1, 1,
-0.6353807, -0.3643927, -2.543819, 1, 1, 1, 1, 1,
-0.630456, -0.4524976, -1.139599, 1, 1, 1, 1, 1,
-0.6297897, 0.1304425, -2.050803, 1, 1, 1, 1, 1,
-0.6285409, 0.3709269, -0.3653228, 1, 1, 1, 1, 1,
-0.628525, 2.233062, 0.9082514, 1, 1, 1, 1, 1,
-0.6249864, -0.6152048, -2.432007, 1, 1, 1, 1, 1,
-0.6247221, -1.447768, -3.534849, 1, 1, 1, 1, 1,
-0.6244449, -1.480331, -3.898267, 1, 1, 1, 1, 1,
-0.6230029, -2.105701, -2.364668, 1, 1, 1, 1, 1,
-0.6212025, 0.06062911, -3.795261, 0, 0, 1, 1, 1,
-0.617931, 0.6874205, -0.7583516, 1, 0, 0, 1, 1,
-0.6167425, 0.7699255, 0.6015511, 1, 0, 0, 1, 1,
-0.6131446, 0.1282351, -1.91503, 1, 0, 0, 1, 1,
-0.6104006, 0.2044815, -2.0074, 1, 0, 0, 1, 1,
-0.6054457, 1.456409, -0.5911634, 1, 0, 0, 1, 1,
-0.6019939, 1.500069, -0.0112209, 0, 0, 0, 1, 1,
-0.6015178, -0.8646108, -0.782759, 0, 0, 0, 1, 1,
-0.5993667, 1.359371, -0.7257385, 0, 0, 0, 1, 1,
-0.5991144, -1.352349, -3.02187, 0, 0, 0, 1, 1,
-0.5974954, -0.4502375, -2.472131, 0, 0, 0, 1, 1,
-0.5960935, 1.319625, 0.5922688, 0, 0, 0, 1, 1,
-0.5943257, -1.095865, -3.119619, 0, 0, 0, 1, 1,
-0.5899515, 0.6206473, 0.4773202, 1, 1, 1, 1, 1,
-0.5869023, 1.656817, -0.3053444, 1, 1, 1, 1, 1,
-0.5832854, 0.494718, -1.103039, 1, 1, 1, 1, 1,
-0.5772706, 0.001576453, -0.6295282, 1, 1, 1, 1, 1,
-0.574239, 0.6702408, -0.4005373, 1, 1, 1, 1, 1,
-0.5717834, -0.3964688, -2.253715, 1, 1, 1, 1, 1,
-0.5707068, -1.618241, -3.244911, 1, 1, 1, 1, 1,
-0.5667815, 0.2954517, -1.849642, 1, 1, 1, 1, 1,
-0.5646151, -1.038822, -2.85063, 1, 1, 1, 1, 1,
-0.5643825, -0.5524861, -2.29057, 1, 1, 1, 1, 1,
-0.5610411, 0.767482, -1.010516, 1, 1, 1, 1, 1,
-0.5598996, 3.48479, 0.9094886, 1, 1, 1, 1, 1,
-0.559703, 0.7766515, -0.3961195, 1, 1, 1, 1, 1,
-0.5587123, 0.5378992, -1.48911, 1, 1, 1, 1, 1,
-0.557944, 0.9070507, -0.3232329, 1, 1, 1, 1, 1,
-0.5552474, -0.3628728, -2.965229, 0, 0, 1, 1, 1,
-0.5480933, -0.3508105, -0.8981603, 1, 0, 0, 1, 1,
-0.5466293, 0.3290455, -0.4634501, 1, 0, 0, 1, 1,
-0.5445704, 0.2694328, -0.5382019, 1, 0, 0, 1, 1,
-0.5436515, -0.775551, -2.981011, 1, 0, 0, 1, 1,
-0.5382803, 0.434846, -1.750021, 1, 0, 0, 1, 1,
-0.5349292, 0.3871061, -2.201568, 0, 0, 0, 1, 1,
-0.5338733, -1.863931, -3.892854, 0, 0, 0, 1, 1,
-0.5311376, 0.8233339, 0.2627537, 0, 0, 0, 1, 1,
-0.5303426, 0.7533816, -1.046462, 0, 0, 0, 1, 1,
-0.5291384, -0.4161528, -1.972, 0, 0, 0, 1, 1,
-0.5250807, 0.05557467, -1.373795, 0, 0, 0, 1, 1,
-0.5207477, -1.400156, -1.889897, 0, 0, 0, 1, 1,
-0.5183957, -0.3263921, -2.52534, 1, 1, 1, 1, 1,
-0.5136831, -0.7398612, -3.292344, 1, 1, 1, 1, 1,
-0.5125721, 1.002311, -0.1465046, 1, 1, 1, 1, 1,
-0.5045002, -1.661523, -3.593819, 1, 1, 1, 1, 1,
-0.5026292, -0.7537489, -3.276253, 1, 1, 1, 1, 1,
-0.5000618, 0.6350733, -0.7311885, 1, 1, 1, 1, 1,
-0.4996613, 1.245966, -1.952466, 1, 1, 1, 1, 1,
-0.4985496, 0.7709975, 0.2937942, 1, 1, 1, 1, 1,
-0.4977268, -0.7115075, -3.371469, 1, 1, 1, 1, 1,
-0.4925703, 1.523472, -1.4621, 1, 1, 1, 1, 1,
-0.4914463, 0.1574919, 0.1886419, 1, 1, 1, 1, 1,
-0.4911451, 1.951174, 0.8202868, 1, 1, 1, 1, 1,
-0.491043, 0.7555391, -0.4638377, 1, 1, 1, 1, 1,
-0.4867078, 2.076903, -1.248323, 1, 1, 1, 1, 1,
-0.4856445, -1.250953, -3.288183, 1, 1, 1, 1, 1,
-0.4832106, -1.317387, -2.681296, 0, 0, 1, 1, 1,
-0.4766415, 0.1502496, -1.274559, 1, 0, 0, 1, 1,
-0.4764232, 0.5040101, -1.556132, 1, 0, 0, 1, 1,
-0.4741157, -0.09429842, -1.456871, 1, 0, 0, 1, 1,
-0.4741096, 0.4025749, -2.284417, 1, 0, 0, 1, 1,
-0.4736308, 0.8551047, 1.318778, 1, 0, 0, 1, 1,
-0.4724194, -1.947221, -1.012275, 0, 0, 0, 1, 1,
-0.4702957, -0.6271757, -1.637945, 0, 0, 0, 1, 1,
-0.4650602, 0.6001421, -0.300862, 0, 0, 0, 1, 1,
-0.4624656, -0.1130224, -2.196197, 0, 0, 0, 1, 1,
-0.4615892, -0.2813239, -3.022217, 0, 0, 0, 1, 1,
-0.4588578, 1.087733, -0.7214553, 0, 0, 0, 1, 1,
-0.4588217, -0.6478245, -1.63997, 0, 0, 0, 1, 1,
-0.4569007, -0.1382651, -3.416977, 1, 1, 1, 1, 1,
-0.453105, -0.1216262, -1.722321, 1, 1, 1, 1, 1,
-0.4502174, 0.7285625, -0.7751769, 1, 1, 1, 1, 1,
-0.4497624, -0.3511627, -0.9903802, 1, 1, 1, 1, 1,
-0.4472961, 0.7083616, -1.625405, 1, 1, 1, 1, 1,
-0.4471124, -0.3651732, -2.781805, 1, 1, 1, 1, 1,
-0.4467833, -0.9118505, -2.803602, 1, 1, 1, 1, 1,
-0.4446317, 0.3141952, -2.117261, 1, 1, 1, 1, 1,
-0.4423168, 0.9927884, -1.339726, 1, 1, 1, 1, 1,
-0.4418417, -1.212079, -0.7559391, 1, 1, 1, 1, 1,
-0.43953, 0.210005, -0.56765, 1, 1, 1, 1, 1,
-0.4391402, -1.007643, -3.498668, 1, 1, 1, 1, 1,
-0.4377483, 1.025232, 0.5036572, 1, 1, 1, 1, 1,
-0.432694, 1.357404, -2.176084, 1, 1, 1, 1, 1,
-0.4323273, 0.6888891, -0.2398888, 1, 1, 1, 1, 1,
-0.427773, -0.5952789, -3.377848, 0, 0, 1, 1, 1,
-0.4233347, 0.9375957, 0.1908167, 1, 0, 0, 1, 1,
-0.4216737, -1.157349, -1.955242, 1, 0, 0, 1, 1,
-0.4206007, 0.8336457, -0.3456855, 1, 0, 0, 1, 1,
-0.4165016, 0.3993856, 0.6039087, 1, 0, 0, 1, 1,
-0.4155359, 0.4558106, -1.402331, 1, 0, 0, 1, 1,
-0.415474, -1.996336, -3.239213, 0, 0, 0, 1, 1,
-0.4153683, -0.6336487, -1.714648, 0, 0, 0, 1, 1,
-0.4122881, -1.920618, -1.869286, 0, 0, 0, 1, 1,
-0.4088505, -0.4996321, -3.837917, 0, 0, 0, 1, 1,
-0.4088145, 0.169857, -1.851768, 0, 0, 0, 1, 1,
-0.407879, 1.418091, 0.5201368, 0, 0, 0, 1, 1,
-0.4008255, -0.02709181, 0.9704738, 0, 0, 0, 1, 1,
-0.3978056, 1.272056, -0.6028495, 1, 1, 1, 1, 1,
-0.3975752, -0.006968225, -1.991111, 1, 1, 1, 1, 1,
-0.3967525, -1.400432, -2.019349, 1, 1, 1, 1, 1,
-0.3926004, 0.4447705, -0.2213742, 1, 1, 1, 1, 1,
-0.3873275, 1.693332, 1.123168, 1, 1, 1, 1, 1,
-0.3830298, 0.8735712, -0.7220594, 1, 1, 1, 1, 1,
-0.3786097, 1.628138, -0.5007867, 1, 1, 1, 1, 1,
-0.375209, -0.08019259, -0.8226236, 1, 1, 1, 1, 1,
-0.3714046, -0.4959762, -0.4870457, 1, 1, 1, 1, 1,
-0.3608152, 1.168451, 0.1895046, 1, 1, 1, 1, 1,
-0.3511941, 1.295852, -0.1477767, 1, 1, 1, 1, 1,
-0.3506098, -0.9414911, -3.94668, 1, 1, 1, 1, 1,
-0.3504159, 0.1187609, -1.375914, 1, 1, 1, 1, 1,
-0.3489169, -1.340291, -1.723344, 1, 1, 1, 1, 1,
-0.3477217, 1.127552, 0.1031358, 1, 1, 1, 1, 1,
-0.3454942, 1.866272, -1.033205, 0, 0, 1, 1, 1,
-0.3446504, -0.7518415, -3.525733, 1, 0, 0, 1, 1,
-0.3411367, -0.8240014, -2.08427, 1, 0, 0, 1, 1,
-0.3376229, 0.2671345, -1.904062, 1, 0, 0, 1, 1,
-0.3372856, 1.232269, 1.932945, 1, 0, 0, 1, 1,
-0.3342575, -0.4601414, -1.516857, 1, 0, 0, 1, 1,
-0.3286105, -2.300195, -2.823319, 0, 0, 0, 1, 1,
-0.3260096, -1.175486, -2.753077, 0, 0, 0, 1, 1,
-0.3253268, -0.1558237, 0.3113133, 0, 0, 0, 1, 1,
-0.3231402, 0.3911883, -1.846706, 0, 0, 0, 1, 1,
-0.3219522, -0.6634937, -1.696766, 0, 0, 0, 1, 1,
-0.3212058, 0.4869711, 1.181148, 0, 0, 0, 1, 1,
-0.3200217, 0.3192352, -1.409834, 0, 0, 0, 1, 1,
-0.3170832, 1.307755, -0.7684991, 1, 1, 1, 1, 1,
-0.3167286, -1.871525, -1.314194, 1, 1, 1, 1, 1,
-0.3125708, -0.09954799, -1.466025, 1, 1, 1, 1, 1,
-0.3080908, 0.21244, -1.811819, 1, 1, 1, 1, 1,
-0.3033744, -0.06056498, -1.384563, 1, 1, 1, 1, 1,
-0.3011207, -0.3399639, -1.794002, 1, 1, 1, 1, 1,
-0.2994544, -0.2360063, -1.278703, 1, 1, 1, 1, 1,
-0.2959822, 1.634331, 1.235237, 1, 1, 1, 1, 1,
-0.2958654, 0.7738814, 0.8140945, 1, 1, 1, 1, 1,
-0.2958154, -0.4233442, -2.965947, 1, 1, 1, 1, 1,
-0.2928262, 0.9694635, -0.5738135, 1, 1, 1, 1, 1,
-0.2903628, -0.7840278, -2.638503, 1, 1, 1, 1, 1,
-0.2858709, 1.997304, 0.575079, 1, 1, 1, 1, 1,
-0.2836678, -0.08947247, -2.58106, 1, 1, 1, 1, 1,
-0.2788463, 0.7578617, 0.09670895, 1, 1, 1, 1, 1,
-0.2772311, 1.746814, -0.539698, 0, 0, 1, 1, 1,
-0.2735259, 0.1996228, -1.048558, 1, 0, 0, 1, 1,
-0.2698992, -0.7913638, -3.099308, 1, 0, 0, 1, 1,
-0.2669327, 0.01078296, -3.135912, 1, 0, 0, 1, 1,
-0.2656704, -1.617907, -1.624364, 1, 0, 0, 1, 1,
-0.2654818, -0.3673529, -3.091274, 1, 0, 0, 1, 1,
-0.2612497, -2.330964, -3.835174, 0, 0, 0, 1, 1,
-0.2576286, -0.6658137, -2.415435, 0, 0, 0, 1, 1,
-0.2539821, -0.8924646, -3.026312, 0, 0, 0, 1, 1,
-0.2481731, 0.2864315, -0.04859625, 0, 0, 0, 1, 1,
-0.2435219, -1.818102, -1.40835, 0, 0, 0, 1, 1,
-0.2306411, -0.1580771, -1.159227, 0, 0, 0, 1, 1,
-0.2272756, -0.3947413, -2.60752, 0, 0, 0, 1, 1,
-0.2250804, 1.621823, 2.644452, 1, 1, 1, 1, 1,
-0.21278, 0.986569, -2.306298, 1, 1, 1, 1, 1,
-0.2112975, -1.194361, -2.090257, 1, 1, 1, 1, 1,
-0.2109536, -1.129369, -2.648311, 1, 1, 1, 1, 1,
-0.2097451, -0.1823161, -1.337716, 1, 1, 1, 1, 1,
-0.2090439, 0.146195, -1.92852, 1, 1, 1, 1, 1,
-0.2086301, 0.01719365, -0.6781152, 1, 1, 1, 1, 1,
-0.2074462, -0.04701843, -1.082221, 1, 1, 1, 1, 1,
-0.2016184, -0.5283125, -2.267758, 1, 1, 1, 1, 1,
-0.196401, 0.3583371, 0.7638752, 1, 1, 1, 1, 1,
-0.188692, -0.04192219, -2.351982, 1, 1, 1, 1, 1,
-0.1862138, -0.06737658, -3.927485, 1, 1, 1, 1, 1,
-0.182269, -0.961249, -1.764402, 1, 1, 1, 1, 1,
-0.1816573, 1.14238, 0.8611113, 1, 1, 1, 1, 1,
-0.1807782, -0.7812544, -2.537957, 1, 1, 1, 1, 1,
-0.1786853, 0.8344744, 0.433839, 0, 0, 1, 1, 1,
-0.1766329, 0.401528, -1.733878, 1, 0, 0, 1, 1,
-0.1745753, 0.2452623, -0.8460568, 1, 0, 0, 1, 1,
-0.1736799, -0.4569886, -1.635605, 1, 0, 0, 1, 1,
-0.1734421, 1.129075, 0.02848335, 1, 0, 0, 1, 1,
-0.1720111, 0.04235754, -1.683558, 1, 0, 0, 1, 1,
-0.1719888, -0.01499949, 0.5234987, 0, 0, 0, 1, 1,
-0.1716053, 1.559288, -0.285689, 0, 0, 0, 1, 1,
-0.1657464, 0.02220579, -1.354698, 0, 0, 0, 1, 1,
-0.1641923, 0.4691353, -0.7301179, 0, 0, 0, 1, 1,
-0.163761, -1.334084, -2.198419, 0, 0, 0, 1, 1,
-0.1619309, -0.5754329, -4.285352, 0, 0, 0, 1, 1,
-0.1597852, 0.9245622, 0.7621039, 0, 0, 0, 1, 1,
-0.154653, -2.075031, -1.871022, 1, 1, 1, 1, 1,
-0.1488757, 0.6750631, -0.07543895, 1, 1, 1, 1, 1,
-0.1485748, 0.08958275, -1.973947, 1, 1, 1, 1, 1,
-0.1461788, 0.9735884, 0.76235, 1, 1, 1, 1, 1,
-0.145945, -1.323712, -2.800241, 1, 1, 1, 1, 1,
-0.1440315, -0.8342638, -1.592622, 1, 1, 1, 1, 1,
-0.1419068, 0.3495286, -1.033606, 1, 1, 1, 1, 1,
-0.1417044, 1.385334, 0.5301445, 1, 1, 1, 1, 1,
-0.1347206, 0.2928413, -0.1277715, 1, 1, 1, 1, 1,
-0.1336168, 0.3394271, 0.06641698, 1, 1, 1, 1, 1,
-0.1324431, 0.9213446, 1.261719, 1, 1, 1, 1, 1,
-0.1294966, -0.9340268, -3.828854, 1, 1, 1, 1, 1,
-0.1208051, 0.7833849, -0.3864606, 1, 1, 1, 1, 1,
-0.1207355, -1.250373, -1.224231, 1, 1, 1, 1, 1,
-0.1204464, -0.2646495, -1.751859, 1, 1, 1, 1, 1,
-0.1197559, -0.5492269, -3.429976, 0, 0, 1, 1, 1,
-0.1173542, 0.27218, 0.5788568, 1, 0, 0, 1, 1,
-0.115679, 0.08557143, -0.109674, 1, 0, 0, 1, 1,
-0.1126184, -1.470058, -2.803805, 1, 0, 0, 1, 1,
-0.1004179, 0.4308796, -0.5287222, 1, 0, 0, 1, 1,
-0.09685583, -0.3303129, -3.058979, 1, 0, 0, 1, 1,
-0.09158088, 0.4783195, -0.5987732, 0, 0, 0, 1, 1,
-0.09150428, 0.9490381, 0.6720571, 0, 0, 0, 1, 1,
-0.09092458, -0.1163994, -1.288022, 0, 0, 0, 1, 1,
-0.08964944, -0.1273832, -2.181587, 0, 0, 0, 1, 1,
-0.08794412, -0.6335585, -1.241678, 0, 0, 0, 1, 1,
-0.08087997, 0.8910274, -0.8383686, 0, 0, 0, 1, 1,
-0.08070498, 0.1362262, 0.06893083, 0, 0, 0, 1, 1,
-0.07571998, 1.675164, 0.2166685, 1, 1, 1, 1, 1,
-0.07494093, -0.9095764, -3.661337, 1, 1, 1, 1, 1,
-0.06664053, 1.160888, -0.8894931, 1, 1, 1, 1, 1,
-0.06640808, 1.135506, -0.7631316, 1, 1, 1, 1, 1,
-0.06520624, 0.1899465, -0.09798793, 1, 1, 1, 1, 1,
-0.06506058, -0.2604588, -2.827039, 1, 1, 1, 1, 1,
-0.05435113, 1.566398, 0.1135825, 1, 1, 1, 1, 1,
-0.05126848, -1.336234, -2.177702, 1, 1, 1, 1, 1,
-0.04951978, -1.512357, -1.590953, 1, 1, 1, 1, 1,
-0.04698898, -1.498375, -3.28814, 1, 1, 1, 1, 1,
-0.04493871, -1.077109, -4.076988, 1, 1, 1, 1, 1,
-0.03635076, -0.7781144, -2.877898, 1, 1, 1, 1, 1,
-0.03624642, -1.304792, -2.818558, 1, 1, 1, 1, 1,
-0.03600549, 0.2112367, 0.5517011, 1, 1, 1, 1, 1,
-0.03572535, 0.5417298, 0.8490828, 1, 1, 1, 1, 1,
-0.03549283, -0.7716307, -3.070368, 0, 0, 1, 1, 1,
-0.0323016, -1.445317, -4.297178, 1, 0, 0, 1, 1,
-0.02741604, -2.628515, -3.076501, 1, 0, 0, 1, 1,
-0.02716455, 0.4087293, 1.334679, 1, 0, 0, 1, 1,
-0.02707716, 0.160668, 0.5900766, 1, 0, 0, 1, 1,
-0.02690819, -0.04074044, -3.848613, 1, 0, 0, 1, 1,
-0.02147304, -0.4880077, -4.830292, 0, 0, 0, 1, 1,
-0.01939613, -0.2744408, -2.79647, 0, 0, 0, 1, 1,
-0.01742976, 0.4968958, 1.126203, 0, 0, 0, 1, 1,
-0.01656264, -1.066966, -1.769892, 0, 0, 0, 1, 1,
-0.008983793, 1.414412, 0.6608126, 0, 0, 0, 1, 1,
-0.002138745, 1.460672, 0.2006993, 0, 0, 0, 1, 1,
0.006452278, 0.5690449, -3.147105, 0, 0, 0, 1, 1,
0.00848436, 0.1740929, 0.8283428, 1, 1, 1, 1, 1,
0.01097723, 0.04182971, 1.297854, 1, 1, 1, 1, 1,
0.01147827, 0.53142, -0.9384041, 1, 1, 1, 1, 1,
0.01812061, 0.4495473, -0.9210027, 1, 1, 1, 1, 1,
0.02126745, 1.618766, -0.02296074, 1, 1, 1, 1, 1,
0.02351957, -1.921109, 3.603942, 1, 1, 1, 1, 1,
0.0242944, -0.01920841, 2.088375, 1, 1, 1, 1, 1,
0.0290265, -1.77547, 3.146557, 1, 1, 1, 1, 1,
0.03095925, 0.6655198, -0.4384212, 1, 1, 1, 1, 1,
0.03179789, 0.7084243, 0.4777623, 1, 1, 1, 1, 1,
0.03716911, 0.1522235, 1.023908, 1, 1, 1, 1, 1,
0.03922712, 0.4506482, -1.423719, 1, 1, 1, 1, 1,
0.04119131, -1.013642, 4.044029, 1, 1, 1, 1, 1,
0.04157931, -0.9459041, 3.534443, 1, 1, 1, 1, 1,
0.0458157, -0.3084604, 2.106685, 1, 1, 1, 1, 1,
0.0462546, 0.866081, 1.069022, 0, 0, 1, 1, 1,
0.04654429, 0.08075991, -0.9370279, 1, 0, 0, 1, 1,
0.05184368, -0.3712874, 2.497879, 1, 0, 0, 1, 1,
0.05217653, -1.00893, 3.877969, 1, 0, 0, 1, 1,
0.0563224, 1.319492, 1.664504, 1, 0, 0, 1, 1,
0.05969378, 0.3478722, 0.2508996, 1, 0, 0, 1, 1,
0.0609184, -0.9717761, 2.829073, 0, 0, 0, 1, 1,
0.06253611, -0.360344, 4.648791, 0, 0, 0, 1, 1,
0.06322276, -2.066792, 4.743762, 0, 0, 0, 1, 1,
0.06636235, 0.3772855, 1.168525, 0, 0, 0, 1, 1,
0.06839552, 0.1020397, -0.08893571, 0, 0, 0, 1, 1,
0.06934171, 1.763272, 1.754117, 0, 0, 0, 1, 1,
0.07192579, 0.3340829, 1.100332, 0, 0, 0, 1, 1,
0.07225922, -0.1250955, 3.635045, 1, 1, 1, 1, 1,
0.07371598, 0.6127244, 0.8848335, 1, 1, 1, 1, 1,
0.07493496, -0.3383226, 1.34489, 1, 1, 1, 1, 1,
0.07995831, 1.97086, 0.9865946, 1, 1, 1, 1, 1,
0.08661928, 1.51136, -0.04861411, 1, 1, 1, 1, 1,
0.09717955, -0.7462817, 2.793131, 1, 1, 1, 1, 1,
0.09956472, -0.4840254, 2.161896, 1, 1, 1, 1, 1,
0.1044807, 2.49027, -1.837977, 1, 1, 1, 1, 1,
0.1101639, -0.3259174, 2.678673, 1, 1, 1, 1, 1,
0.1101983, 3.692322, 0.1676952, 1, 1, 1, 1, 1,
0.1200611, -0.694379, 4.29013, 1, 1, 1, 1, 1,
0.1205255, 0.5912519, 1.263417, 1, 1, 1, 1, 1,
0.1214557, 0.3758872, -0.3551761, 1, 1, 1, 1, 1,
0.1237859, -1.407638, 4.379297, 1, 1, 1, 1, 1,
0.1253451, -0.678677, 2.147129, 1, 1, 1, 1, 1,
0.1285792, -0.2198181, 3.180626, 0, 0, 1, 1, 1,
0.1332988, -1.705101, 3.502402, 1, 0, 0, 1, 1,
0.1355006, -0.07101676, 2.251522, 1, 0, 0, 1, 1,
0.1355069, 0.1221876, 0.4678379, 1, 0, 0, 1, 1,
0.1355166, 0.9357042, 0.08216895, 1, 0, 0, 1, 1,
0.1427172, -0.8053479, 2.266209, 1, 0, 0, 1, 1,
0.1438503, 0.3202361, -0.8705136, 0, 0, 0, 1, 1,
0.1445553, 1.134171, -0.6968254, 0, 0, 0, 1, 1,
0.1446986, -1.470218, 3.199677, 0, 0, 0, 1, 1,
0.1456308, -0.4896941, 3.107669, 0, 0, 0, 1, 1,
0.150406, -0.7492748, 4.401583, 0, 0, 0, 1, 1,
0.151989, 2.468419, 0.818314, 0, 0, 0, 1, 1,
0.1550732, 1.840654, -1.16164, 0, 0, 0, 1, 1,
0.1605903, -0.710206, 1.436452, 1, 1, 1, 1, 1,
0.163331, -0.51684, 3.770273, 1, 1, 1, 1, 1,
0.164192, 1.016164, -2.127213, 1, 1, 1, 1, 1,
0.1648329, 0.2805777, -1.187748, 1, 1, 1, 1, 1,
0.1656541, -0.7047128, 5.325548, 1, 1, 1, 1, 1,
0.1685413, -0.3416842, 1.394282, 1, 1, 1, 1, 1,
0.1821392, 0.7547284, -2.133025, 1, 1, 1, 1, 1,
0.1833103, -0.7586948, 3.292791, 1, 1, 1, 1, 1,
0.1846847, 0.09918948, 0.676431, 1, 1, 1, 1, 1,
0.1864488, 0.004219401, 2.171775, 1, 1, 1, 1, 1,
0.186866, -1.940242, 0.4560781, 1, 1, 1, 1, 1,
0.187673, -0.004487818, 2.210968, 1, 1, 1, 1, 1,
0.1885912, 0.2715748, 1.284688, 1, 1, 1, 1, 1,
0.1895995, 0.1750872, 0.6228821, 1, 1, 1, 1, 1,
0.1908401, -0.1624156, 3.240037, 1, 1, 1, 1, 1,
0.1933099, -1.29819, 2.951209, 0, 0, 1, 1, 1,
0.1995588, 0.6034684, -0.6332074, 1, 0, 0, 1, 1,
0.1997056, 0.7417072, -0.4722877, 1, 0, 0, 1, 1,
0.200665, 0.09264502, 2.579511, 1, 0, 0, 1, 1,
0.2008613, 0.7327138, -1.688878, 1, 0, 0, 1, 1,
0.2014991, -2.127587, 0.8760791, 1, 0, 0, 1, 1,
0.2023316, -1.350032, 3.06636, 0, 0, 0, 1, 1,
0.2111894, -0.06459684, 0.5793729, 0, 0, 0, 1, 1,
0.2123237, 0.6547085, 1.527201, 0, 0, 0, 1, 1,
0.215367, 0.5554011, -0.1542542, 0, 0, 0, 1, 1,
0.2222394, 0.6738332, -0.1966334, 0, 0, 0, 1, 1,
0.2323291, -0.07716558, 1.41961, 0, 0, 0, 1, 1,
0.2348947, 1.680204, 1.474359, 0, 0, 0, 1, 1,
0.2390818, 0.7336075, 1.192366, 1, 1, 1, 1, 1,
0.251562, -0.1539574, 2.912954, 1, 1, 1, 1, 1,
0.2540394, -2.772386, 3.194708, 1, 1, 1, 1, 1,
0.254508, -0.4426933, 2.504839, 1, 1, 1, 1, 1,
0.2566594, -0.4662864, 1.785973, 1, 1, 1, 1, 1,
0.2572507, 1.381527, 0.9088173, 1, 1, 1, 1, 1,
0.2624544, -0.2275003, 2.649215, 1, 1, 1, 1, 1,
0.2644989, 1.072939, 1.200216, 1, 1, 1, 1, 1,
0.2645417, 1.252715, -1.630043, 1, 1, 1, 1, 1,
0.2646311, 0.7827331, 1.24242, 1, 1, 1, 1, 1,
0.2654815, -0.4527492, 2.858352, 1, 1, 1, 1, 1,
0.2664095, -0.1043246, 0.325462, 1, 1, 1, 1, 1,
0.2733122, -0.9487455, 2.569516, 1, 1, 1, 1, 1,
0.2744545, 0.4210541, 0.7419409, 1, 1, 1, 1, 1,
0.2759303, 0.04928428, 2.851002, 1, 1, 1, 1, 1,
0.2759724, 0.1695253, -1.009913, 0, 0, 1, 1, 1,
0.2831171, -0.1982492, 0.7284437, 1, 0, 0, 1, 1,
0.2835435, 0.2523718, 1.150731, 1, 0, 0, 1, 1,
0.2846504, -1.885528, 3.871333, 1, 0, 0, 1, 1,
0.287347, -0.9360293, 3.249588, 1, 0, 0, 1, 1,
0.2875918, 1.544212, -0.5314567, 1, 0, 0, 1, 1,
0.2901022, 0.1104623, 3.118615, 0, 0, 0, 1, 1,
0.2910428, 1.579202, -0.8982469, 0, 0, 0, 1, 1,
0.3056324, -1.890345, 4.346025, 0, 0, 0, 1, 1,
0.3063293, -0.2191861, 3.678807, 0, 0, 0, 1, 1,
0.3071647, 0.04200722, 0.2859282, 0, 0, 0, 1, 1,
0.3073758, -1.666522, 1.673763, 0, 0, 0, 1, 1,
0.3102169, 1.022731, -1.033414, 0, 0, 0, 1, 1,
0.3106009, -1.436704, 2.274996, 1, 1, 1, 1, 1,
0.3112454, -1.200354, 2.559788, 1, 1, 1, 1, 1,
0.3115984, 0.3993896, 0.4803185, 1, 1, 1, 1, 1,
0.3163358, -0.2950091, 1.984272, 1, 1, 1, 1, 1,
0.3186322, -0.03738971, 1.940263, 1, 1, 1, 1, 1,
0.3191007, 0.7931203, 0.8132489, 1, 1, 1, 1, 1,
0.3208564, 1.199474, 0.1264252, 1, 1, 1, 1, 1,
0.3226981, 0.06336793, 0.08542058, 1, 1, 1, 1, 1,
0.329232, -1.001402, 1.669977, 1, 1, 1, 1, 1,
0.331935, 0.03839647, 1.593675, 1, 1, 1, 1, 1,
0.3362541, 0.3953802, 2.90266, 1, 1, 1, 1, 1,
0.3378599, 0.2548227, 2.307671, 1, 1, 1, 1, 1,
0.3402981, -0.9526868, 2.623037, 1, 1, 1, 1, 1,
0.3426519, -1.900759, 1.328971, 1, 1, 1, 1, 1,
0.3484559, -1.081398, 2.842111, 1, 1, 1, 1, 1,
0.3528945, -1.226118, 3.985489, 0, 0, 1, 1, 1,
0.3547996, 1.136608, 0.1020658, 1, 0, 0, 1, 1,
0.3580211, -1.013764, 2.893953, 1, 0, 0, 1, 1,
0.3598657, 0.657683, 1.634962, 1, 0, 0, 1, 1,
0.3599719, -0.2916288, 3.287004, 1, 0, 0, 1, 1,
0.3607048, -0.8452673, 4.25096, 1, 0, 0, 1, 1,
0.3609652, -0.912136, 2.315145, 0, 0, 0, 1, 1,
0.3641867, 0.2116555, 0.8251784, 0, 0, 0, 1, 1,
0.3674626, 0.4488108, 0.3393597, 0, 0, 0, 1, 1,
0.3757298, -0.2194048, 2.575878, 0, 0, 0, 1, 1,
0.3787662, -1.792213, 2.59903, 0, 0, 0, 1, 1,
0.3813208, 0.4159521, 0.2781391, 0, 0, 0, 1, 1,
0.3855351, 0.3389578, -0.1036397, 0, 0, 0, 1, 1,
0.387305, 0.9873624, -1.193089, 1, 1, 1, 1, 1,
0.3902152, -0.1955644, 1.808057, 1, 1, 1, 1, 1,
0.3942875, 1.670817, 0.08700543, 1, 1, 1, 1, 1,
0.3947666, 0.4942513, 1.344401, 1, 1, 1, 1, 1,
0.3961396, -0.878149, -0.2248169, 1, 1, 1, 1, 1,
0.3968127, 0.4235107, 1.342921, 1, 1, 1, 1, 1,
0.3973092, -1.174588, 4.670926, 1, 1, 1, 1, 1,
0.4003001, 1.634924, 0.06485637, 1, 1, 1, 1, 1,
0.4048645, -0.2544321, 3.197577, 1, 1, 1, 1, 1,
0.4071694, 1.391191, 1.452652, 1, 1, 1, 1, 1,
0.4086299, 1.258339, 0.09017061, 1, 1, 1, 1, 1,
0.4111508, -0.2231305, 1.534622, 1, 1, 1, 1, 1,
0.4130766, 0.382987, -0.3459412, 1, 1, 1, 1, 1,
0.4132335, -1.228094, 3.734439, 1, 1, 1, 1, 1,
0.4168856, 0.9629653, -0.03980987, 1, 1, 1, 1, 1,
0.4176471, 0.03734437, 1.529543, 0, 0, 1, 1, 1,
0.4188711, -0.4153321, 2.516105, 1, 0, 0, 1, 1,
0.4200766, -0.02917345, 1.926368, 1, 0, 0, 1, 1,
0.4212681, -0.7923539, 2.660263, 1, 0, 0, 1, 1,
0.4279402, 2.164863, 0.2793393, 1, 0, 0, 1, 1,
0.4290771, 1.563026, 0.237196, 1, 0, 0, 1, 1,
0.4296453, -0.214754, 3.07118, 0, 0, 0, 1, 1,
0.4395157, -0.07161688, 0.8812296, 0, 0, 0, 1, 1,
0.4409819, -1.572639, 3.174041, 0, 0, 0, 1, 1,
0.4415178, -0.7892493, 1.657881, 0, 0, 0, 1, 1,
0.4435661, -1.278861, 2.606591, 0, 0, 0, 1, 1,
0.4564294, -0.3812386, 0.01000692, 0, 0, 0, 1, 1,
0.4572625, 0.2440385, 2.262149, 0, 0, 0, 1, 1,
0.4617904, -1.23286, 2.69378, 1, 1, 1, 1, 1,
0.4661136, 1.679927, -1.172469, 1, 1, 1, 1, 1,
0.4669512, 0.5069901, 1.315637, 1, 1, 1, 1, 1,
0.4687161, 0.8176895, 0.4532738, 1, 1, 1, 1, 1,
0.4705962, -1.606132, 2.316663, 1, 1, 1, 1, 1,
0.4743138, -0.2495369, 2.003655, 1, 1, 1, 1, 1,
0.4744049, 0.8265774, 1.451413, 1, 1, 1, 1, 1,
0.4758078, 0.4456817, -0.1556417, 1, 1, 1, 1, 1,
0.4775416, 0.4625498, 1.975052, 1, 1, 1, 1, 1,
0.4787497, -0.4743021, 1.897487, 1, 1, 1, 1, 1,
0.4850208, -0.4304772, 2.297843, 1, 1, 1, 1, 1,
0.4867231, -0.1430299, 3.149243, 1, 1, 1, 1, 1,
0.4868797, 0.5784141, 0.9838529, 1, 1, 1, 1, 1,
0.4885509, 0.2394566, -0.02103744, 1, 1, 1, 1, 1,
0.4908203, 0.7871788, 1.854084, 1, 1, 1, 1, 1,
0.4923287, 1.123221, -0.5464947, 0, 0, 1, 1, 1,
0.4957357, -1.250157, 3.701106, 1, 0, 0, 1, 1,
0.4986595, 0.8850909, 0.8082889, 1, 0, 0, 1, 1,
0.4986836, 0.4362898, 0.4270109, 1, 0, 0, 1, 1,
0.5005626, 0.3818926, 1.635935, 1, 0, 0, 1, 1,
0.5096844, 2.233014, 0.4773446, 1, 0, 0, 1, 1,
0.5140454, 0.4602428, 0.04103374, 0, 0, 0, 1, 1,
0.5186508, -0.2641458, 2.77475, 0, 0, 0, 1, 1,
0.5190454, 0.03891527, 3.185519, 0, 0, 0, 1, 1,
0.5194378, -1.16276, 3.457024, 0, 0, 0, 1, 1,
0.5195321, 0.4188495, 0.7604719, 0, 0, 0, 1, 1,
0.5219736, 0.8838846, -0.6731849, 0, 0, 0, 1, 1,
0.5230278, -0.5908739, 2.714216, 0, 0, 0, 1, 1,
0.52335, -1.137384, 1.996832, 1, 1, 1, 1, 1,
0.5245826, -0.3159446, 2.121371, 1, 1, 1, 1, 1,
0.530408, 0.8887853, -0.8539743, 1, 1, 1, 1, 1,
0.5315709, 0.4721897, 2.743848, 1, 1, 1, 1, 1,
0.5349635, 0.09479059, 2.843222, 1, 1, 1, 1, 1,
0.5349723, 0.7048472, -0.1993747, 1, 1, 1, 1, 1,
0.5404522, -1.283054, 1.171762, 1, 1, 1, 1, 1,
0.5410293, 0.9064799, -1.46178, 1, 1, 1, 1, 1,
0.5422018, 0.631678, 0.2628853, 1, 1, 1, 1, 1,
0.5430724, 0.02876093, 1.291445, 1, 1, 1, 1, 1,
0.5462258, -0.9218329, 3.201396, 1, 1, 1, 1, 1,
0.5474764, 0.6007903, 0.5498298, 1, 1, 1, 1, 1,
0.5517236, -0.4912744, 0.5697797, 1, 1, 1, 1, 1,
0.5532152, -0.7950245, 3.052389, 1, 1, 1, 1, 1,
0.5535047, -1.945758, 2.935706, 1, 1, 1, 1, 1,
0.5553294, 1.105662, 0.1745425, 0, 0, 1, 1, 1,
0.5563081, 0.3765672, 1.412398, 1, 0, 0, 1, 1,
0.5590178, -0.4638746, 0.9037724, 1, 0, 0, 1, 1,
0.5630488, 0.8185294, 0.8739134, 1, 0, 0, 1, 1,
0.5657475, -0.2830544, 2.827344, 1, 0, 0, 1, 1,
0.5714275, 0.6062509, 1.000225, 1, 0, 0, 1, 1,
0.5739266, -1.106907, 3.366484, 0, 0, 0, 1, 1,
0.5743273, 0.3244471, 2.260252, 0, 0, 0, 1, 1,
0.5802426, 0.1803646, 1.786087, 0, 0, 0, 1, 1,
0.5812224, -0.8387999, 1.268046, 0, 0, 0, 1, 1,
0.5894824, 0.02192246, 2.594894, 0, 0, 0, 1, 1,
0.5949951, 0.6913837, -0.366309, 0, 0, 0, 1, 1,
0.602595, 0.2185274, 1.875625, 0, 0, 0, 1, 1,
0.6065986, -0.9939354, 2.887089, 1, 1, 1, 1, 1,
0.6084847, 0.1876017, 2.942165, 1, 1, 1, 1, 1,
0.6101521, -0.1804358, 3.782241, 1, 1, 1, 1, 1,
0.615871, 0.9921456, 0.1341351, 1, 1, 1, 1, 1,
0.616394, 0.6100581, -0.8619744, 1, 1, 1, 1, 1,
0.6178655, 0.9845656, -0.6912009, 1, 1, 1, 1, 1,
0.6196226, -3.16677, 1.106097, 1, 1, 1, 1, 1,
0.622059, -1.116596, 1.555338, 1, 1, 1, 1, 1,
0.6234559, -1.660035, 2.380781, 1, 1, 1, 1, 1,
0.6283414, 1.699132, 2.0942, 1, 1, 1, 1, 1,
0.6295915, 1.293567, -0.669597, 1, 1, 1, 1, 1,
0.6342768, 0.3484038, 1.597489, 1, 1, 1, 1, 1,
0.6346306, -0.1196022, 0.7945723, 1, 1, 1, 1, 1,
0.6393102, -1.199968, 3.164925, 1, 1, 1, 1, 1,
0.640364, 0.1878564, 1.519785, 1, 1, 1, 1, 1,
0.6467113, 0.02759456, 1.99098, 0, 0, 1, 1, 1,
0.6477339, 0.97751, 0.9406514, 1, 0, 0, 1, 1,
0.6488229, 0.07440207, 1.291406, 1, 0, 0, 1, 1,
0.6496423, -0.6227118, 2.024719, 1, 0, 0, 1, 1,
0.6544178, -1.091305, 2.65238, 1, 0, 0, 1, 1,
0.6556026, -0.2473458, 1.65445, 1, 0, 0, 1, 1,
0.6580202, 0.05230372, 1.739435, 0, 0, 0, 1, 1,
0.6612325, 0.470549, 0.3674222, 0, 0, 0, 1, 1,
0.6635263, -1.817648, 2.392987, 0, 0, 0, 1, 1,
0.6762483, -0.03443098, 0.2625664, 0, 0, 0, 1, 1,
0.6769657, 2.069951, -0.2897823, 0, 0, 0, 1, 1,
0.6882935, 0.7932286, 0.266398, 0, 0, 0, 1, 1,
0.6947542, 0.9644578, 1.478988, 0, 0, 0, 1, 1,
0.6953303, -1.27539, 3.089711, 1, 1, 1, 1, 1,
0.6971359, 0.5235194, 0.8641157, 1, 1, 1, 1, 1,
0.6988385, 0.717034, -0.4053304, 1, 1, 1, 1, 1,
0.6992053, 0.5858514, 1.749815, 1, 1, 1, 1, 1,
0.7054603, -0.3508548, 1.822695, 1, 1, 1, 1, 1,
0.706971, 0.2072658, 2.870061, 1, 1, 1, 1, 1,
0.709171, 0.1807709, 3.741785, 1, 1, 1, 1, 1,
0.7147646, -0.3703569, 3.676987, 1, 1, 1, 1, 1,
0.7165474, -0.4022857, 3.039139, 1, 1, 1, 1, 1,
0.716947, -0.7141711, 1.231123, 1, 1, 1, 1, 1,
0.724063, -0.2365031, 3.748709, 1, 1, 1, 1, 1,
0.7241361, 1.719031, 0.08409663, 1, 1, 1, 1, 1,
0.7314256, -2.622978, 4.067887, 1, 1, 1, 1, 1,
0.7322738, 1.193472, 1.656826, 1, 1, 1, 1, 1,
0.7333949, -1.268089, 2.128949, 1, 1, 1, 1, 1,
0.7382544, 1.146618, 0.9328405, 0, 0, 1, 1, 1,
0.7410653, -1.164803, 1.541717, 1, 0, 0, 1, 1,
0.7414877, -0.9794103, 1.927589, 1, 0, 0, 1, 1,
0.7437422, 0.05568721, 2.285244, 1, 0, 0, 1, 1,
0.7455353, -1.28879, 1.907789, 1, 0, 0, 1, 1,
0.7476459, -1.960994, 3.103216, 1, 0, 0, 1, 1,
0.7492559, 0.866267, 2.537579, 0, 0, 0, 1, 1,
0.7501601, 0.1148471, 2.846636, 0, 0, 0, 1, 1,
0.7635113, 0.2279009, 1.15111, 0, 0, 0, 1, 1,
0.7672638, 1.937906, -0.139691, 0, 0, 0, 1, 1,
0.7733554, -0.5366368, 0.1910794, 0, 0, 0, 1, 1,
0.7765309, 0.9186038, 0.5321305, 0, 0, 0, 1, 1,
0.7799669, -1.438467, 2.698014, 0, 0, 0, 1, 1,
0.785512, -0.2715006, 2.559106, 1, 1, 1, 1, 1,
0.7855365, -0.1096577, 2.238848, 1, 1, 1, 1, 1,
0.785679, -1.240891, 2.21745, 1, 1, 1, 1, 1,
0.7906309, -1.709779, 3.131059, 1, 1, 1, 1, 1,
0.7953805, 0.1561923, 3.406193, 1, 1, 1, 1, 1,
0.7957182, 0.2743424, 1.879296, 1, 1, 1, 1, 1,
0.797362, 2.068675, 0.4180135, 1, 1, 1, 1, 1,
0.7975814, 1.404268, 0.0486288, 1, 1, 1, 1, 1,
0.7993261, 0.6894171, 0.976458, 1, 1, 1, 1, 1,
0.8015074, 0.8146254, 1.366628, 1, 1, 1, 1, 1,
0.8083302, 0.4312092, 0.8626371, 1, 1, 1, 1, 1,
0.8105395, 0.8522286, 0.4354542, 1, 1, 1, 1, 1,
0.8121064, 0.2936828, 2.236092, 1, 1, 1, 1, 1,
0.8178551, 1.390587, 0.1176879, 1, 1, 1, 1, 1,
0.8188637, -1.189507, 1.019846, 1, 1, 1, 1, 1,
0.8225853, -2.207231, 3.349297, 0, 0, 1, 1, 1,
0.8281967, -0.3380474, 0.5286274, 1, 0, 0, 1, 1,
0.8294991, -0.337703, 0.08167215, 1, 0, 0, 1, 1,
0.8305922, 1.012411, 0.1321617, 1, 0, 0, 1, 1,
0.8340121, 0.8811113, 1.072361, 1, 0, 0, 1, 1,
0.8447123, -0.1637358, 0.5496377, 1, 0, 0, 1, 1,
0.8507, 0.2460051, 2.353007, 0, 0, 0, 1, 1,
0.8581307, -0.9517007, 1.655225, 0, 0, 0, 1, 1,
0.8629661, -0.1771794, 1.845244, 0, 0, 0, 1, 1,
0.8652416, -1.068959, 1.996198, 0, 0, 0, 1, 1,
0.8687514, 1.040648, 1.41497, 0, 0, 0, 1, 1,
0.8706617, -1.124908, 2.046365, 0, 0, 0, 1, 1,
0.8730964, 1.340288, 0.932722, 0, 0, 0, 1, 1,
0.8749245, -0.2090717, 0.224236, 1, 1, 1, 1, 1,
0.8883471, 1.130346, -0.4329738, 1, 1, 1, 1, 1,
0.8918703, 0.129816, 1.204077, 1, 1, 1, 1, 1,
0.9013919, -0.8912745, -0.1339303, 1, 1, 1, 1, 1,
0.9055278, -0.6099269, 0.2323684, 1, 1, 1, 1, 1,
0.9098454, 2.201513, 0.5811037, 1, 1, 1, 1, 1,
0.9118155, 0.5728868, 1.648183, 1, 1, 1, 1, 1,
0.9183927, 0.4165116, 2.001212, 1, 1, 1, 1, 1,
0.9198976, -0.4162768, 1.271103, 1, 1, 1, 1, 1,
0.9202576, -0.0582854, 1.519342, 1, 1, 1, 1, 1,
0.9237548, -0.8777305, 3.01808, 1, 1, 1, 1, 1,
0.9258897, 1.024277, -0.1199516, 1, 1, 1, 1, 1,
0.9316036, -0.5283991, 2.475151, 1, 1, 1, 1, 1,
0.9318658, -1.268271, 1.897063, 1, 1, 1, 1, 1,
0.9343228, 0.5633846, 0.1958671, 1, 1, 1, 1, 1,
0.9357643, -0.05418615, 2.014522, 0, 0, 1, 1, 1,
0.9415426, -1.719768, 1.434395, 1, 0, 0, 1, 1,
0.948954, -0.442517, 1.182728, 1, 0, 0, 1, 1,
0.9496623, -0.4815415, 1.135156, 1, 0, 0, 1, 1,
0.9523276, -1.187368, 2.059671, 1, 0, 0, 1, 1,
0.9572804, 0.4612539, -0.7826529, 1, 0, 0, 1, 1,
0.9585113, -0.233882, 1.661749, 0, 0, 0, 1, 1,
0.9695695, -0.1569235, 0.6418059, 0, 0, 0, 1, 1,
0.9746322, 0.4826141, 2.254221, 0, 0, 0, 1, 1,
0.9788002, 0.2007561, 1.006012, 0, 0, 0, 1, 1,
0.9802508, -0.004260192, 2.485655, 0, 0, 0, 1, 1,
0.9811378, 0.9881285, 1.12155, 0, 0, 0, 1, 1,
1.00081, -0.2601859, 2.511815, 0, 0, 0, 1, 1,
1.004119, 0.05641004, 1.024876, 1, 1, 1, 1, 1,
1.004547, 0.7598431, 1.021894, 1, 1, 1, 1, 1,
1.012537, -0.7136297, 2.014132, 1, 1, 1, 1, 1,
1.01285, 0.1939549, 1.095858, 1, 1, 1, 1, 1,
1.016055, 1.129626, 1.62781, 1, 1, 1, 1, 1,
1.021688, 2.447461, 1.917344, 1, 1, 1, 1, 1,
1.021781, 0.591857, 1.042901, 1, 1, 1, 1, 1,
1.023076, -1.275664, 1.825521, 1, 1, 1, 1, 1,
1.024678, -0.1290282, 2.205123, 1, 1, 1, 1, 1,
1.029421, 0.3069052, 2.412097, 1, 1, 1, 1, 1,
1.031084, 0.8911397, 1.676843, 1, 1, 1, 1, 1,
1.033428, 1.013089, 2.729229, 1, 1, 1, 1, 1,
1.033851, -0.2628674, 3.548452, 1, 1, 1, 1, 1,
1.046779, 0.3823774, -0.232561, 1, 1, 1, 1, 1,
1.053228, 1.003563, 0.9815117, 1, 1, 1, 1, 1,
1.057627, -0.2862787, 0.2299441, 0, 0, 1, 1, 1,
1.071814, 0.07055865, 1.191968, 1, 0, 0, 1, 1,
1.07202, -0.222551, 1.496544, 1, 0, 0, 1, 1,
1.074215, -0.6344676, 3.37818, 1, 0, 0, 1, 1,
1.08511, 0.07693633, 0.6143928, 1, 0, 0, 1, 1,
1.086203, 0.4119974, 2.085206, 1, 0, 0, 1, 1,
1.095055, 0.1062036, 2.206732, 0, 0, 0, 1, 1,
1.100331, 0.3023097, 3.014131, 0, 0, 0, 1, 1,
1.10556, -0.1949358, 0.8489774, 0, 0, 0, 1, 1,
1.107844, 0.4226198, 2.092407, 0, 0, 0, 1, 1,
1.121049, -0.4695278, 1.792461, 0, 0, 0, 1, 1,
1.124791, -0.3248121, 3.658237, 0, 0, 0, 1, 1,
1.125529, 2.59632, -0.7003042, 0, 0, 0, 1, 1,
1.126116, -0.4764138, 2.474467, 1, 1, 1, 1, 1,
1.129196, -0.3625051, 0.9595668, 1, 1, 1, 1, 1,
1.131134, 1.931772, -0.5668606, 1, 1, 1, 1, 1,
1.13222, -0.8961967, 0.2063079, 1, 1, 1, 1, 1,
1.134055, 0.6833894, 1.849993, 1, 1, 1, 1, 1,
1.140167, 1.452207, 1.79897, 1, 1, 1, 1, 1,
1.142149, 0.1582107, 1.405465, 1, 1, 1, 1, 1,
1.145042, -1.03524, 1.868868, 1, 1, 1, 1, 1,
1.152991, 0.3578027, 0.3665899, 1, 1, 1, 1, 1,
1.154435, 0.6383311, 0.3875302, 1, 1, 1, 1, 1,
1.157594, 0.3651177, 0.02490156, 1, 1, 1, 1, 1,
1.158351, -0.3875122, 2.245604, 1, 1, 1, 1, 1,
1.159034, -1.534921, 2.9164, 1, 1, 1, 1, 1,
1.159347, -1.761321, 2.3879, 1, 1, 1, 1, 1,
1.159439, -1.587536, 3.429025, 1, 1, 1, 1, 1,
1.175671, 0.5580258, 1.237489, 0, 0, 1, 1, 1,
1.176057, 0.1010353, 3.155591, 1, 0, 0, 1, 1,
1.176303, 0.5953919, 2.301655, 1, 0, 0, 1, 1,
1.176679, 1.348979, 1.011592, 1, 0, 0, 1, 1,
1.178108, 0.7343343, 1.296991, 1, 0, 0, 1, 1,
1.178432, 0.01343842, 3.433036, 1, 0, 0, 1, 1,
1.179134, 1.086268, 0.751566, 0, 0, 0, 1, 1,
1.180581, 0.2150316, 2.043005, 0, 0, 0, 1, 1,
1.184018, 2.216199, 0.4149203, 0, 0, 0, 1, 1,
1.184061, -1.106248, 0.389022, 0, 0, 0, 1, 1,
1.186062, 0.5197526, 2.00385, 0, 0, 0, 1, 1,
1.193197, 1.209416, 3.31674, 0, 0, 0, 1, 1,
1.19376, 0.08995163, 2.48345, 0, 0, 0, 1, 1,
1.194231, 1.623026, 0.4312205, 1, 1, 1, 1, 1,
1.194384, 0.8347126, -0.9807745, 1, 1, 1, 1, 1,
1.199987, -0.4140026, -0.03238804, 1, 1, 1, 1, 1,
1.212721, -0.06860328, 2.203238, 1, 1, 1, 1, 1,
1.21552, 0.08107927, 2.070439, 1, 1, 1, 1, 1,
1.216278, 0.8140327, 0.8983546, 1, 1, 1, 1, 1,
1.2165, 0.2821283, 0.9187025, 1, 1, 1, 1, 1,
1.2192, -0.4263247, 2.127361, 1, 1, 1, 1, 1,
1.259911, -0.9344786, 1.894517, 1, 1, 1, 1, 1,
1.260461, 0.1413746, 3.037107, 1, 1, 1, 1, 1,
1.268635, 1.035332, 0.7339272, 1, 1, 1, 1, 1,
1.270381, -0.09844281, 1.822451, 1, 1, 1, 1, 1,
1.276051, 0.1010448, 1.922321, 1, 1, 1, 1, 1,
1.278472, 1.56886, 2.869385, 1, 1, 1, 1, 1,
1.289448, 0.09462006, 1.777874, 1, 1, 1, 1, 1,
1.290683, -0.5551495, 2.375768, 0, 0, 1, 1, 1,
1.293812, -1.757382, 0.7616824, 1, 0, 0, 1, 1,
1.297197, 0.1119532, 2.703725, 1, 0, 0, 1, 1,
1.297495, 1.5025, 3.305385, 1, 0, 0, 1, 1,
1.298571, 0.5370339, 0.5029227, 1, 0, 0, 1, 1,
1.310268, 0.7664452, 1.991343, 1, 0, 0, 1, 1,
1.310467, 0.8294149, 0.6310623, 0, 0, 0, 1, 1,
1.315202, 2.078477, -1.817252, 0, 0, 0, 1, 1,
1.317345, -0.712199, 3.584575, 0, 0, 0, 1, 1,
1.319244, 0.9043511, -0.366785, 0, 0, 0, 1, 1,
1.329545, -0.514793, 0.3177434, 0, 0, 0, 1, 1,
1.337435, -0.2185982, 3.210975, 0, 0, 0, 1, 1,
1.342199, -1.228883, 0.2594323, 0, 0, 0, 1, 1,
1.346735, -1.707166, 1.152135, 1, 1, 1, 1, 1,
1.356369, 1.955497, 0.1089583, 1, 1, 1, 1, 1,
1.357054, 0.3310527, 1.484238, 1, 1, 1, 1, 1,
1.357698, -0.7063628, 3.129946, 1, 1, 1, 1, 1,
1.362663, 0.3079113, 2.300701, 1, 1, 1, 1, 1,
1.365022, -0.8380356, 2.314283, 1, 1, 1, 1, 1,
1.365441, 0.3502876, 1.517622, 1, 1, 1, 1, 1,
1.369205, -0.5685436, 2.190485, 1, 1, 1, 1, 1,
1.394234, 1.182378, 0.9747636, 1, 1, 1, 1, 1,
1.415179, 0.852283, -0.3800384, 1, 1, 1, 1, 1,
1.417282, 0.01454059, 0.2037786, 1, 1, 1, 1, 1,
1.421613, 2.055466, -0.1125522, 1, 1, 1, 1, 1,
1.423639, -1.165928, 0.3095454, 1, 1, 1, 1, 1,
1.431244, 0.1333396, 3.580432, 1, 1, 1, 1, 1,
1.431605, 0.9243226, 2.920567, 1, 1, 1, 1, 1,
1.432448, 0.9534404, 0.3824059, 0, 0, 1, 1, 1,
1.434927, -0.2468272, 1.06843, 1, 0, 0, 1, 1,
1.437959, -0.1866487, 1.903011, 1, 0, 0, 1, 1,
1.445765, -1.962082, 2.390662, 1, 0, 0, 1, 1,
1.452781, -1.317134, 1.779193, 1, 0, 0, 1, 1,
1.455809, 0.08124609, 0.000189698, 1, 0, 0, 1, 1,
1.461708, -0.7016597, 2.086323, 0, 0, 0, 1, 1,
1.463409, 1.526804, 1.734968, 0, 0, 0, 1, 1,
1.467951, -0.5297972, 0.9097839, 0, 0, 0, 1, 1,
1.477584, -0.3000389, 2.091189, 0, 0, 0, 1, 1,
1.49157, -0.2038361, 1.628028, 0, 0, 0, 1, 1,
1.494892, 0.6680009, 0.6433517, 0, 0, 0, 1, 1,
1.504889, -1.50885, 2.226104, 0, 0, 0, 1, 1,
1.5093, 0.7664284, -0.6664497, 1, 1, 1, 1, 1,
1.52479, -1.489357, 3.039412, 1, 1, 1, 1, 1,
1.544288, -0.1731772, 0.6179661, 1, 1, 1, 1, 1,
1.557477, 1.477551, 1.901172, 1, 1, 1, 1, 1,
1.577962, -1.873146, 4.034251, 1, 1, 1, 1, 1,
1.578077, 0.5259574, 0.9822981, 1, 1, 1, 1, 1,
1.581692, 1.319547, 2.172776, 1, 1, 1, 1, 1,
1.582282, -1.112676, 2.34735, 1, 1, 1, 1, 1,
1.594036, 0.4752249, 2.475616, 1, 1, 1, 1, 1,
1.599128, -0.6144847, 2.278409, 1, 1, 1, 1, 1,
1.603306, 1.309252, -0.5517947, 1, 1, 1, 1, 1,
1.620662, -0.7951902, 1.689072, 1, 1, 1, 1, 1,
1.632063, -0.03277226, 0.5436704, 1, 1, 1, 1, 1,
1.657537, -0.665599, 1.483117, 1, 1, 1, 1, 1,
1.661681, -0.000356075, 1.756785, 1, 1, 1, 1, 1,
1.69792, -1.164246, 1.384742, 0, 0, 1, 1, 1,
1.703971, -0.1222799, 2.217029, 1, 0, 0, 1, 1,
1.71409, -0.146378, 0.6875346, 1, 0, 0, 1, 1,
1.721718, 0.454543, 1.661158, 1, 0, 0, 1, 1,
1.737459, -0.3283479, 1.794482, 1, 0, 0, 1, 1,
1.742849, -1.112261, 2.576816, 1, 0, 0, 1, 1,
1.74501, -0.06865688, 2.795683, 0, 0, 0, 1, 1,
1.766304, -0.7338138, 2.519577, 0, 0, 0, 1, 1,
1.767666, 1.007697, 0.4363924, 0, 0, 0, 1, 1,
1.778181, -1.113274, 2.656898, 0, 0, 0, 1, 1,
1.807527, -0.6648386, 2.033571, 0, 0, 0, 1, 1,
1.813861, -1.291384, 2.777558, 0, 0, 0, 1, 1,
1.834333, 0.3160653, 0.7502444, 0, 0, 0, 1, 1,
1.847188, 1.359946, 1.020262, 1, 1, 1, 1, 1,
1.877527, -0.483759, 0.4616414, 1, 1, 1, 1, 1,
1.884806, 0.05939538, 1.345365, 1, 1, 1, 1, 1,
1.887257, -1.082872, 2.224986, 1, 1, 1, 1, 1,
1.889442, 1.418031, 0.9489806, 1, 1, 1, 1, 1,
1.892451, -2.155558, 2.148723, 1, 1, 1, 1, 1,
1.932262, 0.794985, 1.576699, 1, 1, 1, 1, 1,
1.93613, -0.8077159, 1.638972, 1, 1, 1, 1, 1,
1.949278, 0.7495883, -0.08682947, 1, 1, 1, 1, 1,
1.964644, -0.324701, -0.2193556, 1, 1, 1, 1, 1,
1.999107, -0.5592284, 3.692084, 1, 1, 1, 1, 1,
2.00568, -0.2199502, 1.118233, 1, 1, 1, 1, 1,
2.006097, -0.310459, 1.016792, 1, 1, 1, 1, 1,
2.05412, 0.2637274, 0.937443, 1, 1, 1, 1, 1,
2.057159, 0.2693224, 1.429379, 1, 1, 1, 1, 1,
2.064489, 0.4015937, 0.7393236, 0, 0, 1, 1, 1,
2.114743, -0.3802939, 2.709784, 1, 0, 0, 1, 1,
2.234609, -2.594052, 2.581474, 1, 0, 0, 1, 1,
2.247307, -1.337487, 2.664612, 1, 0, 0, 1, 1,
2.307997, -0.9859583, 2.801091, 1, 0, 0, 1, 1,
2.344686, -0.433242, 0.2189212, 1, 0, 0, 1, 1,
2.359183, -0.06402005, 0.7023412, 0, 0, 0, 1, 1,
2.362348, 1.118988, 3.529992, 0, 0, 0, 1, 1,
2.368882, 1.409327, 1.191394, 0, 0, 0, 1, 1,
2.416119, 0.1494015, 2.434017, 0, 0, 0, 1, 1,
2.417115, 0.5858662, 1.479412, 0, 0, 0, 1, 1,
2.478899, 0.6724384, 1.140241, 0, 0, 0, 1, 1,
2.548676, -0.5529454, 1.690331, 0, 0, 0, 1, 1,
2.611572, -0.498826, 3.294622, 1, 1, 1, 1, 1,
2.879338, -0.9918976, 1.625861, 1, 1, 1, 1, 1,
2.901019, 1.175556, 0.7748615, 1, 1, 1, 1, 1,
3.079208, -0.5391422, 3.295898, 1, 1, 1, 1, 1,
3.148152, 0.059539, 0.9583426, 1, 1, 1, 1, 1,
3.214871, -0.4076742, 1.214216, 1, 1, 1, 1, 1,
3.27063, 0.405965, 1.515458, 1, 1, 1, 1, 1
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
var radius = 9.863649;
var distance = 34.64565;
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
mvMatrix.translate( -0.1211889, -0.2627759, 0.2750211 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.64565);
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
