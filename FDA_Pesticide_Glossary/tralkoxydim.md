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
-3.154969, 0.9705493, -0.5872175, 1, 0, 0, 1,
-2.910389, 0.9589594, -0.7857721, 1, 0.007843138, 0, 1,
-2.608673, -0.8361583, -2.369263, 1, 0.01176471, 0, 1,
-2.563493, 2.713612, -1.366128, 1, 0.01960784, 0, 1,
-2.483739, -0.110802, -0.2748863, 1, 0.02352941, 0, 1,
-2.299459, 0.8106392, -0.8079559, 1, 0.03137255, 0, 1,
-2.295437, -0.8308948, -0.1107571, 1, 0.03529412, 0, 1,
-2.251406, 0.3766896, -2.300222, 1, 0.04313726, 0, 1,
-2.229535, -2.319694, -1.16674, 1, 0.04705882, 0, 1,
-2.200633, -1.930505, -3.544158, 1, 0.05490196, 0, 1,
-2.199093, 1.762542, -0.2809344, 1, 0.05882353, 0, 1,
-2.196323, 1.18047, -1.531493, 1, 0.06666667, 0, 1,
-2.180696, -0.5029493, -1.761223, 1, 0.07058824, 0, 1,
-2.153103, -0.1327252, -1.213993, 1, 0.07843138, 0, 1,
-2.107531, -0.331871, -2.419413, 1, 0.08235294, 0, 1,
-2.098237, 1.186416, -1.318401, 1, 0.09019608, 0, 1,
-2.094925, -0.04885606, -2.176471, 1, 0.09411765, 0, 1,
-2.070439, -0.2158403, -2.826351, 1, 0.1019608, 0, 1,
-2.051777, 1.304593, -0.2819209, 1, 0.1098039, 0, 1,
-2.035733, -0.723426, -1.663541, 1, 0.1137255, 0, 1,
-1.988055, 0.4387579, -2.736636, 1, 0.1215686, 0, 1,
-1.970854, 0.9770483, -2.860746, 1, 0.1254902, 0, 1,
-1.951597, -0.7079254, -2.334899, 1, 0.1333333, 0, 1,
-1.940527, -0.3266035, -2.329427, 1, 0.1372549, 0, 1,
-1.858374, 0.4746756, -2.047425, 1, 0.145098, 0, 1,
-1.84779, 0.5429479, -3.562104, 1, 0.1490196, 0, 1,
-1.834803, 0.7963574, -2.364601, 1, 0.1568628, 0, 1,
-1.800882, -0.2491835, -0.9939291, 1, 0.1607843, 0, 1,
-1.799058, -0.6636132, -3.519114, 1, 0.1686275, 0, 1,
-1.797955, -0.5155469, -3.433075, 1, 0.172549, 0, 1,
-1.795221, -1.068414, -2.613381, 1, 0.1803922, 0, 1,
-1.792509, 0.1912357, -0.6255918, 1, 0.1843137, 0, 1,
-1.775869, 1.577536, -1.268394, 1, 0.1921569, 0, 1,
-1.775101, -0.9394007, -4.017715, 1, 0.1960784, 0, 1,
-1.770508, -0.519129, -3.157605, 1, 0.2039216, 0, 1,
-1.769467, -0.1326401, -0.3228303, 1, 0.2117647, 0, 1,
-1.74742, -0.7607074, -1.790559, 1, 0.2156863, 0, 1,
-1.72907, 0.3629366, -1.333178, 1, 0.2235294, 0, 1,
-1.722527, -0.2389792, -2.346947, 1, 0.227451, 0, 1,
-1.716726, 0.8938386, -2.879048, 1, 0.2352941, 0, 1,
-1.714643, -1.676025, -2.134039, 1, 0.2392157, 0, 1,
-1.683892, -2.608096, -2.163764, 1, 0.2470588, 0, 1,
-1.672645, -0.3329815, -1.94533, 1, 0.2509804, 0, 1,
-1.66792, -0.6248246, -1.353922, 1, 0.2588235, 0, 1,
-1.652063, -0.3251902, -1.357832, 1, 0.2627451, 0, 1,
-1.648376, -0.07046541, -1.493298, 1, 0.2705882, 0, 1,
-1.640272, 0.7369503, -1.700675, 1, 0.2745098, 0, 1,
-1.608383, -0.4524033, -1.459732, 1, 0.282353, 0, 1,
-1.605518, 0.393527, -0.6273113, 1, 0.2862745, 0, 1,
-1.597996, -1.425877, -1.317578, 1, 0.2941177, 0, 1,
-1.596957, 1.30462, -2.522625, 1, 0.3019608, 0, 1,
-1.581812, -1.642089, -2.554399, 1, 0.3058824, 0, 1,
-1.57952, -0.6041102, -3.413411, 1, 0.3137255, 0, 1,
-1.574571, -0.03835059, -3.673449, 1, 0.3176471, 0, 1,
-1.564585, 0.6386703, -0.9090408, 1, 0.3254902, 0, 1,
-1.562028, 1.187919, 0.7878931, 1, 0.3294118, 0, 1,
-1.56186, -0.4633682, -1.4294, 1, 0.3372549, 0, 1,
-1.560225, -1.296836, -2.140205, 1, 0.3411765, 0, 1,
-1.531757, -0.8560592, -1.056465, 1, 0.3490196, 0, 1,
-1.531432, -0.7587714, -1.962779, 1, 0.3529412, 0, 1,
-1.510078, 0.401691, -2.234364, 1, 0.3607843, 0, 1,
-1.507778, -0.2214403, -0.8219336, 1, 0.3647059, 0, 1,
-1.498649, -0.6396221, -3.305079, 1, 0.372549, 0, 1,
-1.488319, -1.070782, -3.065065, 1, 0.3764706, 0, 1,
-1.465706, -0.8408812, -1.580312, 1, 0.3843137, 0, 1,
-1.464471, -0.8588017, -1.447934, 1, 0.3882353, 0, 1,
-1.46295, -0.4033961, -3.046464, 1, 0.3960784, 0, 1,
-1.462908, 0.1618805, -1.928278, 1, 0.4039216, 0, 1,
-1.45833, -0.2226706, -1.360159, 1, 0.4078431, 0, 1,
-1.454327, 0.9204981, -1.730248, 1, 0.4156863, 0, 1,
-1.447759, 0.01848427, -0.946762, 1, 0.4196078, 0, 1,
-1.447139, -0.9099903, -2.582312, 1, 0.427451, 0, 1,
-1.433646, 1.470264, -1.597436, 1, 0.4313726, 0, 1,
-1.416783, 0.4087352, 0.2254763, 1, 0.4392157, 0, 1,
-1.415085, 0.4370995, -1.571014, 1, 0.4431373, 0, 1,
-1.408229, -0.4185136, -1.772438, 1, 0.4509804, 0, 1,
-1.407311, -1.210478, -2.488372, 1, 0.454902, 0, 1,
-1.401615, 0.7637124, -2.385163, 1, 0.4627451, 0, 1,
-1.400776, 1.213672, -1.475576, 1, 0.4666667, 0, 1,
-1.400123, -0.2996789, -2.012595, 1, 0.4745098, 0, 1,
-1.398944, 0.9230363, -1.601861, 1, 0.4784314, 0, 1,
-1.397802, -1.607231, -1.679868, 1, 0.4862745, 0, 1,
-1.397173, -0.5339188, -2.789968, 1, 0.4901961, 0, 1,
-1.39369, 0.4839681, -2.375689, 1, 0.4980392, 0, 1,
-1.392111, 0.2170426, -2.218757, 1, 0.5058824, 0, 1,
-1.389657, -0.7891599, -1.342144, 1, 0.509804, 0, 1,
-1.377794, -0.6301237, -2.418286, 1, 0.5176471, 0, 1,
-1.375456, -0.1884613, -2.490995, 1, 0.5215687, 0, 1,
-1.374998, 0.9408339, -1.083369, 1, 0.5294118, 0, 1,
-1.372899, 0.5304407, -2.305622, 1, 0.5333334, 0, 1,
-1.368944, -0.7817134, -1.73221, 1, 0.5411765, 0, 1,
-1.362473, 0.2566306, -2.270661, 1, 0.5450981, 0, 1,
-1.357078, -0.2988724, -0.7710113, 1, 0.5529412, 0, 1,
-1.348433, -0.4015853, -2.306641, 1, 0.5568628, 0, 1,
-1.345699, 0.959639, -1.966133, 1, 0.5647059, 0, 1,
-1.343208, -1.767865, -2.754251, 1, 0.5686275, 0, 1,
-1.321069, -0.7825218, -1.9668, 1, 0.5764706, 0, 1,
-1.320231, 0.7042828, 0.2362432, 1, 0.5803922, 0, 1,
-1.310927, 1.300959, -2.271355, 1, 0.5882353, 0, 1,
-1.302281, 1.583117, -0.3758996, 1, 0.5921569, 0, 1,
-1.300095, 0.335914, -0.8548557, 1, 0.6, 0, 1,
-1.282155, -0.438862, -2.156818, 1, 0.6078432, 0, 1,
-1.271178, -0.3042459, -1.175596, 1, 0.6117647, 0, 1,
-1.269984, -0.6760575, -1.782577, 1, 0.6196079, 0, 1,
-1.269906, -0.2428588, -2.758162, 1, 0.6235294, 0, 1,
-1.267109, 0.792909, -1.151538, 1, 0.6313726, 0, 1,
-1.264417, -0.4807732, -1.461684, 1, 0.6352941, 0, 1,
-1.263081, -0.08485556, -0.07403363, 1, 0.6431373, 0, 1,
-1.254614, 0.7114073, -2.108115, 1, 0.6470588, 0, 1,
-1.251998, 0.04944476, -0.005284588, 1, 0.654902, 0, 1,
-1.239316, 0.1114417, -1.455239, 1, 0.6588235, 0, 1,
-1.236727, 1.062639, -1.363381, 1, 0.6666667, 0, 1,
-1.229011, -0.2776898, -1.363803, 1, 0.6705883, 0, 1,
-1.225603, 0.5152994, -3.786915, 1, 0.6784314, 0, 1,
-1.225467, 0.2317296, -1.067509, 1, 0.682353, 0, 1,
-1.220437, -0.288695, -0.5513674, 1, 0.6901961, 0, 1,
-1.217599, 1.176554, -0.199815, 1, 0.6941177, 0, 1,
-1.217499, -0.3983642, -2.355989, 1, 0.7019608, 0, 1,
-1.21551, -1.335322, -1.754099, 1, 0.7098039, 0, 1,
-1.212288, 1.638196, 1.289759, 1, 0.7137255, 0, 1,
-1.186669, -0.6730649, -3.078771, 1, 0.7215686, 0, 1,
-1.185804, 0.2229524, -0.7653651, 1, 0.7254902, 0, 1,
-1.176217, 1.180702, 0.09287908, 1, 0.7333333, 0, 1,
-1.175723, 0.2732434, -2.388908, 1, 0.7372549, 0, 1,
-1.168864, 2.331225, -0.3339911, 1, 0.7450981, 0, 1,
-1.16773, 1.122959, -0.307245, 1, 0.7490196, 0, 1,
-1.152541, -1.879985, -4.027907, 1, 0.7568628, 0, 1,
-1.151789, 1.137587, -0.2548243, 1, 0.7607843, 0, 1,
-1.151098, -0.3031037, -2.579921, 1, 0.7686275, 0, 1,
-1.150105, 0.1759284, -1.446133, 1, 0.772549, 0, 1,
-1.141681, 0.6674575, -1.785065, 1, 0.7803922, 0, 1,
-1.138859, 0.4065012, -1.261697, 1, 0.7843137, 0, 1,
-1.137163, -0.769411, 0.2915887, 1, 0.7921569, 0, 1,
-1.132997, 0.1653215, -1.647951, 1, 0.7960784, 0, 1,
-1.127305, 0.8264573, -1.207027, 1, 0.8039216, 0, 1,
-1.122374, -1.224397, -1.794675, 1, 0.8117647, 0, 1,
-1.114007, 0.4924424, -1.203331, 1, 0.8156863, 0, 1,
-1.111537, -0.6405726, -0.2075131, 1, 0.8235294, 0, 1,
-1.111155, -1.653466, -3.83907, 1, 0.827451, 0, 1,
-1.107903, -0.4655707, -0.3662221, 1, 0.8352941, 0, 1,
-1.10744, 1.409763, 1.071809, 1, 0.8392157, 0, 1,
-1.106159, -0.4481654, -1.751862, 1, 0.8470588, 0, 1,
-1.101512, -0.7620425, -2.238482, 1, 0.8509804, 0, 1,
-1.099792, 0.1047903, -0.8887956, 1, 0.8588235, 0, 1,
-1.089195, -2.296187, -1.358033, 1, 0.8627451, 0, 1,
-1.087551, 0.1935218, -1.087675, 1, 0.8705882, 0, 1,
-1.084753, -0.801732, -0.4487436, 1, 0.8745098, 0, 1,
-1.081298, -0.454331, -1.875395, 1, 0.8823529, 0, 1,
-1.07414, -0.5142823, -1.560485, 1, 0.8862745, 0, 1,
-1.072326, -0.3925705, -2.003335, 1, 0.8941177, 0, 1,
-1.071585, 0.1925132, -0.1768894, 1, 0.8980392, 0, 1,
-1.067864, -1.040197, -3.9207, 1, 0.9058824, 0, 1,
-1.063977, -2.039875, -4.02797, 1, 0.9137255, 0, 1,
-1.05692, -0.0727252, -2.129877, 1, 0.9176471, 0, 1,
-1.048903, -0.5545782, -2.856591, 1, 0.9254902, 0, 1,
-1.048735, -0.6257411, -2.499445, 1, 0.9294118, 0, 1,
-1.04681, 0.7802476, -0.4510848, 1, 0.9372549, 0, 1,
-1.045685, 0.7695337, -1.324895, 1, 0.9411765, 0, 1,
-1.043092, -0.4178616, -3.01018, 1, 0.9490196, 0, 1,
-1.042406, -0.1314029, -1.71294, 1, 0.9529412, 0, 1,
-1.039211, -0.2496055, -2.269977, 1, 0.9607843, 0, 1,
-1.035678, 0.2700053, -1.360615, 1, 0.9647059, 0, 1,
-1.0326, -1.047407, -3.275261, 1, 0.972549, 0, 1,
-1.029246, 1.98436, -2.354599, 1, 0.9764706, 0, 1,
-1.022952, -0.5888923, -2.375748, 1, 0.9843137, 0, 1,
-1.022539, -0.7707098, -2.815616, 1, 0.9882353, 0, 1,
-1.020621, 1.106961, -1.79577, 1, 0.9960784, 0, 1,
-1.016694, 1.166833, -0.7003305, 0.9960784, 1, 0, 1,
-1.016122, 0.1948185, -1.280096, 0.9921569, 1, 0, 1,
-1.008832, 0.2074342, -0.7407483, 0.9843137, 1, 0, 1,
-1.006328, 0.9538975, -2.062951, 0.9803922, 1, 0, 1,
-1.003555, 0.9224188, -1.599288, 0.972549, 1, 0, 1,
-1.002452, -0.3180306, -2.528782, 0.9686275, 1, 0, 1,
-0.9989915, 0.8394009, -0.01186877, 0.9607843, 1, 0, 1,
-0.993444, -1.259386, -4.381223, 0.9568627, 1, 0, 1,
-0.9920295, -0.5219956, -1.922787, 0.9490196, 1, 0, 1,
-0.9709986, 1.15384, 0.1199029, 0.945098, 1, 0, 1,
-0.9642953, -1.538633, -2.365634, 0.9372549, 1, 0, 1,
-0.961639, 1.145083, -1.114827, 0.9333333, 1, 0, 1,
-0.9583219, 0.5744961, 0.4963321, 0.9254902, 1, 0, 1,
-0.9570603, 1.196713, 0.1778383, 0.9215686, 1, 0, 1,
-0.9554898, 1.379303, 1.587532, 0.9137255, 1, 0, 1,
-0.9541311, 1.031304, 0.8006918, 0.9098039, 1, 0, 1,
-0.9508992, -1.096163, -2.875134, 0.9019608, 1, 0, 1,
-0.9400331, -2.04744, -4.613552, 0.8941177, 1, 0, 1,
-0.9246235, -0.4467641, -2.198818, 0.8901961, 1, 0, 1,
-0.9244406, -2.642608, -2.127468, 0.8823529, 1, 0, 1,
-0.9229357, -0.2338896, -2.155644, 0.8784314, 1, 0, 1,
-0.921124, 0.7551293, -1.103056, 0.8705882, 1, 0, 1,
-0.9167128, -0.2833972, -2.178731, 0.8666667, 1, 0, 1,
-0.9165567, 0.9709735, -0.5801746, 0.8588235, 1, 0, 1,
-0.9146485, -0.3431594, -3.855824, 0.854902, 1, 0, 1,
-0.9092396, 0.8775201, -0.4925955, 0.8470588, 1, 0, 1,
-0.9085969, -0.9236024, -3.244583, 0.8431373, 1, 0, 1,
-0.9070681, -1.617936, -1.974106, 0.8352941, 1, 0, 1,
-0.9055056, 0.9256643, -1.781933, 0.8313726, 1, 0, 1,
-0.8957895, 0.7997414, -0.7622684, 0.8235294, 1, 0, 1,
-0.8942726, -0.03099296, -1.819535, 0.8196079, 1, 0, 1,
-0.8906136, -0.4061648, -1.040711, 0.8117647, 1, 0, 1,
-0.8895092, -0.2650374, -1.631085, 0.8078431, 1, 0, 1,
-0.8849069, -0.2182403, -1.94039, 0.8, 1, 0, 1,
-0.8832634, 0.4396575, -0.4859109, 0.7921569, 1, 0, 1,
-0.8797042, -0.1994425, -1.709781, 0.7882353, 1, 0, 1,
-0.8752754, 0.6552736, -0.8794608, 0.7803922, 1, 0, 1,
-0.8711792, -1.222548, -3.042444, 0.7764706, 1, 0, 1,
-0.8648934, -2.27533, -2.701954, 0.7686275, 1, 0, 1,
-0.8523594, 0.1210101, -1.074565, 0.7647059, 1, 0, 1,
-0.8324924, 0.07980245, -1.429597, 0.7568628, 1, 0, 1,
-0.8274405, -0.2938255, 0.8280488, 0.7529412, 1, 0, 1,
-0.824264, -0.3128905, -2.494163, 0.7450981, 1, 0, 1,
-0.8181997, 0.7213017, -2.520446, 0.7411765, 1, 0, 1,
-0.8125383, 0.7027882, -1.4248, 0.7333333, 1, 0, 1,
-0.8113523, -0.2821577, -1.198804, 0.7294118, 1, 0, 1,
-0.8099468, -1.979003, -3.887836, 0.7215686, 1, 0, 1,
-0.7987854, -0.9171004, -4.662585, 0.7176471, 1, 0, 1,
-0.7967802, 1.719169, -0.6480706, 0.7098039, 1, 0, 1,
-0.7951574, 0.5579624, -1.361012, 0.7058824, 1, 0, 1,
-0.792249, 1.227233, 0.9852934, 0.6980392, 1, 0, 1,
-0.7746758, 0.306869, -1.831978, 0.6901961, 1, 0, 1,
-0.771322, 0.2977411, -0.9505219, 0.6862745, 1, 0, 1,
-0.7657828, 0.3963179, -0.7545004, 0.6784314, 1, 0, 1,
-0.765235, -0.5381767, -2.098453, 0.6745098, 1, 0, 1,
-0.7589085, 0.1602725, -2.594145, 0.6666667, 1, 0, 1,
-0.7563442, 2.492193, 0.2582988, 0.6627451, 1, 0, 1,
-0.7475224, 2.775767, 0.1993819, 0.654902, 1, 0, 1,
-0.7459627, 0.6170896, -2.863279, 0.6509804, 1, 0, 1,
-0.7447345, 1.292158, -0.3517954, 0.6431373, 1, 0, 1,
-0.7435867, -0.327936, -2.058364, 0.6392157, 1, 0, 1,
-0.7424707, -0.4956524, -2.607626, 0.6313726, 1, 0, 1,
-0.7396182, 0.06742622, 0.1656001, 0.627451, 1, 0, 1,
-0.7369284, 0.4413646, -1.280114, 0.6196079, 1, 0, 1,
-0.7363275, -1.040543, -2.955199, 0.6156863, 1, 0, 1,
-0.7298985, 2.484211, -0.9631377, 0.6078432, 1, 0, 1,
-0.7284927, 1.02675, 0.6286838, 0.6039216, 1, 0, 1,
-0.7276606, 0.5854244, -1.925818, 0.5960785, 1, 0, 1,
-0.7223688, -0.2856592, -2.870125, 0.5882353, 1, 0, 1,
-0.7077968, 1.376917, 0.1141422, 0.5843138, 1, 0, 1,
-0.7066481, 0.623826, -0.2342224, 0.5764706, 1, 0, 1,
-0.702274, 1.235972, -0.6586676, 0.572549, 1, 0, 1,
-0.6969408, -1.88581, -4.26372, 0.5647059, 1, 0, 1,
-0.696201, 0.812253, -0.3883499, 0.5607843, 1, 0, 1,
-0.6960487, 1.373029, -0.8553285, 0.5529412, 1, 0, 1,
-0.6927691, 0.890202, -1.056062, 0.5490196, 1, 0, 1,
-0.6837522, 0.2466749, -0.7471428, 0.5411765, 1, 0, 1,
-0.6790817, -1.012979, -1.956064, 0.5372549, 1, 0, 1,
-0.668424, 0.6442482, -1.942338, 0.5294118, 1, 0, 1,
-0.6651043, 0.6661071, -2.515037, 0.5254902, 1, 0, 1,
-0.6614536, 1.464188, -1.126875, 0.5176471, 1, 0, 1,
-0.6599058, 0.2850589, 0.04152978, 0.5137255, 1, 0, 1,
-0.6591068, 2.102685, 0.3920393, 0.5058824, 1, 0, 1,
-0.6581779, 1.525577, -0.2269297, 0.5019608, 1, 0, 1,
-0.6545074, -1.376093, -1.858748, 0.4941176, 1, 0, 1,
-0.6535407, 1.583139, -1.364541, 0.4862745, 1, 0, 1,
-0.6408457, 0.733004, -1.825998, 0.4823529, 1, 0, 1,
-0.635909, 0.9365014, -0.8649353, 0.4745098, 1, 0, 1,
-0.634531, 1.223473, -0.863911, 0.4705882, 1, 0, 1,
-0.6327845, 0.2463636, -1.858686, 0.4627451, 1, 0, 1,
-0.6239353, 0.7612206, -1.531093, 0.4588235, 1, 0, 1,
-0.6217813, 1.837077, 0.7242602, 0.4509804, 1, 0, 1,
-0.6192672, -0.02607715, -3.071896, 0.4470588, 1, 0, 1,
-0.6186534, 1.47244, -1.638052, 0.4392157, 1, 0, 1,
-0.6110561, 0.1975712, -0.3396961, 0.4352941, 1, 0, 1,
-0.6102358, -0.8105662, -2.39706, 0.427451, 1, 0, 1,
-0.6072301, -0.3115747, -1.850387, 0.4235294, 1, 0, 1,
-0.601954, -1.153232, -3.447994, 0.4156863, 1, 0, 1,
-0.5988095, -1.320916, -0.9546917, 0.4117647, 1, 0, 1,
-0.5909057, 1.960266, 0.3230917, 0.4039216, 1, 0, 1,
-0.5898579, 2.022831, -0.5761387, 0.3960784, 1, 0, 1,
-0.589245, 0.6836926, 0.04592261, 0.3921569, 1, 0, 1,
-0.5873345, 0.8562859, -1.584193, 0.3843137, 1, 0, 1,
-0.5828833, -0.7830285, -2.746873, 0.3803922, 1, 0, 1,
-0.5810044, 1.631487, -0.1536192, 0.372549, 1, 0, 1,
-0.5797704, 0.9369125, -0.187542, 0.3686275, 1, 0, 1,
-0.5771574, -0.821323, -3.689746, 0.3607843, 1, 0, 1,
-0.57469, -0.04672083, 0.6928697, 0.3568628, 1, 0, 1,
-0.5741155, 1.397889, -0.2075227, 0.3490196, 1, 0, 1,
-0.5712124, -0.333256, -2.675848, 0.345098, 1, 0, 1,
-0.5689524, 0.4258584, -2.177955, 0.3372549, 1, 0, 1,
-0.5663612, 2.302353, -0.4776556, 0.3333333, 1, 0, 1,
-0.5658038, -0.2855505, -2.62932, 0.3254902, 1, 0, 1,
-0.5652944, -0.5179842, -2.117393, 0.3215686, 1, 0, 1,
-0.564968, 0.6005678, 0.1263073, 0.3137255, 1, 0, 1,
-0.5609775, 1.018622, -0.8853113, 0.3098039, 1, 0, 1,
-0.5587357, -0.851777, -4.423355, 0.3019608, 1, 0, 1,
-0.5565964, 0.291171, 0.5319026, 0.2941177, 1, 0, 1,
-0.5544943, -0.8934145, -3.627433, 0.2901961, 1, 0, 1,
-0.5520619, -1.881698, -2.256357, 0.282353, 1, 0, 1,
-0.5490224, -0.4128962, -3.38386, 0.2784314, 1, 0, 1,
-0.548665, -0.3665659, -2.9489, 0.2705882, 1, 0, 1,
-0.5477421, 0.5814092, -1.774938, 0.2666667, 1, 0, 1,
-0.5454273, -1.706645, -3.800584, 0.2588235, 1, 0, 1,
-0.5443177, 0.632719, -0.7656386, 0.254902, 1, 0, 1,
-0.5429283, -0.269907, -2.849684, 0.2470588, 1, 0, 1,
-0.5426388, -1.218474, -0.9349841, 0.2431373, 1, 0, 1,
-0.5423614, -0.8950243, -2.030967, 0.2352941, 1, 0, 1,
-0.5416878, -0.2311927, 0.1411408, 0.2313726, 1, 0, 1,
-0.5410981, -1.65225, -1.861017, 0.2235294, 1, 0, 1,
-0.532496, -0.9645797, -2.910286, 0.2196078, 1, 0, 1,
-0.5310378, -0.1918764, -0.8253323, 0.2117647, 1, 0, 1,
-0.5297702, -2.659132, -2.40127, 0.2078431, 1, 0, 1,
-0.5281766, -0.6418314, -3.165606, 0.2, 1, 0, 1,
-0.5281213, -1.933255, -3.584806, 0.1921569, 1, 0, 1,
-0.5156757, -0.7913156, -1.760398, 0.1882353, 1, 0, 1,
-0.5093591, -0.9274367, -1.861789, 0.1803922, 1, 0, 1,
-0.5074839, -0.06035577, -1.318871, 0.1764706, 1, 0, 1,
-0.5061349, -0.4907996, -2.419909, 0.1686275, 1, 0, 1,
-0.5042865, -1.147347, -3.494903, 0.1647059, 1, 0, 1,
-0.5039529, 2.392355, -0.4748415, 0.1568628, 1, 0, 1,
-0.5038671, -0.3415734, -2.112127, 0.1529412, 1, 0, 1,
-0.5037891, 0.2930376, -1.356198, 0.145098, 1, 0, 1,
-0.5034323, -1.902937, -2.599598, 0.1411765, 1, 0, 1,
-0.5026421, -0.4872549, -2.533026, 0.1333333, 1, 0, 1,
-0.4986757, -1.52584, -4.337323, 0.1294118, 1, 0, 1,
-0.4959575, 0.4807445, -0.1953187, 0.1215686, 1, 0, 1,
-0.4949761, -0.7419447, -0.5196344, 0.1176471, 1, 0, 1,
-0.4911221, -0.8336945, -2.526685, 0.1098039, 1, 0, 1,
-0.4866944, 2.369829, -1.096387, 0.1058824, 1, 0, 1,
-0.4835722, -0.5937641, -3.28331, 0.09803922, 1, 0, 1,
-0.4818387, 0.3732638, -2.3079, 0.09019608, 1, 0, 1,
-0.481537, -0.2473955, -1.644666, 0.08627451, 1, 0, 1,
-0.4759141, 0.3493488, -1.143465, 0.07843138, 1, 0, 1,
-0.4745002, 0.1367112, -2.039553, 0.07450981, 1, 0, 1,
-0.4713777, -2.590546, -2.90982, 0.06666667, 1, 0, 1,
-0.4706842, 0.42628, 0.4108577, 0.0627451, 1, 0, 1,
-0.4704627, 0.3719971, -1.347586, 0.05490196, 1, 0, 1,
-0.4688061, 0.6989437, -1.94868, 0.05098039, 1, 0, 1,
-0.4653922, 1.294389, -1.1748, 0.04313726, 1, 0, 1,
-0.4627873, 0.02555065, 1.291355, 0.03921569, 1, 0, 1,
-0.4561272, -1.447403, -3.28875, 0.03137255, 1, 0, 1,
-0.4487063, -0.2195575, -2.939654, 0.02745098, 1, 0, 1,
-0.4484827, -1.315268, -3.825629, 0.01960784, 1, 0, 1,
-0.4409391, -0.2013192, -2.145573, 0.01568628, 1, 0, 1,
-0.4408484, 0.2009229, -0.3338678, 0.007843138, 1, 0, 1,
-0.4364738, 1.067149, -0.4204255, 0.003921569, 1, 0, 1,
-0.4348033, -0.8365015, -4.901937, 0, 1, 0.003921569, 1,
-0.4335404, 0.6918546, -0.5743493, 0, 1, 0.01176471, 1,
-0.4321561, 1.499552, -0.4236434, 0, 1, 0.01568628, 1,
-0.4313657, 1.312415, -0.3456723, 0, 1, 0.02352941, 1,
-0.4263362, -0.3247983, -0.3353321, 0, 1, 0.02745098, 1,
-0.4260434, 0.9849025, -1.519483, 0, 1, 0.03529412, 1,
-0.4259643, 2.695825, -1.168984, 0, 1, 0.03921569, 1,
-0.4243076, 1.887182, -1.282961, 0, 1, 0.04705882, 1,
-0.4183027, 0.5504771, 0.14712, 0, 1, 0.05098039, 1,
-0.4162517, 0.3466113, -1.122936, 0, 1, 0.05882353, 1,
-0.4146329, 0.83687, -0.1446376, 0, 1, 0.0627451, 1,
-0.4139806, -0.6811391, -3.723036, 0, 1, 0.07058824, 1,
-0.4139592, -0.4571395, -1.81311, 0, 1, 0.07450981, 1,
-0.4138376, -0.6990961, -4.042262, 0, 1, 0.08235294, 1,
-0.4100133, -0.07402859, -3.194891, 0, 1, 0.08627451, 1,
-0.408368, -0.3909816, -3.295829, 0, 1, 0.09411765, 1,
-0.397914, -0.9368395, -1.575841, 0, 1, 0.1019608, 1,
-0.3962723, 1.209273, -2.075636, 0, 1, 0.1058824, 1,
-0.3954137, 0.15061, -0.607868, 0, 1, 0.1137255, 1,
-0.3950112, -0.1862509, -1.357608, 0, 1, 0.1176471, 1,
-0.3835705, 0.6652772, -1.211141, 0, 1, 0.1254902, 1,
-0.3813083, -1.162453, -3.391456, 0, 1, 0.1294118, 1,
-0.3758418, -0.06554144, -1.744901, 0, 1, 0.1372549, 1,
-0.3747758, -1.228248, -4.713096, 0, 1, 0.1411765, 1,
-0.3728522, -0.6060755, -1.406006, 0, 1, 0.1490196, 1,
-0.3716166, -0.3305414, -1.586765, 0, 1, 0.1529412, 1,
-0.3708338, -2.026128, -2.909406, 0, 1, 0.1607843, 1,
-0.3687705, -0.004862344, -3.02715, 0, 1, 0.1647059, 1,
-0.3681975, 0.3003413, -0.7597277, 0, 1, 0.172549, 1,
-0.3634382, 0.4895051, -2.437783, 0, 1, 0.1764706, 1,
-0.3568341, -1.134022, -3.453932, 0, 1, 0.1843137, 1,
-0.3562198, -0.7415042, -1.199945, 0, 1, 0.1882353, 1,
-0.3522875, 0.2993058, -0.1706144, 0, 1, 0.1960784, 1,
-0.3516983, 0.2416116, -1.146495, 0, 1, 0.2039216, 1,
-0.3507862, 0.5590788, -1.307873, 0, 1, 0.2078431, 1,
-0.3493575, 1.246072, -0.668875, 0, 1, 0.2156863, 1,
-0.3490286, 2.338937, -0.3437681, 0, 1, 0.2196078, 1,
-0.339176, 2.110919, -1.0031, 0, 1, 0.227451, 1,
-0.3351931, 1.516761, -0.723352, 0, 1, 0.2313726, 1,
-0.3330109, 1.933968, -0.6609622, 0, 1, 0.2392157, 1,
-0.3299017, -0.149361, -1.674772, 0, 1, 0.2431373, 1,
-0.3266855, 1.26715, -0.1843675, 0, 1, 0.2509804, 1,
-0.3171387, -0.1722568, -2.093684, 0, 1, 0.254902, 1,
-0.3161564, 0.6864114, -0.4716818, 0, 1, 0.2627451, 1,
-0.3053197, 0.9318393, 0.7623278, 0, 1, 0.2666667, 1,
-0.3010161, 1.410285, -0.4919907, 0, 1, 0.2745098, 1,
-0.3003541, 1.086004, -0.878395, 0, 1, 0.2784314, 1,
-0.288734, -1.012003, -3.716336, 0, 1, 0.2862745, 1,
-0.2882845, 1.561656, -0.5145731, 0, 1, 0.2901961, 1,
-0.2876642, 0.895731, -0.4394481, 0, 1, 0.2980392, 1,
-0.2860753, -0.916565, -2.809602, 0, 1, 0.3058824, 1,
-0.2859068, 0.5156928, -0.4802045, 0, 1, 0.3098039, 1,
-0.2841254, -0.08153711, -2.421702, 0, 1, 0.3176471, 1,
-0.2837051, -0.02944667, -2.110179, 0, 1, 0.3215686, 1,
-0.2759615, -0.5575539, -3.025678, 0, 1, 0.3294118, 1,
-0.2708288, 0.3604047, 0.1275406, 0, 1, 0.3333333, 1,
-0.2631437, 1.071643, -0.6761065, 0, 1, 0.3411765, 1,
-0.2623037, 0.7348502, -0.9285665, 0, 1, 0.345098, 1,
-0.2565558, -1.680441, -2.465693, 0, 1, 0.3529412, 1,
-0.2564604, -0.2544698, -2.992357, 0, 1, 0.3568628, 1,
-0.2535333, 1.013837, -0.3711448, 0, 1, 0.3647059, 1,
-0.2528635, -1.638608, -2.444544, 0, 1, 0.3686275, 1,
-0.2528245, -1.52748, -2.934998, 0, 1, 0.3764706, 1,
-0.2513416, -0.3633342, -2.427494, 0, 1, 0.3803922, 1,
-0.2442735, -0.04664777, -2.488879, 0, 1, 0.3882353, 1,
-0.2430644, -0.7798157, -2.898311, 0, 1, 0.3921569, 1,
-0.242451, 0.3563346, -1.635052, 0, 1, 0.4, 1,
-0.2379657, -0.4666498, -1.934575, 0, 1, 0.4078431, 1,
-0.2369679, 0.02478805, -2.14137, 0, 1, 0.4117647, 1,
-0.2366331, 0.02091656, -0.3099287, 0, 1, 0.4196078, 1,
-0.2365026, 0.6574339, -0.1839103, 0, 1, 0.4235294, 1,
-0.2295557, -0.3066088, -2.895721, 0, 1, 0.4313726, 1,
-0.2271849, 0.9872745, -3.202745, 0, 1, 0.4352941, 1,
-0.2252516, 0.7813595, 1.014686, 0, 1, 0.4431373, 1,
-0.2248603, 0.0004617283, 1.10913, 0, 1, 0.4470588, 1,
-0.222491, 1.165364, 1.104899, 0, 1, 0.454902, 1,
-0.2197453, -0.637341, -2.435102, 0, 1, 0.4588235, 1,
-0.2165418, -0.4067022, -3.683583, 0, 1, 0.4666667, 1,
-0.2160497, -0.4081105, -2.404271, 0, 1, 0.4705882, 1,
-0.2157945, -0.8677596, -3.340672, 0, 1, 0.4784314, 1,
-0.2146467, 0.7639915, -1.250968, 0, 1, 0.4823529, 1,
-0.2137752, -1.791184, -3.341839, 0, 1, 0.4901961, 1,
-0.2094564, -1.731257, -1.74404, 0, 1, 0.4941176, 1,
-0.2091312, -1.684852, -3.1361, 0, 1, 0.5019608, 1,
-0.2086509, 1.250232, -1.312808, 0, 1, 0.509804, 1,
-0.2069244, -0.263484, -2.311181, 0, 1, 0.5137255, 1,
-0.2056511, 0.3512675, -0.5408254, 0, 1, 0.5215687, 1,
-0.2010188, 1.122243, -1.040525, 0, 1, 0.5254902, 1,
-0.1990919, 1.337668, -0.7605052, 0, 1, 0.5333334, 1,
-0.1980609, -1.004529, -3.953532, 0, 1, 0.5372549, 1,
-0.1978679, -1.2265, -1.894631, 0, 1, 0.5450981, 1,
-0.197487, -0.04188105, -1.834891, 0, 1, 0.5490196, 1,
-0.1966874, 2.604695, 0.2668122, 0, 1, 0.5568628, 1,
-0.1923173, 0.3859068, 0.2799303, 0, 1, 0.5607843, 1,
-0.1887003, -1.978209, -2.16624, 0, 1, 0.5686275, 1,
-0.1853394, 0.6394303, -0.2813645, 0, 1, 0.572549, 1,
-0.1834303, -0.6163083, -2.053987, 0, 1, 0.5803922, 1,
-0.1797662, 1.733816, -1.837212, 0, 1, 0.5843138, 1,
-0.174823, -0.7920287, -2.324398, 0, 1, 0.5921569, 1,
-0.1744548, -1.491459, -3.364034, 0, 1, 0.5960785, 1,
-0.1744016, 0.09110215, -3.118786, 0, 1, 0.6039216, 1,
-0.1742733, -0.541698, -1.379139, 0, 1, 0.6117647, 1,
-0.1713269, -1.414649, -2.65734, 0, 1, 0.6156863, 1,
-0.1695934, -0.5863782, -3.445491, 0, 1, 0.6235294, 1,
-0.1653283, 1.027157, -0.165028, 0, 1, 0.627451, 1,
-0.162835, 0.3615099, -1.432639, 0, 1, 0.6352941, 1,
-0.1628006, -0.5752444, -3.192943, 0, 1, 0.6392157, 1,
-0.1609226, -1.1924, -3.517587, 0, 1, 0.6470588, 1,
-0.1607209, 0.1900266, -0.9412037, 0, 1, 0.6509804, 1,
-0.1605383, 0.586062, -2.059986, 0, 1, 0.6588235, 1,
-0.159735, -0.615837, -3.650431, 0, 1, 0.6627451, 1,
-0.1596222, 0.6934916, -1.23107, 0, 1, 0.6705883, 1,
-0.1542515, -0.5925529, -2.433358, 0, 1, 0.6745098, 1,
-0.150999, 0.7173843, 0.6824161, 0, 1, 0.682353, 1,
-0.1501167, -0.8236307, -1.63331, 0, 1, 0.6862745, 1,
-0.1450689, 0.4796491, -0.1885826, 0, 1, 0.6941177, 1,
-0.143012, -0.2190868, -2.382031, 0, 1, 0.7019608, 1,
-0.1402888, -0.440504, -1.896532, 0, 1, 0.7058824, 1,
-0.1391667, -0.09056237, -2.403284, 0, 1, 0.7137255, 1,
-0.1379232, 1.158182, 1.272258, 0, 1, 0.7176471, 1,
-0.1328962, 1.428852, -0.1889955, 0, 1, 0.7254902, 1,
-0.1325539, 1.87707, -0.07052011, 0, 1, 0.7294118, 1,
-0.1299861, 0.6362518, 0.3815194, 0, 1, 0.7372549, 1,
-0.1292648, 0.7399191, 0.3288927, 0, 1, 0.7411765, 1,
-0.1288396, 0.02703779, -0.2403539, 0, 1, 0.7490196, 1,
-0.1275993, -0.2517926, -1.729337, 0, 1, 0.7529412, 1,
-0.1249172, -1.558894, -0.8569307, 0, 1, 0.7607843, 1,
-0.124331, -1.55735, -3.107339, 0, 1, 0.7647059, 1,
-0.1232286, -1.923328, -1.245984, 0, 1, 0.772549, 1,
-0.1166939, 0.08604337, -0.8639288, 0, 1, 0.7764706, 1,
-0.1131095, -1.071369, -3.67205, 0, 1, 0.7843137, 1,
-0.1032026, -1.301403, -3.129195, 0, 1, 0.7882353, 1,
-0.1022191, -1.451921, -2.515684, 0, 1, 0.7960784, 1,
-0.1011685, 1.10203, 0.585124, 0, 1, 0.8039216, 1,
-0.1004252, 0.2230534, -0.1236601, 0, 1, 0.8078431, 1,
-0.09868425, -0.9403765, -3.318274, 0, 1, 0.8156863, 1,
-0.08869318, 0.1112936, -0.612092, 0, 1, 0.8196079, 1,
-0.08619224, 0.7496633, -0.3994028, 0, 1, 0.827451, 1,
-0.08507583, -1.92277, -1.747958, 0, 1, 0.8313726, 1,
-0.08181107, -2.027885, -3.616924, 0, 1, 0.8392157, 1,
-0.08143716, 1.062595, -0.1013715, 0, 1, 0.8431373, 1,
-0.07830606, -0.5036019, -4.510053, 0, 1, 0.8509804, 1,
-0.07769332, 0.1459456, -1.611103, 0, 1, 0.854902, 1,
-0.0770401, 0.8700209, -0.8201788, 0, 1, 0.8627451, 1,
-0.074734, 0.9159678, -0.260622, 0, 1, 0.8666667, 1,
-0.07132879, 0.245083, -0.7089633, 0, 1, 0.8745098, 1,
-0.06876491, 0.9547272, -1.580744, 0, 1, 0.8784314, 1,
-0.06517874, -0.6893621, -4.849496, 0, 1, 0.8862745, 1,
-0.0628622, 1.006654, -1.280466, 0, 1, 0.8901961, 1,
-0.05376702, 0.4776188, 0.6530876, 0, 1, 0.8980392, 1,
-0.05283183, -0.7432532, -4.237078, 0, 1, 0.9058824, 1,
-0.04060869, -0.3197919, -1.285762, 0, 1, 0.9098039, 1,
-0.03954318, -0.3900397, -2.816785, 0, 1, 0.9176471, 1,
-0.03846824, 0.04543804, -0.4332978, 0, 1, 0.9215686, 1,
-0.03676585, 0.9735896, 0.3023998, 0, 1, 0.9294118, 1,
-0.03546072, -0.7493226, -3.409948, 0, 1, 0.9333333, 1,
-0.03304529, 0.673213, -0.9564213, 0, 1, 0.9411765, 1,
-0.03076011, -1.927721, -3.450437, 0, 1, 0.945098, 1,
-0.02964927, 0.3040623, -0.4040616, 0, 1, 0.9529412, 1,
-0.02370189, 1.400592, 1.073695, 0, 1, 0.9568627, 1,
-0.01851721, 0.2937968, 0.1610977, 0, 1, 0.9647059, 1,
-0.01821883, -1.02856, -3.112122, 0, 1, 0.9686275, 1,
-0.0162561, -0.2820846, -3.602836, 0, 1, 0.9764706, 1,
-0.01270017, 0.5987118, 0.7908976, 0, 1, 0.9803922, 1,
-0.01009873, -1.084395, -2.541918, 0, 1, 0.9882353, 1,
-0.009781495, -1.988099, -2.959269, 0, 1, 0.9921569, 1,
-0.008033174, 0.4559804, 0.05942021, 0, 1, 1, 1,
-0.007226998, 1.478598, -0.1937969, 0, 0.9921569, 1, 1,
-0.003716653, 0.4228073, -1.286288, 0, 0.9882353, 1, 1,
-0.002251466, -0.6849234, -3.327331, 0, 0.9803922, 1, 1,
0.0008572832, 1.634747, 0.3483146, 0, 0.9764706, 1, 1,
0.003250407, -0.8157614, 2.586771, 0, 0.9686275, 1, 1,
0.005271641, 0.8817136, 0.9938558, 0, 0.9647059, 1, 1,
0.007383008, 1.546131, -0.135884, 0, 0.9568627, 1, 1,
0.008963131, -0.4059054, 2.567861, 0, 0.9529412, 1, 1,
0.009714586, 0.6710523, -0.6879824, 0, 0.945098, 1, 1,
0.01974957, 0.09406466, -0.2786995, 0, 0.9411765, 1, 1,
0.02236792, 0.544853, -1.228246, 0, 0.9333333, 1, 1,
0.02289724, -0.8042988, 2.388386, 0, 0.9294118, 1, 1,
0.02965447, -0.1766851, 2.315383, 0, 0.9215686, 1, 1,
0.03037981, 0.1383554, 0.6453996, 0, 0.9176471, 1, 1,
0.03083023, 2.130239, -0.1777741, 0, 0.9098039, 1, 1,
0.03107254, 1.554005, -0.5512738, 0, 0.9058824, 1, 1,
0.03179147, 0.9224952, 0.6186356, 0, 0.8980392, 1, 1,
0.03213552, -0.5253913, 3.535745, 0, 0.8901961, 1, 1,
0.03554253, -0.9370106, 2.353471, 0, 0.8862745, 1, 1,
0.03591711, -1.333501, 1.864871, 0, 0.8784314, 1, 1,
0.03611296, -0.5656936, 3.831136, 0, 0.8745098, 1, 1,
0.03841568, -1.071866, 2.71157, 0, 0.8666667, 1, 1,
0.04042779, -1.77232, 3.223396, 0, 0.8627451, 1, 1,
0.04695627, 0.2227429, 0.1643958, 0, 0.854902, 1, 1,
0.05036643, 1.642559, 0.6114298, 0, 0.8509804, 1, 1,
0.05143826, -0.5485054, 3.72706, 0, 0.8431373, 1, 1,
0.05220113, 1.321339, 0.5574577, 0, 0.8392157, 1, 1,
0.0526026, -1.883044, 2.661893, 0, 0.8313726, 1, 1,
0.05892774, -1.088484, 4.366966, 0, 0.827451, 1, 1,
0.06017454, 0.312898, 1.490139, 0, 0.8196079, 1, 1,
0.06341267, 0.7000726, 0.2318479, 0, 0.8156863, 1, 1,
0.06458468, -0.4502574, 3.301591, 0, 0.8078431, 1, 1,
0.06570888, 0.8331425, -0.05976828, 0, 0.8039216, 1, 1,
0.06678057, 0.8710821, 0.2035417, 0, 0.7960784, 1, 1,
0.06777683, -1.204182, 4.110091, 0, 0.7882353, 1, 1,
0.06796181, -0.3980026, 3.89359, 0, 0.7843137, 1, 1,
0.07274222, -0.3724155, 3.396318, 0, 0.7764706, 1, 1,
0.07280608, 0.3664922, 1.284019, 0, 0.772549, 1, 1,
0.07557745, 0.3906214, -0.8985162, 0, 0.7647059, 1, 1,
0.07680071, -1.00059, 2.501856, 0, 0.7607843, 1, 1,
0.07792711, -1.262389, 4.038883, 0, 0.7529412, 1, 1,
0.08320551, -2.3467, 3.793549, 0, 0.7490196, 1, 1,
0.08438776, -0.140048, 2.518169, 0, 0.7411765, 1, 1,
0.08565865, -0.4919845, 2.613627, 0, 0.7372549, 1, 1,
0.08586274, -0.1191849, 2.841276, 0, 0.7294118, 1, 1,
0.08981047, 1.632206, 0.5970547, 0, 0.7254902, 1, 1,
0.09522077, 0.8843501, -0.8052037, 0, 0.7176471, 1, 1,
0.09968992, -0.7741979, 4.42179, 0, 0.7137255, 1, 1,
0.1005254, -0.04119542, 1.2371, 0, 0.7058824, 1, 1,
0.1028498, -0.4910427, 2.473568, 0, 0.6980392, 1, 1,
0.1030475, -1.615514, 3.162581, 0, 0.6941177, 1, 1,
0.1080822, 1.922873, 0.07138184, 0, 0.6862745, 1, 1,
0.1092181, 1.308969, -1.719326, 0, 0.682353, 1, 1,
0.1127934, -0.5896527, 3.031014, 0, 0.6745098, 1, 1,
0.1136922, 1.27815, 0.29278, 0, 0.6705883, 1, 1,
0.1150225, 0.2297301, -0.7131897, 0, 0.6627451, 1, 1,
0.1170858, -1.853577, 3.846243, 0, 0.6588235, 1, 1,
0.1172728, 1.096066, -1.644779, 0, 0.6509804, 1, 1,
0.1193863, -0.974676, 1.580074, 0, 0.6470588, 1, 1,
0.1206983, -0.5808134, 3.778807, 0, 0.6392157, 1, 1,
0.1229338, 0.3744069, -0.5387243, 0, 0.6352941, 1, 1,
0.1364661, 1.539382, 1.707868, 0, 0.627451, 1, 1,
0.139733, -1.390649, 3.151139, 0, 0.6235294, 1, 1,
0.1411876, 0.7272048, 1.293337, 0, 0.6156863, 1, 1,
0.1441478, 1.183434, -0.189496, 0, 0.6117647, 1, 1,
0.1442875, 1.330271, 2.025767, 0, 0.6039216, 1, 1,
0.1448827, 0.2694375, 0.8202785, 0, 0.5960785, 1, 1,
0.1450098, -1.054819, 1.627877, 0, 0.5921569, 1, 1,
0.1485797, -0.4700621, 3.931462, 0, 0.5843138, 1, 1,
0.1508529, 0.3958934, 0.03422588, 0, 0.5803922, 1, 1,
0.1509554, -2.789394, 2.742165, 0, 0.572549, 1, 1,
0.1516478, 0.1797216, 2.744137, 0, 0.5686275, 1, 1,
0.1543256, 1.276192, 0.1760495, 0, 0.5607843, 1, 1,
0.1648779, 0.6304992, 0.3691664, 0, 0.5568628, 1, 1,
0.1692329, -1.163261, 3.359659, 0, 0.5490196, 1, 1,
0.1709024, 1.022376, 1.560656, 0, 0.5450981, 1, 1,
0.1725831, -0.07899747, 2.570089, 0, 0.5372549, 1, 1,
0.172917, 0.4566241, -0.1371029, 0, 0.5333334, 1, 1,
0.1740103, -0.01569472, 2.003438, 0, 0.5254902, 1, 1,
0.1758952, -0.7297669, 4.318464, 0, 0.5215687, 1, 1,
0.1777279, 0.849013, -2.648076, 0, 0.5137255, 1, 1,
0.1779773, 2.000915, -0.2574732, 0, 0.509804, 1, 1,
0.1792796, 2.996874, 0.14157, 0, 0.5019608, 1, 1,
0.1809569, -0.3195668, 2.806925, 0, 0.4941176, 1, 1,
0.1810888, 0.1885748, 0.5748549, 0, 0.4901961, 1, 1,
0.1852574, 1.550004, 1.089681, 0, 0.4823529, 1, 1,
0.1860881, -0.5362312, 1.569532, 0, 0.4784314, 1, 1,
0.1876133, -2.734226, 3.863581, 0, 0.4705882, 1, 1,
0.1877472, 0.160326, 2.220861, 0, 0.4666667, 1, 1,
0.1953407, -0.8456903, 1.250117, 0, 0.4588235, 1, 1,
0.1985925, -2.375914, 2.427583, 0, 0.454902, 1, 1,
0.199077, 1.256242, 1.903815, 0, 0.4470588, 1, 1,
0.1995784, -0.3427106, 2.615532, 0, 0.4431373, 1, 1,
0.1996123, -0.6088462, 3.330528, 0, 0.4352941, 1, 1,
0.205144, 0.1501506, 1.426528, 0, 0.4313726, 1, 1,
0.2054339, 0.3969364, -0.208815, 0, 0.4235294, 1, 1,
0.2064041, 0.7974061, 1.30759, 0, 0.4196078, 1, 1,
0.2113296, -0.8174655, 1.385145, 0, 0.4117647, 1, 1,
0.2114017, -2.165176, 3.772103, 0, 0.4078431, 1, 1,
0.2137341, 2.517887, -1.654155, 0, 0.4, 1, 1,
0.2152068, -0.6640776, 3.578458, 0, 0.3921569, 1, 1,
0.2179571, 0.4139223, 0.02674595, 0, 0.3882353, 1, 1,
0.2184072, -0.4496915, 3.419561, 0, 0.3803922, 1, 1,
0.2184705, 1.039198, -1.01484, 0, 0.3764706, 1, 1,
0.2185263, -0.8543658, 1.470275, 0, 0.3686275, 1, 1,
0.2193232, -0.8278862, 3.574713, 0, 0.3647059, 1, 1,
0.2257688, -0.807478, 1.721902, 0, 0.3568628, 1, 1,
0.2260973, 1.294414, -1.711395, 0, 0.3529412, 1, 1,
0.2269433, 0.7589935, 1.387637, 0, 0.345098, 1, 1,
0.2285095, 2.208364, 0.2393337, 0, 0.3411765, 1, 1,
0.2436536, -0.4748704, 1.364481, 0, 0.3333333, 1, 1,
0.2508455, 0.2905087, 2.079935, 0, 0.3294118, 1, 1,
0.2556172, 0.4467842, -0.242566, 0, 0.3215686, 1, 1,
0.2615134, -0.8680438, 1.604393, 0, 0.3176471, 1, 1,
0.2620054, 0.5134536, -0.2364887, 0, 0.3098039, 1, 1,
0.2635824, 0.520321, -1.413849, 0, 0.3058824, 1, 1,
0.2674149, -0.08378065, 2.135948, 0, 0.2980392, 1, 1,
0.2716905, 0.2603605, 0.6237344, 0, 0.2901961, 1, 1,
0.2736485, -2.305073, 2.630977, 0, 0.2862745, 1, 1,
0.2799326, 1.461434, -1.250427, 0, 0.2784314, 1, 1,
0.2845828, 0.4027727, 1.802912, 0, 0.2745098, 1, 1,
0.2848023, -0.7219709, 4.892648, 0, 0.2666667, 1, 1,
0.2850302, -0.6818063, 0.796957, 0, 0.2627451, 1, 1,
0.2872652, -0.89522, 2.095935, 0, 0.254902, 1, 1,
0.2883294, -1.009088, 2.750844, 0, 0.2509804, 1, 1,
0.2990513, 0.3040409, 0.247728, 0, 0.2431373, 1, 1,
0.3000116, -1.091676, 4.23573, 0, 0.2392157, 1, 1,
0.3016569, -2.148791, 3.465697, 0, 0.2313726, 1, 1,
0.3023126, 1.442702, 2.63465, 0, 0.227451, 1, 1,
0.3048921, -0.09708963, 1.805898, 0, 0.2196078, 1, 1,
0.3130862, -0.794691, 3.4347, 0, 0.2156863, 1, 1,
0.3165509, -0.8813957, 2.180803, 0, 0.2078431, 1, 1,
0.3199055, 0.465385, -0.5473022, 0, 0.2039216, 1, 1,
0.3220433, -0.2840887, 2.804828, 0, 0.1960784, 1, 1,
0.3260677, -0.5580503, 3.374307, 0, 0.1882353, 1, 1,
0.334107, -0.08364239, 1.565964, 0, 0.1843137, 1, 1,
0.3365467, 0.5740056, -0.1980725, 0, 0.1764706, 1, 1,
0.3371931, -1.04642, 4.45338, 0, 0.172549, 1, 1,
0.3375748, 1.090089, 1.542572, 0, 0.1647059, 1, 1,
0.3407494, 0.2276551, 0.5364636, 0, 0.1607843, 1, 1,
0.341511, -1.496492, 2.616444, 0, 0.1529412, 1, 1,
0.3435415, -1.681048, 2.146032, 0, 0.1490196, 1, 1,
0.3438593, -1.436794, 1.629755, 0, 0.1411765, 1, 1,
0.3463468, -0.7255002, 2.602572, 0, 0.1372549, 1, 1,
0.3470707, -1.546403, 2.45288, 0, 0.1294118, 1, 1,
0.3480326, -0.5650286, 2.274381, 0, 0.1254902, 1, 1,
0.3521791, -0.02411265, 0.968914, 0, 0.1176471, 1, 1,
0.3531159, 0.2513301, 1.410498, 0, 0.1137255, 1, 1,
0.3537873, -0.8421213, 3.073613, 0, 0.1058824, 1, 1,
0.3563016, -1.198503, 1.739907, 0, 0.09803922, 1, 1,
0.357511, -0.6671116, 1.760873, 0, 0.09411765, 1, 1,
0.3592443, -1.85219, 3.374371, 0, 0.08627451, 1, 1,
0.3619319, 1.42889, 0.3338184, 0, 0.08235294, 1, 1,
0.3690157, 0.2333785, 2.160191, 0, 0.07450981, 1, 1,
0.3713157, -0.7033871, 1.198603, 0, 0.07058824, 1, 1,
0.373256, -0.5760243, 2.970857, 0, 0.0627451, 1, 1,
0.3777339, -0.9198012, 2.242509, 0, 0.05882353, 1, 1,
0.3874872, -0.2194776, 3.065768, 0, 0.05098039, 1, 1,
0.3907504, 0.6539913, 0.3418405, 0, 0.04705882, 1, 1,
0.3917821, -0.1892519, 4.10734, 0, 0.03921569, 1, 1,
0.3951934, -1.036585, 2.789924, 0, 0.03529412, 1, 1,
0.3960897, 0.582173, -0.5307418, 0, 0.02745098, 1, 1,
0.3980132, 0.761084, 1.220481, 0, 0.02352941, 1, 1,
0.3980435, -0.2838279, -0.6912029, 0, 0.01568628, 1, 1,
0.4025681, -1.675585, 3.283811, 0, 0.01176471, 1, 1,
0.4046036, -0.7186769, 2.972623, 0, 0.003921569, 1, 1,
0.4061126, 1.00843, 1.851309, 0.003921569, 0, 1, 1,
0.4076163, 0.9138192, -0.5919453, 0.007843138, 0, 1, 1,
0.4099851, 0.7297396, -1.221679, 0.01568628, 0, 1, 1,
0.4100367, -0.01720846, 1.499825, 0.01960784, 0, 1, 1,
0.4282869, -0.04172128, 2.553435, 0.02745098, 0, 1, 1,
0.4291441, 2.116382, 1.833364, 0.03137255, 0, 1, 1,
0.4303315, -1.295637, 3.251758, 0.03921569, 0, 1, 1,
0.4306718, 1.493565, 1.580011, 0.04313726, 0, 1, 1,
0.4342817, 0.2792034, 1.424612, 0.05098039, 0, 1, 1,
0.435533, 0.2751048, 1.032281, 0.05490196, 0, 1, 1,
0.4479107, -0.9646148, 2.631579, 0.0627451, 0, 1, 1,
0.4505053, -0.4470873, 2.948443, 0.06666667, 0, 1, 1,
0.4511241, 0.2864068, 2.166702, 0.07450981, 0, 1, 1,
0.452198, -0.3203204, 1.686942, 0.07843138, 0, 1, 1,
0.4529673, 0.5196285, 1.120493, 0.08627451, 0, 1, 1,
0.455377, 1.172073, 0.1619938, 0.09019608, 0, 1, 1,
0.4571501, -0.1169975, 2.180007, 0.09803922, 0, 1, 1,
0.4609081, -1.112112, 2.085477, 0.1058824, 0, 1, 1,
0.4631695, 0.246968, 2.166756, 0.1098039, 0, 1, 1,
0.4721655, -0.8887839, 3.281499, 0.1176471, 0, 1, 1,
0.4723857, 0.7850361, 1.78628, 0.1215686, 0, 1, 1,
0.4807885, 0.8406207, 0.8361513, 0.1294118, 0, 1, 1,
0.4836274, -0.5955576, 1.404112, 0.1333333, 0, 1, 1,
0.4839748, 0.06850695, 1.816733, 0.1411765, 0, 1, 1,
0.4867365, 0.66964, 0.85958, 0.145098, 0, 1, 1,
0.4875902, 1.793591, 0.3750907, 0.1529412, 0, 1, 1,
0.4895425, -0.2783847, 2.43937, 0.1568628, 0, 1, 1,
0.4901036, -0.9980692, 3.585685, 0.1647059, 0, 1, 1,
0.4961315, -1.502941, 1.81101, 0.1686275, 0, 1, 1,
0.5018155, -0.5032517, 2.683806, 0.1764706, 0, 1, 1,
0.504717, 0.1758999, 1.809101, 0.1803922, 0, 1, 1,
0.5055749, -1.141214, 2.988171, 0.1882353, 0, 1, 1,
0.5058263, -1.496829, 1.015111, 0.1921569, 0, 1, 1,
0.5073908, 1.319168, 1.600772, 0.2, 0, 1, 1,
0.5109705, 0.4436705, 0.9236752, 0.2078431, 0, 1, 1,
0.5198411, 0.01374516, 1.856142, 0.2117647, 0, 1, 1,
0.5240082, -1.611987, 2.178877, 0.2196078, 0, 1, 1,
0.528101, 0.4202025, 1.782225, 0.2235294, 0, 1, 1,
0.5298707, 0.7592262, 0.9516553, 0.2313726, 0, 1, 1,
0.533316, -0.8525271, 2.878527, 0.2352941, 0, 1, 1,
0.5381074, 0.4844995, 0.1054037, 0.2431373, 0, 1, 1,
0.5404724, -0.1433848, 1.470632, 0.2470588, 0, 1, 1,
0.5412332, 0.06765094, 2.560949, 0.254902, 0, 1, 1,
0.5431002, -0.0850059, 2.95549, 0.2588235, 0, 1, 1,
0.5458786, -0.7679107, 1.658214, 0.2666667, 0, 1, 1,
0.5472738, 0.3801826, 1.330239, 0.2705882, 0, 1, 1,
0.5508478, -0.001567589, 2.870916, 0.2784314, 0, 1, 1,
0.5513535, 1.643998, 0.4212531, 0.282353, 0, 1, 1,
0.5518191, 0.8982677, 0.09977196, 0.2901961, 0, 1, 1,
0.5606285, 0.9667881, 0.7403572, 0.2941177, 0, 1, 1,
0.5608673, 2.323918, 2.191838, 0.3019608, 0, 1, 1,
0.5623136, 1.995928, -1.48249, 0.3098039, 0, 1, 1,
0.564136, 2.035787, -1.431301, 0.3137255, 0, 1, 1,
0.5646008, 0.05152853, 1.971243, 0.3215686, 0, 1, 1,
0.5669717, 1.183282, 0.705985, 0.3254902, 0, 1, 1,
0.5712464, -2.012464, 2.169407, 0.3333333, 0, 1, 1,
0.5833508, -0.847833, 2.086122, 0.3372549, 0, 1, 1,
0.5840123, -0.06311655, 2.887882, 0.345098, 0, 1, 1,
0.5880463, -0.7520891, 2.510891, 0.3490196, 0, 1, 1,
0.5960543, 0.2263553, 1.940625, 0.3568628, 0, 1, 1,
0.6021671, -1.029728, 2.121982, 0.3607843, 0, 1, 1,
0.6065273, -0.7004672, 2.639488, 0.3686275, 0, 1, 1,
0.6071783, 1.002889, -0.7903791, 0.372549, 0, 1, 1,
0.607316, -0.3408057, 2.224084, 0.3803922, 0, 1, 1,
0.6073235, -0.8879568, 2.941611, 0.3843137, 0, 1, 1,
0.6156311, -0.70208, 2.518811, 0.3921569, 0, 1, 1,
0.6185333, -2.29896, 0.8356557, 0.3960784, 0, 1, 1,
0.6233885, -1.02238, 3.347707, 0.4039216, 0, 1, 1,
0.6249033, 0.7529325, 0.6533573, 0.4117647, 0, 1, 1,
0.6277035, 0.03774493, 0.982667, 0.4156863, 0, 1, 1,
0.6300142, -1.882962, 2.275293, 0.4235294, 0, 1, 1,
0.6363268, 0.2279003, 1.734, 0.427451, 0, 1, 1,
0.6428143, 1.408104, -0.1387188, 0.4352941, 0, 1, 1,
0.6433725, -1.017004, 2.86341, 0.4392157, 0, 1, 1,
0.6455267, -0.3943564, 1.288875, 0.4470588, 0, 1, 1,
0.6459427, 1.575828, 0.902744, 0.4509804, 0, 1, 1,
0.6463722, -0.8106663, 4.83572, 0.4588235, 0, 1, 1,
0.6503053, -0.1418752, 1.93533, 0.4627451, 0, 1, 1,
0.6560864, -1.25035, 1.066837, 0.4705882, 0, 1, 1,
0.6577396, -0.8501273, 2.232255, 0.4745098, 0, 1, 1,
0.6592606, -1.653911, 0.8632357, 0.4823529, 0, 1, 1,
0.6624877, 0.738186, 1.119131, 0.4862745, 0, 1, 1,
0.663395, 1.089309, -1.273564, 0.4941176, 0, 1, 1,
0.6668956, -0.520373, 1.669591, 0.5019608, 0, 1, 1,
0.6680754, -0.5627713, 1.90319, 0.5058824, 0, 1, 1,
0.672088, 0.1839819, 0.616111, 0.5137255, 0, 1, 1,
0.6741745, -0.306435, 0.7070002, 0.5176471, 0, 1, 1,
0.6745172, -0.6666068, 4.439029, 0.5254902, 0, 1, 1,
0.6749413, 0.6397136, 1.495846, 0.5294118, 0, 1, 1,
0.6838307, 0.1574711, 0.1780949, 0.5372549, 0, 1, 1,
0.6855919, 1.225942, -0.0962189, 0.5411765, 0, 1, 1,
0.6876857, 0.1582474, 1.307379, 0.5490196, 0, 1, 1,
0.691573, 1.055942, 1.748059, 0.5529412, 0, 1, 1,
0.6921355, 0.3960658, 0.262816, 0.5607843, 0, 1, 1,
0.6967874, -0.02926964, 2.026947, 0.5647059, 0, 1, 1,
0.7028438, -0.09715564, 2.465121, 0.572549, 0, 1, 1,
0.7031333, 0.9508078, 1.508041, 0.5764706, 0, 1, 1,
0.7040939, 2.804471, 2.298297, 0.5843138, 0, 1, 1,
0.7102284, -0.3054724, 2.018291, 0.5882353, 0, 1, 1,
0.7114342, 0.6096889, 1.020501, 0.5960785, 0, 1, 1,
0.7187802, 0.2759033, 1.649217, 0.6039216, 0, 1, 1,
0.7197159, -0.4206819, 1.841472, 0.6078432, 0, 1, 1,
0.7231786, 1.67567, 0.7383666, 0.6156863, 0, 1, 1,
0.7287595, 0.4688015, 0.8324018, 0.6196079, 0, 1, 1,
0.7299352, 0.3079407, 0.1791622, 0.627451, 0, 1, 1,
0.7347348, 0.1391776, 4.763361, 0.6313726, 0, 1, 1,
0.7405672, -1.106723, 0.3118508, 0.6392157, 0, 1, 1,
0.7456319, 1.423425, -0.5481058, 0.6431373, 0, 1, 1,
0.7501746, -0.3767554, 1.872776, 0.6509804, 0, 1, 1,
0.7506096, -0.6899492, 1.887253, 0.654902, 0, 1, 1,
0.7536805, -1.009957, 2.526781, 0.6627451, 0, 1, 1,
0.7564499, 0.6794514, 0.7916008, 0.6666667, 0, 1, 1,
0.7592192, -1.27431, 1.964536, 0.6745098, 0, 1, 1,
0.7621422, -1.477549, 2.979216, 0.6784314, 0, 1, 1,
0.7664388, 1.111509, 1.635407, 0.6862745, 0, 1, 1,
0.7689031, -0.9283629, 2.433558, 0.6901961, 0, 1, 1,
0.769003, -1.4326, 0.4724747, 0.6980392, 0, 1, 1,
0.7706171, -1.480827, 3.11073, 0.7058824, 0, 1, 1,
0.7738848, 0.08069609, 2.122001, 0.7098039, 0, 1, 1,
0.7756493, 1.071915, -0.406738, 0.7176471, 0, 1, 1,
0.776455, 0.3122119, 0.3882238, 0.7215686, 0, 1, 1,
0.7770807, 2.104994, 0.1026584, 0.7294118, 0, 1, 1,
0.780919, 0.2621431, 1.377041, 0.7333333, 0, 1, 1,
0.7818674, -0.1180365, 1.104455, 0.7411765, 0, 1, 1,
0.7824114, 0.7695595, 0.7259903, 0.7450981, 0, 1, 1,
0.7843045, -0.4293606, 1.796319, 0.7529412, 0, 1, 1,
0.7875243, 0.396943, 2.189312, 0.7568628, 0, 1, 1,
0.7898993, -0.2584113, 0.8680519, 0.7647059, 0, 1, 1,
0.7911472, -1.461491, 4.627459, 0.7686275, 0, 1, 1,
0.7922406, -0.06574266, 2.409963, 0.7764706, 0, 1, 1,
0.7930831, -1.092021, 2.70649, 0.7803922, 0, 1, 1,
0.794899, 0.5238556, 2.044512, 0.7882353, 0, 1, 1,
0.8049768, 0.9540136, 1.050746, 0.7921569, 0, 1, 1,
0.8057818, 1.380781, 1.7822, 0.8, 0, 1, 1,
0.812081, 0.1323652, 2.461679, 0.8078431, 0, 1, 1,
0.814172, 0.6172118, -0.146016, 0.8117647, 0, 1, 1,
0.8191991, -0.1662153, 1.055138, 0.8196079, 0, 1, 1,
0.8213354, -0.9285495, 1.769404, 0.8235294, 0, 1, 1,
0.8215657, -0.03331357, 1.496997, 0.8313726, 0, 1, 1,
0.8265066, 1.476958, -0.7159176, 0.8352941, 0, 1, 1,
0.8344681, 0.8723512, 2.169989, 0.8431373, 0, 1, 1,
0.8414672, -0.5604516, 1.754508, 0.8470588, 0, 1, 1,
0.8534158, 1.251278, -0.5787875, 0.854902, 0, 1, 1,
0.861201, 0.3588651, -0.6681955, 0.8588235, 0, 1, 1,
0.8656204, 0.8821943, -0.4627426, 0.8666667, 0, 1, 1,
0.8714048, -2.01695, 2.759516, 0.8705882, 0, 1, 1,
0.8752862, 0.4130337, 1.027515, 0.8784314, 0, 1, 1,
0.8759685, -0.1757877, 2.542147, 0.8823529, 0, 1, 1,
0.8786423, -0.05431505, -0.2328005, 0.8901961, 0, 1, 1,
0.8825572, -3.399123, 3.10698, 0.8941177, 0, 1, 1,
0.9010906, -0.4799055, 1.752099, 0.9019608, 0, 1, 1,
0.9022284, 2.56337, -0.2126011, 0.9098039, 0, 1, 1,
0.9055082, -0.3022085, 1.816887, 0.9137255, 0, 1, 1,
0.9058656, 1.729382, -0.5972124, 0.9215686, 0, 1, 1,
0.9069128, 1.877262, 0.977107, 0.9254902, 0, 1, 1,
0.9070153, -0.2962186, 2.498456, 0.9333333, 0, 1, 1,
0.9081731, 0.3370994, 1.598298, 0.9372549, 0, 1, 1,
0.9141427, -0.4343649, 1.174294, 0.945098, 0, 1, 1,
0.9155514, -0.7077665, 1.520824, 0.9490196, 0, 1, 1,
0.9187939, 0.544517, 1.583828, 0.9568627, 0, 1, 1,
0.9207774, -1.099625, 2.164981, 0.9607843, 0, 1, 1,
0.9357849, -0.193203, 2.9843, 0.9686275, 0, 1, 1,
0.9489767, -0.6211677, 1.349646, 0.972549, 0, 1, 1,
0.9582835, -0.6357711, 2.629081, 0.9803922, 0, 1, 1,
0.9603514, -0.2088326, 3.395512, 0.9843137, 0, 1, 1,
0.9609482, 1.226183, 0.6312692, 0.9921569, 0, 1, 1,
0.9639131, -0.28556, 0.641855, 0.9960784, 0, 1, 1,
0.9679112, 1.758265, -0.2873993, 1, 0, 0.9960784, 1,
0.969458, -0.7960982, 2.561578, 1, 0, 0.9882353, 1,
0.9756882, -0.01284342, 0.4359546, 1, 0, 0.9843137, 1,
0.9772225, -0.434288, 2.785102, 1, 0, 0.9764706, 1,
0.980812, 0.9182699, 0.1453809, 1, 0, 0.972549, 1,
0.9837382, 1.042499, -0.5580151, 1, 0, 0.9647059, 1,
0.9957363, -0.6009166, 2.7402, 1, 0, 0.9607843, 1,
0.9965874, 0.2625309, 2.312463, 1, 0, 0.9529412, 1,
0.9992817, 0.8659166, 2.128933, 1, 0, 0.9490196, 1,
1.002841, 1.162691, 0.2731862, 1, 0, 0.9411765, 1,
1.003711, 0.07299972, 1.482878, 1, 0, 0.9372549, 1,
1.006384, -0.6281833, 2.881826, 1, 0, 0.9294118, 1,
1.022645, -0.5279487, 2.474351, 1, 0, 0.9254902, 1,
1.024144, 0.611922, 0.817112, 1, 0, 0.9176471, 1,
1.035476, -0.6301734, 1.657837, 1, 0, 0.9137255, 1,
1.044816, -0.3284732, 0.7193013, 1, 0, 0.9058824, 1,
1.046521, 0.2680589, 1.862192, 1, 0, 0.9019608, 1,
1.051862, -0.5844893, 3.094807, 1, 0, 0.8941177, 1,
1.052901, -0.8536798, 3.49438, 1, 0, 0.8862745, 1,
1.058195, 2.375874, 0.8429481, 1, 0, 0.8823529, 1,
1.062124, 0.2938634, 3.047853, 1, 0, 0.8745098, 1,
1.089664, 0.4578544, -0.04823224, 1, 0, 0.8705882, 1,
1.092456, -0.1646468, -1.359655, 1, 0, 0.8627451, 1,
1.096815, 0.9802004, -0.9521516, 1, 0, 0.8588235, 1,
1.10304, 1.416013, 0.4770428, 1, 0, 0.8509804, 1,
1.108719, 0.1583114, 0.9502004, 1, 0, 0.8470588, 1,
1.111395, 0.2881986, 1.20638, 1, 0, 0.8392157, 1,
1.117597, -0.4692754, 3.876126, 1, 0, 0.8352941, 1,
1.121072, -0.585691, 3.045821, 1, 0, 0.827451, 1,
1.122113, -1.930269, 2.4717, 1, 0, 0.8235294, 1,
1.127255, -1.690009, 3.155375, 1, 0, 0.8156863, 1,
1.129329, 0.2163764, 0.2762089, 1, 0, 0.8117647, 1,
1.129784, 0.7942933, -0.3073881, 1, 0, 0.8039216, 1,
1.134072, 1.753117, 1.418567, 1, 0, 0.7960784, 1,
1.134474, 2.116775, 1.863774, 1, 0, 0.7921569, 1,
1.141179, -0.2436623, 2.364256, 1, 0, 0.7843137, 1,
1.151056, -0.174107, 3.873985, 1, 0, 0.7803922, 1,
1.153248, -0.2842901, 1.153774, 1, 0, 0.772549, 1,
1.156674, -0.7578843, 2.958483, 1, 0, 0.7686275, 1,
1.160578, -1.382492, 2.207566, 1, 0, 0.7607843, 1,
1.165786, 0.0006335446, -0.4832748, 1, 0, 0.7568628, 1,
1.173412, 0.04435471, 2.43462, 1, 0, 0.7490196, 1,
1.18421, -0.1974959, 1.572527, 1, 0, 0.7450981, 1,
1.18583, -0.001144199, 1.366139, 1, 0, 0.7372549, 1,
1.196298, -1.769567, 0.5415916, 1, 0, 0.7333333, 1,
1.200647, 0.5506209, 0.01474751, 1, 0, 0.7254902, 1,
1.201789, 2.552758, -1.074783, 1, 0, 0.7215686, 1,
1.205378, -0.651131, 2.915397, 1, 0, 0.7137255, 1,
1.208919, 0.05533034, 1.153402, 1, 0, 0.7098039, 1,
1.209401, 1.153432, 0.7528589, 1, 0, 0.7019608, 1,
1.220018, -1.644954, 1.255725, 1, 0, 0.6941177, 1,
1.243463, 0.4382161, 1.99443, 1, 0, 0.6901961, 1,
1.257567, 0.4770435, 0.8234413, 1, 0, 0.682353, 1,
1.261138, 0.3692044, 2.039724, 1, 0, 0.6784314, 1,
1.271264, 1.687166, 0.8726553, 1, 0, 0.6705883, 1,
1.273892, -1.094561, 3.246265, 1, 0, 0.6666667, 1,
1.283448, 1.128724, 0.1728868, 1, 0, 0.6588235, 1,
1.286685, -0.9644001, 1.913501, 1, 0, 0.654902, 1,
1.28897, 1.097617, 2.823317, 1, 0, 0.6470588, 1,
1.292377, -0.818635, 3.901031, 1, 0, 0.6431373, 1,
1.297294, -0.1217993, 0.7415355, 1, 0, 0.6352941, 1,
1.301255, 2.894797, 0.2465663, 1, 0, 0.6313726, 1,
1.322908, -1.269211, 2.82742, 1, 0, 0.6235294, 1,
1.324743, 0.5625905, 2.485316, 1, 0, 0.6196079, 1,
1.325211, 1.093726, 1.384355, 1, 0, 0.6117647, 1,
1.330419, 0.6152273, -2.101398, 1, 0, 0.6078432, 1,
1.345005, -0.6074596, 2.943407, 1, 0, 0.6, 1,
1.345773, -0.908103, 3.765253, 1, 0, 0.5921569, 1,
1.347157, -0.0005271366, -0.4822685, 1, 0, 0.5882353, 1,
1.358995, 1.33476, 0.6142269, 1, 0, 0.5803922, 1,
1.366439, -1.47727, 1.68901, 1, 0, 0.5764706, 1,
1.372902, 0.6508548, 1.399105, 1, 0, 0.5686275, 1,
1.383795, -0.7349042, 2.356394, 1, 0, 0.5647059, 1,
1.395445, -0.2929386, 2.024123, 1, 0, 0.5568628, 1,
1.396018, 0.7023222, 0.4824708, 1, 0, 0.5529412, 1,
1.396185, 2.465156, 0.3611154, 1, 0, 0.5450981, 1,
1.397911, -0.2425996, 3.239393, 1, 0, 0.5411765, 1,
1.40058, 0.2611028, 3.761547, 1, 0, 0.5333334, 1,
1.403741, 2.237236, -0.74499, 1, 0, 0.5294118, 1,
1.406492, 1.360222, 3.018301, 1, 0, 0.5215687, 1,
1.412247, 1.337907, 2.187173, 1, 0, 0.5176471, 1,
1.416269, 0.9503309, 0.7636642, 1, 0, 0.509804, 1,
1.417331, 0.620306, 1.843184, 1, 0, 0.5058824, 1,
1.424636, -0.5933738, 0.8962762, 1, 0, 0.4980392, 1,
1.42887, 1.247207, 1.1646, 1, 0, 0.4901961, 1,
1.430822, -0.7283599, 1.658021, 1, 0, 0.4862745, 1,
1.439822, -2.180968, 2.446284, 1, 0, 0.4784314, 1,
1.480899, -0.2353644, 1.93301, 1, 0, 0.4745098, 1,
1.489585, 1.251645, -0.3419734, 1, 0, 0.4666667, 1,
1.50094, -1.083928, 3.370924, 1, 0, 0.4627451, 1,
1.511753, 1.749315, 2.151541, 1, 0, 0.454902, 1,
1.52296, 1.307678, 1.545609, 1, 0, 0.4509804, 1,
1.529375, 0.4582467, 0.8859226, 1, 0, 0.4431373, 1,
1.529507, 0.5782865, 3.071483, 1, 0, 0.4392157, 1,
1.531877, 1.816657, 1.827501, 1, 0, 0.4313726, 1,
1.532539, 0.6187059, 2.302738, 1, 0, 0.427451, 1,
1.535852, 0.128018, 1.36243, 1, 0, 0.4196078, 1,
1.536619, 0.5091293, 3.297256, 1, 0, 0.4156863, 1,
1.547544, -0.4984102, 1.599526, 1, 0, 0.4078431, 1,
1.549794, 0.6230503, 0.451352, 1, 0, 0.4039216, 1,
1.558207, -1.267935, 0.3789375, 1, 0, 0.3960784, 1,
1.558806, -0.911535, 2.36633, 1, 0, 0.3882353, 1,
1.559991, 0.5008009, 1.519041, 1, 0, 0.3843137, 1,
1.560555, -0.4905182, 1.896706, 1, 0, 0.3764706, 1,
1.564199, -0.1864777, 1.88057, 1, 0, 0.372549, 1,
1.57432, -0.2018952, 1.468102, 1, 0, 0.3647059, 1,
1.588005, 0.01157436, 1.113188, 1, 0, 0.3607843, 1,
1.588609, 1.54179, 0.9688792, 1, 0, 0.3529412, 1,
1.592926, 0.5051215, -0.2229138, 1, 0, 0.3490196, 1,
1.612294, -0.02907918, 1.335016, 1, 0, 0.3411765, 1,
1.61573, -0.0144575, 2.432369, 1, 0, 0.3372549, 1,
1.636189, -0.3029005, 1.64397, 1, 0, 0.3294118, 1,
1.636217, 0.8143684, 0.5674357, 1, 0, 0.3254902, 1,
1.647727, 0.2277732, -0.9025273, 1, 0, 0.3176471, 1,
1.671347, -0.4535852, 2.172224, 1, 0, 0.3137255, 1,
1.672556, 0.4198129, 2.8977, 1, 0, 0.3058824, 1,
1.690254, 0.3605914, 1.304528, 1, 0, 0.2980392, 1,
1.696083, -0.6562535, 1.474623, 1, 0, 0.2941177, 1,
1.713585, 0.004875413, 0.7256513, 1, 0, 0.2862745, 1,
1.714044, -0.377589, 4.465037, 1, 0, 0.282353, 1,
1.730904, -1.946391, 1.448684, 1, 0, 0.2745098, 1,
1.73694, -0.8642862, 2.923094, 1, 0, 0.2705882, 1,
1.737837, 0.3210877, 2.059766, 1, 0, 0.2627451, 1,
1.755233, -0.1646346, 2.196788, 1, 0, 0.2588235, 1,
1.775003, 1.197384, 2.74377, 1, 0, 0.2509804, 1,
1.7874, 0.07137705, 2.335258, 1, 0, 0.2470588, 1,
1.793876, 0.9577386, 2.059409, 1, 0, 0.2392157, 1,
1.809559, 1.237687, 0.5374798, 1, 0, 0.2352941, 1,
1.825933, -2.894411, 2.955725, 1, 0, 0.227451, 1,
1.852984, -0.4705372, 3.211942, 1, 0, 0.2235294, 1,
1.868843, 0.3902124, 0.4829518, 1, 0, 0.2156863, 1,
1.882011, 0.2968041, 0.447973, 1, 0, 0.2117647, 1,
1.897775, 0.5892136, 1.247558, 1, 0, 0.2039216, 1,
1.919941, -0.9952578, 1.224972, 1, 0, 0.1960784, 1,
1.926087, 0.01457269, 0.7096437, 1, 0, 0.1921569, 1,
1.931726, -0.3446032, 1.758832, 1, 0, 0.1843137, 1,
1.933446, -0.04713382, 2.075053, 1, 0, 0.1803922, 1,
1.9497, -2.466368, 2.55304, 1, 0, 0.172549, 1,
1.973531, -0.2028851, 0.9165177, 1, 0, 0.1686275, 1,
1.995752, 0.06790385, 2.299731, 1, 0, 0.1607843, 1,
2.026893, 0.7935667, 0.8152422, 1, 0, 0.1568628, 1,
2.056936, -1.093249, 1.800391, 1, 0, 0.1490196, 1,
2.063043, -1.752657, 1.572533, 1, 0, 0.145098, 1,
2.065899, 1.344588, 1.552711, 1, 0, 0.1372549, 1,
2.146028, -0.9127027, 2.492982, 1, 0, 0.1333333, 1,
2.169686, -0.1794451, 1.318019, 1, 0, 0.1254902, 1,
2.170019, -0.4431982, 0.6463623, 1, 0, 0.1215686, 1,
2.184559, -0.3282676, 0.8455223, 1, 0, 0.1137255, 1,
2.235126, 0.03660059, 1.176114, 1, 0, 0.1098039, 1,
2.254769, -0.2337051, 0.6005423, 1, 0, 0.1019608, 1,
2.258007, -0.7679271, 3.031367, 1, 0, 0.09411765, 1,
2.27979, -0.8537809, 1.986938, 1, 0, 0.09019608, 1,
2.331544, -0.4946386, 1.617132, 1, 0, 0.08235294, 1,
2.441413, -1.319163, 1.180263, 1, 0, 0.07843138, 1,
2.446473, 2.137869, 0.8470175, 1, 0, 0.07058824, 1,
2.493932, 1.310815, -0.05604488, 1, 0, 0.06666667, 1,
2.502141, -0.08432532, 1.518916, 1, 0, 0.05882353, 1,
2.505908, -1.226953, 1.509844, 1, 0, 0.05490196, 1,
2.571622, 0.4306872, 3.375392, 1, 0, 0.04705882, 1,
2.581965, 0.1068391, 1.492363, 1, 0, 0.04313726, 1,
2.588144, -0.299957, 1.220372, 1, 0, 0.03529412, 1,
2.676178, -0.3034092, -0.7254591, 1, 0, 0.03137255, 1,
2.682124, -0.5137602, 0.7368824, 1, 0, 0.02352941, 1,
2.768129, 0.9508086, 0.5024941, 1, 0, 0.01960784, 1,
3.005516, -0.3570696, 1.317975, 1, 0, 0.01176471, 1,
3.020053, 0.2801132, 2.08025, 1, 0, 0.007843138, 1
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
-0.06745803, -4.483244, -6.562119, 0, -0.5, 0.5, 0.5,
-0.06745803, -4.483244, -6.562119, 1, -0.5, 0.5, 0.5,
-0.06745803, -4.483244, -6.562119, 1, 1.5, 0.5, 0.5,
-0.06745803, -4.483244, -6.562119, 0, 1.5, 0.5, 0.5
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
-4.201636, -0.2011244, -6.562119, 0, -0.5, 0.5, 0.5,
-4.201636, -0.2011244, -6.562119, 1, -0.5, 0.5, 0.5,
-4.201636, -0.2011244, -6.562119, 1, 1.5, 0.5, 0.5,
-4.201636, -0.2011244, -6.562119, 0, 1.5, 0.5, 0.5
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
-4.201636, -4.483244, -0.004644394, 0, -0.5, 0.5, 0.5,
-4.201636, -4.483244, -0.004644394, 1, -0.5, 0.5, 0.5,
-4.201636, -4.483244, -0.004644394, 1, 1.5, 0.5, 0.5,
-4.201636, -4.483244, -0.004644394, 0, 1.5, 0.5, 0.5
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
-3, -3.495063, -5.048855,
3, -3.495063, -5.048855,
-3, -3.495063, -5.048855,
-3, -3.65976, -5.301066,
-2, -3.495063, -5.048855,
-2, -3.65976, -5.301066,
-1, -3.495063, -5.048855,
-1, -3.65976, -5.301066,
0, -3.495063, -5.048855,
0, -3.65976, -5.301066,
1, -3.495063, -5.048855,
1, -3.65976, -5.301066,
2, -3.495063, -5.048855,
2, -3.65976, -5.301066,
3, -3.495063, -5.048855,
3, -3.65976, -5.301066
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
-3, -3.989153, -5.805487, 0, -0.5, 0.5, 0.5,
-3, -3.989153, -5.805487, 1, -0.5, 0.5, 0.5,
-3, -3.989153, -5.805487, 1, 1.5, 0.5, 0.5,
-3, -3.989153, -5.805487, 0, 1.5, 0.5, 0.5,
-2, -3.989153, -5.805487, 0, -0.5, 0.5, 0.5,
-2, -3.989153, -5.805487, 1, -0.5, 0.5, 0.5,
-2, -3.989153, -5.805487, 1, 1.5, 0.5, 0.5,
-2, -3.989153, -5.805487, 0, 1.5, 0.5, 0.5,
-1, -3.989153, -5.805487, 0, -0.5, 0.5, 0.5,
-1, -3.989153, -5.805487, 1, -0.5, 0.5, 0.5,
-1, -3.989153, -5.805487, 1, 1.5, 0.5, 0.5,
-1, -3.989153, -5.805487, 0, 1.5, 0.5, 0.5,
0, -3.989153, -5.805487, 0, -0.5, 0.5, 0.5,
0, -3.989153, -5.805487, 1, -0.5, 0.5, 0.5,
0, -3.989153, -5.805487, 1, 1.5, 0.5, 0.5,
0, -3.989153, -5.805487, 0, 1.5, 0.5, 0.5,
1, -3.989153, -5.805487, 0, -0.5, 0.5, 0.5,
1, -3.989153, -5.805487, 1, -0.5, 0.5, 0.5,
1, -3.989153, -5.805487, 1, 1.5, 0.5, 0.5,
1, -3.989153, -5.805487, 0, 1.5, 0.5, 0.5,
2, -3.989153, -5.805487, 0, -0.5, 0.5, 0.5,
2, -3.989153, -5.805487, 1, -0.5, 0.5, 0.5,
2, -3.989153, -5.805487, 1, 1.5, 0.5, 0.5,
2, -3.989153, -5.805487, 0, 1.5, 0.5, 0.5,
3, -3.989153, -5.805487, 0, -0.5, 0.5, 0.5,
3, -3.989153, -5.805487, 1, -0.5, 0.5, 0.5,
3, -3.989153, -5.805487, 1, 1.5, 0.5, 0.5,
3, -3.989153, -5.805487, 0, 1.5, 0.5, 0.5
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
-3.247595, -3, -5.048855,
-3.247595, 2, -5.048855,
-3.247595, -3, -5.048855,
-3.406602, -3, -5.301066,
-3.247595, -2, -5.048855,
-3.406602, -2, -5.301066,
-3.247595, -1, -5.048855,
-3.406602, -1, -5.301066,
-3.247595, 0, -5.048855,
-3.406602, 0, -5.301066,
-3.247595, 1, -5.048855,
-3.406602, 1, -5.301066,
-3.247595, 2, -5.048855,
-3.406602, 2, -5.301066
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
-3.724615, -3, -5.805487, 0, -0.5, 0.5, 0.5,
-3.724615, -3, -5.805487, 1, -0.5, 0.5, 0.5,
-3.724615, -3, -5.805487, 1, 1.5, 0.5, 0.5,
-3.724615, -3, -5.805487, 0, 1.5, 0.5, 0.5,
-3.724615, -2, -5.805487, 0, -0.5, 0.5, 0.5,
-3.724615, -2, -5.805487, 1, -0.5, 0.5, 0.5,
-3.724615, -2, -5.805487, 1, 1.5, 0.5, 0.5,
-3.724615, -2, -5.805487, 0, 1.5, 0.5, 0.5,
-3.724615, -1, -5.805487, 0, -0.5, 0.5, 0.5,
-3.724615, -1, -5.805487, 1, -0.5, 0.5, 0.5,
-3.724615, -1, -5.805487, 1, 1.5, 0.5, 0.5,
-3.724615, -1, -5.805487, 0, 1.5, 0.5, 0.5,
-3.724615, 0, -5.805487, 0, -0.5, 0.5, 0.5,
-3.724615, 0, -5.805487, 1, -0.5, 0.5, 0.5,
-3.724615, 0, -5.805487, 1, 1.5, 0.5, 0.5,
-3.724615, 0, -5.805487, 0, 1.5, 0.5, 0.5,
-3.724615, 1, -5.805487, 0, -0.5, 0.5, 0.5,
-3.724615, 1, -5.805487, 1, -0.5, 0.5, 0.5,
-3.724615, 1, -5.805487, 1, 1.5, 0.5, 0.5,
-3.724615, 1, -5.805487, 0, 1.5, 0.5, 0.5,
-3.724615, 2, -5.805487, 0, -0.5, 0.5, 0.5,
-3.724615, 2, -5.805487, 1, -0.5, 0.5, 0.5,
-3.724615, 2, -5.805487, 1, 1.5, 0.5, 0.5,
-3.724615, 2, -5.805487, 0, 1.5, 0.5, 0.5
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
-3.247595, -3.495063, -4,
-3.247595, -3.495063, 4,
-3.247595, -3.495063, -4,
-3.406602, -3.65976, -4,
-3.247595, -3.495063, -2,
-3.406602, -3.65976, -2,
-3.247595, -3.495063, 0,
-3.406602, -3.65976, 0,
-3.247595, -3.495063, 2,
-3.406602, -3.65976, 2,
-3.247595, -3.495063, 4,
-3.406602, -3.65976, 4
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
-3.724615, -3.989153, -4, 0, -0.5, 0.5, 0.5,
-3.724615, -3.989153, -4, 1, -0.5, 0.5, 0.5,
-3.724615, -3.989153, -4, 1, 1.5, 0.5, 0.5,
-3.724615, -3.989153, -4, 0, 1.5, 0.5, 0.5,
-3.724615, -3.989153, -2, 0, -0.5, 0.5, 0.5,
-3.724615, -3.989153, -2, 1, -0.5, 0.5, 0.5,
-3.724615, -3.989153, -2, 1, 1.5, 0.5, 0.5,
-3.724615, -3.989153, -2, 0, 1.5, 0.5, 0.5,
-3.724615, -3.989153, 0, 0, -0.5, 0.5, 0.5,
-3.724615, -3.989153, 0, 1, -0.5, 0.5, 0.5,
-3.724615, -3.989153, 0, 1, 1.5, 0.5, 0.5,
-3.724615, -3.989153, 0, 0, 1.5, 0.5, 0.5,
-3.724615, -3.989153, 2, 0, -0.5, 0.5, 0.5,
-3.724615, -3.989153, 2, 1, -0.5, 0.5, 0.5,
-3.724615, -3.989153, 2, 1, 1.5, 0.5, 0.5,
-3.724615, -3.989153, 2, 0, 1.5, 0.5, 0.5,
-3.724615, -3.989153, 4, 0, -0.5, 0.5, 0.5,
-3.724615, -3.989153, 4, 1, -0.5, 0.5, 0.5,
-3.724615, -3.989153, 4, 1, 1.5, 0.5, 0.5,
-3.724615, -3.989153, 4, 0, 1.5, 0.5, 0.5
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
-3.247595, -3.495063, -5.048855,
-3.247595, 3.092814, -5.048855,
-3.247595, -3.495063, 5.039567,
-3.247595, 3.092814, 5.039567,
-3.247595, -3.495063, -5.048855,
-3.247595, -3.495063, 5.039567,
-3.247595, 3.092814, -5.048855,
-3.247595, 3.092814, 5.039567,
-3.247595, -3.495063, -5.048855,
3.112679, -3.495063, -5.048855,
-3.247595, -3.495063, 5.039567,
3.112679, -3.495063, 5.039567,
-3.247595, 3.092814, -5.048855,
3.112679, 3.092814, -5.048855,
-3.247595, 3.092814, 5.039567,
3.112679, 3.092814, 5.039567,
3.112679, -3.495063, -5.048855,
3.112679, 3.092814, -5.048855,
3.112679, -3.495063, 5.039567,
3.112679, 3.092814, 5.039567,
3.112679, -3.495063, -5.048855,
3.112679, -3.495063, 5.039567,
3.112679, 3.092814, -5.048855,
3.112679, 3.092814, 5.039567
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
var radius = 7.275267;
var distance = 32.36848;
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
mvMatrix.translate( 0.06745803, 0.2011244, 0.004644394 );
mvMatrix.scale( 1.236765, 1.194036, 0.7797216 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.36848);
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
tralkoxydim<-read.table("tralkoxydim.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-tralkoxydim$V2
```

```
## Error in eval(expr, envir, enclos): object 'tralkoxydim' not found
```

```r
y<-tralkoxydim$V3
```

```
## Error in eval(expr, envir, enclos): object 'tralkoxydim' not found
```

```r
z<-tralkoxydim$V4
```

```
## Error in eval(expr, envir, enclos): object 'tralkoxydim' not found
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
-3.154969, 0.9705493, -0.5872175, 0, 0, 1, 1, 1,
-2.910389, 0.9589594, -0.7857721, 1, 0, 0, 1, 1,
-2.608673, -0.8361583, -2.369263, 1, 0, 0, 1, 1,
-2.563493, 2.713612, -1.366128, 1, 0, 0, 1, 1,
-2.483739, -0.110802, -0.2748863, 1, 0, 0, 1, 1,
-2.299459, 0.8106392, -0.8079559, 1, 0, 0, 1, 1,
-2.295437, -0.8308948, -0.1107571, 0, 0, 0, 1, 1,
-2.251406, 0.3766896, -2.300222, 0, 0, 0, 1, 1,
-2.229535, -2.319694, -1.16674, 0, 0, 0, 1, 1,
-2.200633, -1.930505, -3.544158, 0, 0, 0, 1, 1,
-2.199093, 1.762542, -0.2809344, 0, 0, 0, 1, 1,
-2.196323, 1.18047, -1.531493, 0, 0, 0, 1, 1,
-2.180696, -0.5029493, -1.761223, 0, 0, 0, 1, 1,
-2.153103, -0.1327252, -1.213993, 1, 1, 1, 1, 1,
-2.107531, -0.331871, -2.419413, 1, 1, 1, 1, 1,
-2.098237, 1.186416, -1.318401, 1, 1, 1, 1, 1,
-2.094925, -0.04885606, -2.176471, 1, 1, 1, 1, 1,
-2.070439, -0.2158403, -2.826351, 1, 1, 1, 1, 1,
-2.051777, 1.304593, -0.2819209, 1, 1, 1, 1, 1,
-2.035733, -0.723426, -1.663541, 1, 1, 1, 1, 1,
-1.988055, 0.4387579, -2.736636, 1, 1, 1, 1, 1,
-1.970854, 0.9770483, -2.860746, 1, 1, 1, 1, 1,
-1.951597, -0.7079254, -2.334899, 1, 1, 1, 1, 1,
-1.940527, -0.3266035, -2.329427, 1, 1, 1, 1, 1,
-1.858374, 0.4746756, -2.047425, 1, 1, 1, 1, 1,
-1.84779, 0.5429479, -3.562104, 1, 1, 1, 1, 1,
-1.834803, 0.7963574, -2.364601, 1, 1, 1, 1, 1,
-1.800882, -0.2491835, -0.9939291, 1, 1, 1, 1, 1,
-1.799058, -0.6636132, -3.519114, 0, 0, 1, 1, 1,
-1.797955, -0.5155469, -3.433075, 1, 0, 0, 1, 1,
-1.795221, -1.068414, -2.613381, 1, 0, 0, 1, 1,
-1.792509, 0.1912357, -0.6255918, 1, 0, 0, 1, 1,
-1.775869, 1.577536, -1.268394, 1, 0, 0, 1, 1,
-1.775101, -0.9394007, -4.017715, 1, 0, 0, 1, 1,
-1.770508, -0.519129, -3.157605, 0, 0, 0, 1, 1,
-1.769467, -0.1326401, -0.3228303, 0, 0, 0, 1, 1,
-1.74742, -0.7607074, -1.790559, 0, 0, 0, 1, 1,
-1.72907, 0.3629366, -1.333178, 0, 0, 0, 1, 1,
-1.722527, -0.2389792, -2.346947, 0, 0, 0, 1, 1,
-1.716726, 0.8938386, -2.879048, 0, 0, 0, 1, 1,
-1.714643, -1.676025, -2.134039, 0, 0, 0, 1, 1,
-1.683892, -2.608096, -2.163764, 1, 1, 1, 1, 1,
-1.672645, -0.3329815, -1.94533, 1, 1, 1, 1, 1,
-1.66792, -0.6248246, -1.353922, 1, 1, 1, 1, 1,
-1.652063, -0.3251902, -1.357832, 1, 1, 1, 1, 1,
-1.648376, -0.07046541, -1.493298, 1, 1, 1, 1, 1,
-1.640272, 0.7369503, -1.700675, 1, 1, 1, 1, 1,
-1.608383, -0.4524033, -1.459732, 1, 1, 1, 1, 1,
-1.605518, 0.393527, -0.6273113, 1, 1, 1, 1, 1,
-1.597996, -1.425877, -1.317578, 1, 1, 1, 1, 1,
-1.596957, 1.30462, -2.522625, 1, 1, 1, 1, 1,
-1.581812, -1.642089, -2.554399, 1, 1, 1, 1, 1,
-1.57952, -0.6041102, -3.413411, 1, 1, 1, 1, 1,
-1.574571, -0.03835059, -3.673449, 1, 1, 1, 1, 1,
-1.564585, 0.6386703, -0.9090408, 1, 1, 1, 1, 1,
-1.562028, 1.187919, 0.7878931, 1, 1, 1, 1, 1,
-1.56186, -0.4633682, -1.4294, 0, 0, 1, 1, 1,
-1.560225, -1.296836, -2.140205, 1, 0, 0, 1, 1,
-1.531757, -0.8560592, -1.056465, 1, 0, 0, 1, 1,
-1.531432, -0.7587714, -1.962779, 1, 0, 0, 1, 1,
-1.510078, 0.401691, -2.234364, 1, 0, 0, 1, 1,
-1.507778, -0.2214403, -0.8219336, 1, 0, 0, 1, 1,
-1.498649, -0.6396221, -3.305079, 0, 0, 0, 1, 1,
-1.488319, -1.070782, -3.065065, 0, 0, 0, 1, 1,
-1.465706, -0.8408812, -1.580312, 0, 0, 0, 1, 1,
-1.464471, -0.8588017, -1.447934, 0, 0, 0, 1, 1,
-1.46295, -0.4033961, -3.046464, 0, 0, 0, 1, 1,
-1.462908, 0.1618805, -1.928278, 0, 0, 0, 1, 1,
-1.45833, -0.2226706, -1.360159, 0, 0, 0, 1, 1,
-1.454327, 0.9204981, -1.730248, 1, 1, 1, 1, 1,
-1.447759, 0.01848427, -0.946762, 1, 1, 1, 1, 1,
-1.447139, -0.9099903, -2.582312, 1, 1, 1, 1, 1,
-1.433646, 1.470264, -1.597436, 1, 1, 1, 1, 1,
-1.416783, 0.4087352, 0.2254763, 1, 1, 1, 1, 1,
-1.415085, 0.4370995, -1.571014, 1, 1, 1, 1, 1,
-1.408229, -0.4185136, -1.772438, 1, 1, 1, 1, 1,
-1.407311, -1.210478, -2.488372, 1, 1, 1, 1, 1,
-1.401615, 0.7637124, -2.385163, 1, 1, 1, 1, 1,
-1.400776, 1.213672, -1.475576, 1, 1, 1, 1, 1,
-1.400123, -0.2996789, -2.012595, 1, 1, 1, 1, 1,
-1.398944, 0.9230363, -1.601861, 1, 1, 1, 1, 1,
-1.397802, -1.607231, -1.679868, 1, 1, 1, 1, 1,
-1.397173, -0.5339188, -2.789968, 1, 1, 1, 1, 1,
-1.39369, 0.4839681, -2.375689, 1, 1, 1, 1, 1,
-1.392111, 0.2170426, -2.218757, 0, 0, 1, 1, 1,
-1.389657, -0.7891599, -1.342144, 1, 0, 0, 1, 1,
-1.377794, -0.6301237, -2.418286, 1, 0, 0, 1, 1,
-1.375456, -0.1884613, -2.490995, 1, 0, 0, 1, 1,
-1.374998, 0.9408339, -1.083369, 1, 0, 0, 1, 1,
-1.372899, 0.5304407, -2.305622, 1, 0, 0, 1, 1,
-1.368944, -0.7817134, -1.73221, 0, 0, 0, 1, 1,
-1.362473, 0.2566306, -2.270661, 0, 0, 0, 1, 1,
-1.357078, -0.2988724, -0.7710113, 0, 0, 0, 1, 1,
-1.348433, -0.4015853, -2.306641, 0, 0, 0, 1, 1,
-1.345699, 0.959639, -1.966133, 0, 0, 0, 1, 1,
-1.343208, -1.767865, -2.754251, 0, 0, 0, 1, 1,
-1.321069, -0.7825218, -1.9668, 0, 0, 0, 1, 1,
-1.320231, 0.7042828, 0.2362432, 1, 1, 1, 1, 1,
-1.310927, 1.300959, -2.271355, 1, 1, 1, 1, 1,
-1.302281, 1.583117, -0.3758996, 1, 1, 1, 1, 1,
-1.300095, 0.335914, -0.8548557, 1, 1, 1, 1, 1,
-1.282155, -0.438862, -2.156818, 1, 1, 1, 1, 1,
-1.271178, -0.3042459, -1.175596, 1, 1, 1, 1, 1,
-1.269984, -0.6760575, -1.782577, 1, 1, 1, 1, 1,
-1.269906, -0.2428588, -2.758162, 1, 1, 1, 1, 1,
-1.267109, 0.792909, -1.151538, 1, 1, 1, 1, 1,
-1.264417, -0.4807732, -1.461684, 1, 1, 1, 1, 1,
-1.263081, -0.08485556, -0.07403363, 1, 1, 1, 1, 1,
-1.254614, 0.7114073, -2.108115, 1, 1, 1, 1, 1,
-1.251998, 0.04944476, -0.005284588, 1, 1, 1, 1, 1,
-1.239316, 0.1114417, -1.455239, 1, 1, 1, 1, 1,
-1.236727, 1.062639, -1.363381, 1, 1, 1, 1, 1,
-1.229011, -0.2776898, -1.363803, 0, 0, 1, 1, 1,
-1.225603, 0.5152994, -3.786915, 1, 0, 0, 1, 1,
-1.225467, 0.2317296, -1.067509, 1, 0, 0, 1, 1,
-1.220437, -0.288695, -0.5513674, 1, 0, 0, 1, 1,
-1.217599, 1.176554, -0.199815, 1, 0, 0, 1, 1,
-1.217499, -0.3983642, -2.355989, 1, 0, 0, 1, 1,
-1.21551, -1.335322, -1.754099, 0, 0, 0, 1, 1,
-1.212288, 1.638196, 1.289759, 0, 0, 0, 1, 1,
-1.186669, -0.6730649, -3.078771, 0, 0, 0, 1, 1,
-1.185804, 0.2229524, -0.7653651, 0, 0, 0, 1, 1,
-1.176217, 1.180702, 0.09287908, 0, 0, 0, 1, 1,
-1.175723, 0.2732434, -2.388908, 0, 0, 0, 1, 1,
-1.168864, 2.331225, -0.3339911, 0, 0, 0, 1, 1,
-1.16773, 1.122959, -0.307245, 1, 1, 1, 1, 1,
-1.152541, -1.879985, -4.027907, 1, 1, 1, 1, 1,
-1.151789, 1.137587, -0.2548243, 1, 1, 1, 1, 1,
-1.151098, -0.3031037, -2.579921, 1, 1, 1, 1, 1,
-1.150105, 0.1759284, -1.446133, 1, 1, 1, 1, 1,
-1.141681, 0.6674575, -1.785065, 1, 1, 1, 1, 1,
-1.138859, 0.4065012, -1.261697, 1, 1, 1, 1, 1,
-1.137163, -0.769411, 0.2915887, 1, 1, 1, 1, 1,
-1.132997, 0.1653215, -1.647951, 1, 1, 1, 1, 1,
-1.127305, 0.8264573, -1.207027, 1, 1, 1, 1, 1,
-1.122374, -1.224397, -1.794675, 1, 1, 1, 1, 1,
-1.114007, 0.4924424, -1.203331, 1, 1, 1, 1, 1,
-1.111537, -0.6405726, -0.2075131, 1, 1, 1, 1, 1,
-1.111155, -1.653466, -3.83907, 1, 1, 1, 1, 1,
-1.107903, -0.4655707, -0.3662221, 1, 1, 1, 1, 1,
-1.10744, 1.409763, 1.071809, 0, 0, 1, 1, 1,
-1.106159, -0.4481654, -1.751862, 1, 0, 0, 1, 1,
-1.101512, -0.7620425, -2.238482, 1, 0, 0, 1, 1,
-1.099792, 0.1047903, -0.8887956, 1, 0, 0, 1, 1,
-1.089195, -2.296187, -1.358033, 1, 0, 0, 1, 1,
-1.087551, 0.1935218, -1.087675, 1, 0, 0, 1, 1,
-1.084753, -0.801732, -0.4487436, 0, 0, 0, 1, 1,
-1.081298, -0.454331, -1.875395, 0, 0, 0, 1, 1,
-1.07414, -0.5142823, -1.560485, 0, 0, 0, 1, 1,
-1.072326, -0.3925705, -2.003335, 0, 0, 0, 1, 1,
-1.071585, 0.1925132, -0.1768894, 0, 0, 0, 1, 1,
-1.067864, -1.040197, -3.9207, 0, 0, 0, 1, 1,
-1.063977, -2.039875, -4.02797, 0, 0, 0, 1, 1,
-1.05692, -0.0727252, -2.129877, 1, 1, 1, 1, 1,
-1.048903, -0.5545782, -2.856591, 1, 1, 1, 1, 1,
-1.048735, -0.6257411, -2.499445, 1, 1, 1, 1, 1,
-1.04681, 0.7802476, -0.4510848, 1, 1, 1, 1, 1,
-1.045685, 0.7695337, -1.324895, 1, 1, 1, 1, 1,
-1.043092, -0.4178616, -3.01018, 1, 1, 1, 1, 1,
-1.042406, -0.1314029, -1.71294, 1, 1, 1, 1, 1,
-1.039211, -0.2496055, -2.269977, 1, 1, 1, 1, 1,
-1.035678, 0.2700053, -1.360615, 1, 1, 1, 1, 1,
-1.0326, -1.047407, -3.275261, 1, 1, 1, 1, 1,
-1.029246, 1.98436, -2.354599, 1, 1, 1, 1, 1,
-1.022952, -0.5888923, -2.375748, 1, 1, 1, 1, 1,
-1.022539, -0.7707098, -2.815616, 1, 1, 1, 1, 1,
-1.020621, 1.106961, -1.79577, 1, 1, 1, 1, 1,
-1.016694, 1.166833, -0.7003305, 1, 1, 1, 1, 1,
-1.016122, 0.1948185, -1.280096, 0, 0, 1, 1, 1,
-1.008832, 0.2074342, -0.7407483, 1, 0, 0, 1, 1,
-1.006328, 0.9538975, -2.062951, 1, 0, 0, 1, 1,
-1.003555, 0.9224188, -1.599288, 1, 0, 0, 1, 1,
-1.002452, -0.3180306, -2.528782, 1, 0, 0, 1, 1,
-0.9989915, 0.8394009, -0.01186877, 1, 0, 0, 1, 1,
-0.993444, -1.259386, -4.381223, 0, 0, 0, 1, 1,
-0.9920295, -0.5219956, -1.922787, 0, 0, 0, 1, 1,
-0.9709986, 1.15384, 0.1199029, 0, 0, 0, 1, 1,
-0.9642953, -1.538633, -2.365634, 0, 0, 0, 1, 1,
-0.961639, 1.145083, -1.114827, 0, 0, 0, 1, 1,
-0.9583219, 0.5744961, 0.4963321, 0, 0, 0, 1, 1,
-0.9570603, 1.196713, 0.1778383, 0, 0, 0, 1, 1,
-0.9554898, 1.379303, 1.587532, 1, 1, 1, 1, 1,
-0.9541311, 1.031304, 0.8006918, 1, 1, 1, 1, 1,
-0.9508992, -1.096163, -2.875134, 1, 1, 1, 1, 1,
-0.9400331, -2.04744, -4.613552, 1, 1, 1, 1, 1,
-0.9246235, -0.4467641, -2.198818, 1, 1, 1, 1, 1,
-0.9244406, -2.642608, -2.127468, 1, 1, 1, 1, 1,
-0.9229357, -0.2338896, -2.155644, 1, 1, 1, 1, 1,
-0.921124, 0.7551293, -1.103056, 1, 1, 1, 1, 1,
-0.9167128, -0.2833972, -2.178731, 1, 1, 1, 1, 1,
-0.9165567, 0.9709735, -0.5801746, 1, 1, 1, 1, 1,
-0.9146485, -0.3431594, -3.855824, 1, 1, 1, 1, 1,
-0.9092396, 0.8775201, -0.4925955, 1, 1, 1, 1, 1,
-0.9085969, -0.9236024, -3.244583, 1, 1, 1, 1, 1,
-0.9070681, -1.617936, -1.974106, 1, 1, 1, 1, 1,
-0.9055056, 0.9256643, -1.781933, 1, 1, 1, 1, 1,
-0.8957895, 0.7997414, -0.7622684, 0, 0, 1, 1, 1,
-0.8942726, -0.03099296, -1.819535, 1, 0, 0, 1, 1,
-0.8906136, -0.4061648, -1.040711, 1, 0, 0, 1, 1,
-0.8895092, -0.2650374, -1.631085, 1, 0, 0, 1, 1,
-0.8849069, -0.2182403, -1.94039, 1, 0, 0, 1, 1,
-0.8832634, 0.4396575, -0.4859109, 1, 0, 0, 1, 1,
-0.8797042, -0.1994425, -1.709781, 0, 0, 0, 1, 1,
-0.8752754, 0.6552736, -0.8794608, 0, 0, 0, 1, 1,
-0.8711792, -1.222548, -3.042444, 0, 0, 0, 1, 1,
-0.8648934, -2.27533, -2.701954, 0, 0, 0, 1, 1,
-0.8523594, 0.1210101, -1.074565, 0, 0, 0, 1, 1,
-0.8324924, 0.07980245, -1.429597, 0, 0, 0, 1, 1,
-0.8274405, -0.2938255, 0.8280488, 0, 0, 0, 1, 1,
-0.824264, -0.3128905, -2.494163, 1, 1, 1, 1, 1,
-0.8181997, 0.7213017, -2.520446, 1, 1, 1, 1, 1,
-0.8125383, 0.7027882, -1.4248, 1, 1, 1, 1, 1,
-0.8113523, -0.2821577, -1.198804, 1, 1, 1, 1, 1,
-0.8099468, -1.979003, -3.887836, 1, 1, 1, 1, 1,
-0.7987854, -0.9171004, -4.662585, 1, 1, 1, 1, 1,
-0.7967802, 1.719169, -0.6480706, 1, 1, 1, 1, 1,
-0.7951574, 0.5579624, -1.361012, 1, 1, 1, 1, 1,
-0.792249, 1.227233, 0.9852934, 1, 1, 1, 1, 1,
-0.7746758, 0.306869, -1.831978, 1, 1, 1, 1, 1,
-0.771322, 0.2977411, -0.9505219, 1, 1, 1, 1, 1,
-0.7657828, 0.3963179, -0.7545004, 1, 1, 1, 1, 1,
-0.765235, -0.5381767, -2.098453, 1, 1, 1, 1, 1,
-0.7589085, 0.1602725, -2.594145, 1, 1, 1, 1, 1,
-0.7563442, 2.492193, 0.2582988, 1, 1, 1, 1, 1,
-0.7475224, 2.775767, 0.1993819, 0, 0, 1, 1, 1,
-0.7459627, 0.6170896, -2.863279, 1, 0, 0, 1, 1,
-0.7447345, 1.292158, -0.3517954, 1, 0, 0, 1, 1,
-0.7435867, -0.327936, -2.058364, 1, 0, 0, 1, 1,
-0.7424707, -0.4956524, -2.607626, 1, 0, 0, 1, 1,
-0.7396182, 0.06742622, 0.1656001, 1, 0, 0, 1, 1,
-0.7369284, 0.4413646, -1.280114, 0, 0, 0, 1, 1,
-0.7363275, -1.040543, -2.955199, 0, 0, 0, 1, 1,
-0.7298985, 2.484211, -0.9631377, 0, 0, 0, 1, 1,
-0.7284927, 1.02675, 0.6286838, 0, 0, 0, 1, 1,
-0.7276606, 0.5854244, -1.925818, 0, 0, 0, 1, 1,
-0.7223688, -0.2856592, -2.870125, 0, 0, 0, 1, 1,
-0.7077968, 1.376917, 0.1141422, 0, 0, 0, 1, 1,
-0.7066481, 0.623826, -0.2342224, 1, 1, 1, 1, 1,
-0.702274, 1.235972, -0.6586676, 1, 1, 1, 1, 1,
-0.6969408, -1.88581, -4.26372, 1, 1, 1, 1, 1,
-0.696201, 0.812253, -0.3883499, 1, 1, 1, 1, 1,
-0.6960487, 1.373029, -0.8553285, 1, 1, 1, 1, 1,
-0.6927691, 0.890202, -1.056062, 1, 1, 1, 1, 1,
-0.6837522, 0.2466749, -0.7471428, 1, 1, 1, 1, 1,
-0.6790817, -1.012979, -1.956064, 1, 1, 1, 1, 1,
-0.668424, 0.6442482, -1.942338, 1, 1, 1, 1, 1,
-0.6651043, 0.6661071, -2.515037, 1, 1, 1, 1, 1,
-0.6614536, 1.464188, -1.126875, 1, 1, 1, 1, 1,
-0.6599058, 0.2850589, 0.04152978, 1, 1, 1, 1, 1,
-0.6591068, 2.102685, 0.3920393, 1, 1, 1, 1, 1,
-0.6581779, 1.525577, -0.2269297, 1, 1, 1, 1, 1,
-0.6545074, -1.376093, -1.858748, 1, 1, 1, 1, 1,
-0.6535407, 1.583139, -1.364541, 0, 0, 1, 1, 1,
-0.6408457, 0.733004, -1.825998, 1, 0, 0, 1, 1,
-0.635909, 0.9365014, -0.8649353, 1, 0, 0, 1, 1,
-0.634531, 1.223473, -0.863911, 1, 0, 0, 1, 1,
-0.6327845, 0.2463636, -1.858686, 1, 0, 0, 1, 1,
-0.6239353, 0.7612206, -1.531093, 1, 0, 0, 1, 1,
-0.6217813, 1.837077, 0.7242602, 0, 0, 0, 1, 1,
-0.6192672, -0.02607715, -3.071896, 0, 0, 0, 1, 1,
-0.6186534, 1.47244, -1.638052, 0, 0, 0, 1, 1,
-0.6110561, 0.1975712, -0.3396961, 0, 0, 0, 1, 1,
-0.6102358, -0.8105662, -2.39706, 0, 0, 0, 1, 1,
-0.6072301, -0.3115747, -1.850387, 0, 0, 0, 1, 1,
-0.601954, -1.153232, -3.447994, 0, 0, 0, 1, 1,
-0.5988095, -1.320916, -0.9546917, 1, 1, 1, 1, 1,
-0.5909057, 1.960266, 0.3230917, 1, 1, 1, 1, 1,
-0.5898579, 2.022831, -0.5761387, 1, 1, 1, 1, 1,
-0.589245, 0.6836926, 0.04592261, 1, 1, 1, 1, 1,
-0.5873345, 0.8562859, -1.584193, 1, 1, 1, 1, 1,
-0.5828833, -0.7830285, -2.746873, 1, 1, 1, 1, 1,
-0.5810044, 1.631487, -0.1536192, 1, 1, 1, 1, 1,
-0.5797704, 0.9369125, -0.187542, 1, 1, 1, 1, 1,
-0.5771574, -0.821323, -3.689746, 1, 1, 1, 1, 1,
-0.57469, -0.04672083, 0.6928697, 1, 1, 1, 1, 1,
-0.5741155, 1.397889, -0.2075227, 1, 1, 1, 1, 1,
-0.5712124, -0.333256, -2.675848, 1, 1, 1, 1, 1,
-0.5689524, 0.4258584, -2.177955, 1, 1, 1, 1, 1,
-0.5663612, 2.302353, -0.4776556, 1, 1, 1, 1, 1,
-0.5658038, -0.2855505, -2.62932, 1, 1, 1, 1, 1,
-0.5652944, -0.5179842, -2.117393, 0, 0, 1, 1, 1,
-0.564968, 0.6005678, 0.1263073, 1, 0, 0, 1, 1,
-0.5609775, 1.018622, -0.8853113, 1, 0, 0, 1, 1,
-0.5587357, -0.851777, -4.423355, 1, 0, 0, 1, 1,
-0.5565964, 0.291171, 0.5319026, 1, 0, 0, 1, 1,
-0.5544943, -0.8934145, -3.627433, 1, 0, 0, 1, 1,
-0.5520619, -1.881698, -2.256357, 0, 0, 0, 1, 1,
-0.5490224, -0.4128962, -3.38386, 0, 0, 0, 1, 1,
-0.548665, -0.3665659, -2.9489, 0, 0, 0, 1, 1,
-0.5477421, 0.5814092, -1.774938, 0, 0, 0, 1, 1,
-0.5454273, -1.706645, -3.800584, 0, 0, 0, 1, 1,
-0.5443177, 0.632719, -0.7656386, 0, 0, 0, 1, 1,
-0.5429283, -0.269907, -2.849684, 0, 0, 0, 1, 1,
-0.5426388, -1.218474, -0.9349841, 1, 1, 1, 1, 1,
-0.5423614, -0.8950243, -2.030967, 1, 1, 1, 1, 1,
-0.5416878, -0.2311927, 0.1411408, 1, 1, 1, 1, 1,
-0.5410981, -1.65225, -1.861017, 1, 1, 1, 1, 1,
-0.532496, -0.9645797, -2.910286, 1, 1, 1, 1, 1,
-0.5310378, -0.1918764, -0.8253323, 1, 1, 1, 1, 1,
-0.5297702, -2.659132, -2.40127, 1, 1, 1, 1, 1,
-0.5281766, -0.6418314, -3.165606, 1, 1, 1, 1, 1,
-0.5281213, -1.933255, -3.584806, 1, 1, 1, 1, 1,
-0.5156757, -0.7913156, -1.760398, 1, 1, 1, 1, 1,
-0.5093591, -0.9274367, -1.861789, 1, 1, 1, 1, 1,
-0.5074839, -0.06035577, -1.318871, 1, 1, 1, 1, 1,
-0.5061349, -0.4907996, -2.419909, 1, 1, 1, 1, 1,
-0.5042865, -1.147347, -3.494903, 1, 1, 1, 1, 1,
-0.5039529, 2.392355, -0.4748415, 1, 1, 1, 1, 1,
-0.5038671, -0.3415734, -2.112127, 0, 0, 1, 1, 1,
-0.5037891, 0.2930376, -1.356198, 1, 0, 0, 1, 1,
-0.5034323, -1.902937, -2.599598, 1, 0, 0, 1, 1,
-0.5026421, -0.4872549, -2.533026, 1, 0, 0, 1, 1,
-0.4986757, -1.52584, -4.337323, 1, 0, 0, 1, 1,
-0.4959575, 0.4807445, -0.1953187, 1, 0, 0, 1, 1,
-0.4949761, -0.7419447, -0.5196344, 0, 0, 0, 1, 1,
-0.4911221, -0.8336945, -2.526685, 0, 0, 0, 1, 1,
-0.4866944, 2.369829, -1.096387, 0, 0, 0, 1, 1,
-0.4835722, -0.5937641, -3.28331, 0, 0, 0, 1, 1,
-0.4818387, 0.3732638, -2.3079, 0, 0, 0, 1, 1,
-0.481537, -0.2473955, -1.644666, 0, 0, 0, 1, 1,
-0.4759141, 0.3493488, -1.143465, 0, 0, 0, 1, 1,
-0.4745002, 0.1367112, -2.039553, 1, 1, 1, 1, 1,
-0.4713777, -2.590546, -2.90982, 1, 1, 1, 1, 1,
-0.4706842, 0.42628, 0.4108577, 1, 1, 1, 1, 1,
-0.4704627, 0.3719971, -1.347586, 1, 1, 1, 1, 1,
-0.4688061, 0.6989437, -1.94868, 1, 1, 1, 1, 1,
-0.4653922, 1.294389, -1.1748, 1, 1, 1, 1, 1,
-0.4627873, 0.02555065, 1.291355, 1, 1, 1, 1, 1,
-0.4561272, -1.447403, -3.28875, 1, 1, 1, 1, 1,
-0.4487063, -0.2195575, -2.939654, 1, 1, 1, 1, 1,
-0.4484827, -1.315268, -3.825629, 1, 1, 1, 1, 1,
-0.4409391, -0.2013192, -2.145573, 1, 1, 1, 1, 1,
-0.4408484, 0.2009229, -0.3338678, 1, 1, 1, 1, 1,
-0.4364738, 1.067149, -0.4204255, 1, 1, 1, 1, 1,
-0.4348033, -0.8365015, -4.901937, 1, 1, 1, 1, 1,
-0.4335404, 0.6918546, -0.5743493, 1, 1, 1, 1, 1,
-0.4321561, 1.499552, -0.4236434, 0, 0, 1, 1, 1,
-0.4313657, 1.312415, -0.3456723, 1, 0, 0, 1, 1,
-0.4263362, -0.3247983, -0.3353321, 1, 0, 0, 1, 1,
-0.4260434, 0.9849025, -1.519483, 1, 0, 0, 1, 1,
-0.4259643, 2.695825, -1.168984, 1, 0, 0, 1, 1,
-0.4243076, 1.887182, -1.282961, 1, 0, 0, 1, 1,
-0.4183027, 0.5504771, 0.14712, 0, 0, 0, 1, 1,
-0.4162517, 0.3466113, -1.122936, 0, 0, 0, 1, 1,
-0.4146329, 0.83687, -0.1446376, 0, 0, 0, 1, 1,
-0.4139806, -0.6811391, -3.723036, 0, 0, 0, 1, 1,
-0.4139592, -0.4571395, -1.81311, 0, 0, 0, 1, 1,
-0.4138376, -0.6990961, -4.042262, 0, 0, 0, 1, 1,
-0.4100133, -0.07402859, -3.194891, 0, 0, 0, 1, 1,
-0.408368, -0.3909816, -3.295829, 1, 1, 1, 1, 1,
-0.397914, -0.9368395, -1.575841, 1, 1, 1, 1, 1,
-0.3962723, 1.209273, -2.075636, 1, 1, 1, 1, 1,
-0.3954137, 0.15061, -0.607868, 1, 1, 1, 1, 1,
-0.3950112, -0.1862509, -1.357608, 1, 1, 1, 1, 1,
-0.3835705, 0.6652772, -1.211141, 1, 1, 1, 1, 1,
-0.3813083, -1.162453, -3.391456, 1, 1, 1, 1, 1,
-0.3758418, -0.06554144, -1.744901, 1, 1, 1, 1, 1,
-0.3747758, -1.228248, -4.713096, 1, 1, 1, 1, 1,
-0.3728522, -0.6060755, -1.406006, 1, 1, 1, 1, 1,
-0.3716166, -0.3305414, -1.586765, 1, 1, 1, 1, 1,
-0.3708338, -2.026128, -2.909406, 1, 1, 1, 1, 1,
-0.3687705, -0.004862344, -3.02715, 1, 1, 1, 1, 1,
-0.3681975, 0.3003413, -0.7597277, 1, 1, 1, 1, 1,
-0.3634382, 0.4895051, -2.437783, 1, 1, 1, 1, 1,
-0.3568341, -1.134022, -3.453932, 0, 0, 1, 1, 1,
-0.3562198, -0.7415042, -1.199945, 1, 0, 0, 1, 1,
-0.3522875, 0.2993058, -0.1706144, 1, 0, 0, 1, 1,
-0.3516983, 0.2416116, -1.146495, 1, 0, 0, 1, 1,
-0.3507862, 0.5590788, -1.307873, 1, 0, 0, 1, 1,
-0.3493575, 1.246072, -0.668875, 1, 0, 0, 1, 1,
-0.3490286, 2.338937, -0.3437681, 0, 0, 0, 1, 1,
-0.339176, 2.110919, -1.0031, 0, 0, 0, 1, 1,
-0.3351931, 1.516761, -0.723352, 0, 0, 0, 1, 1,
-0.3330109, 1.933968, -0.6609622, 0, 0, 0, 1, 1,
-0.3299017, -0.149361, -1.674772, 0, 0, 0, 1, 1,
-0.3266855, 1.26715, -0.1843675, 0, 0, 0, 1, 1,
-0.3171387, -0.1722568, -2.093684, 0, 0, 0, 1, 1,
-0.3161564, 0.6864114, -0.4716818, 1, 1, 1, 1, 1,
-0.3053197, 0.9318393, 0.7623278, 1, 1, 1, 1, 1,
-0.3010161, 1.410285, -0.4919907, 1, 1, 1, 1, 1,
-0.3003541, 1.086004, -0.878395, 1, 1, 1, 1, 1,
-0.288734, -1.012003, -3.716336, 1, 1, 1, 1, 1,
-0.2882845, 1.561656, -0.5145731, 1, 1, 1, 1, 1,
-0.2876642, 0.895731, -0.4394481, 1, 1, 1, 1, 1,
-0.2860753, -0.916565, -2.809602, 1, 1, 1, 1, 1,
-0.2859068, 0.5156928, -0.4802045, 1, 1, 1, 1, 1,
-0.2841254, -0.08153711, -2.421702, 1, 1, 1, 1, 1,
-0.2837051, -0.02944667, -2.110179, 1, 1, 1, 1, 1,
-0.2759615, -0.5575539, -3.025678, 1, 1, 1, 1, 1,
-0.2708288, 0.3604047, 0.1275406, 1, 1, 1, 1, 1,
-0.2631437, 1.071643, -0.6761065, 1, 1, 1, 1, 1,
-0.2623037, 0.7348502, -0.9285665, 1, 1, 1, 1, 1,
-0.2565558, -1.680441, -2.465693, 0, 0, 1, 1, 1,
-0.2564604, -0.2544698, -2.992357, 1, 0, 0, 1, 1,
-0.2535333, 1.013837, -0.3711448, 1, 0, 0, 1, 1,
-0.2528635, -1.638608, -2.444544, 1, 0, 0, 1, 1,
-0.2528245, -1.52748, -2.934998, 1, 0, 0, 1, 1,
-0.2513416, -0.3633342, -2.427494, 1, 0, 0, 1, 1,
-0.2442735, -0.04664777, -2.488879, 0, 0, 0, 1, 1,
-0.2430644, -0.7798157, -2.898311, 0, 0, 0, 1, 1,
-0.242451, 0.3563346, -1.635052, 0, 0, 0, 1, 1,
-0.2379657, -0.4666498, -1.934575, 0, 0, 0, 1, 1,
-0.2369679, 0.02478805, -2.14137, 0, 0, 0, 1, 1,
-0.2366331, 0.02091656, -0.3099287, 0, 0, 0, 1, 1,
-0.2365026, 0.6574339, -0.1839103, 0, 0, 0, 1, 1,
-0.2295557, -0.3066088, -2.895721, 1, 1, 1, 1, 1,
-0.2271849, 0.9872745, -3.202745, 1, 1, 1, 1, 1,
-0.2252516, 0.7813595, 1.014686, 1, 1, 1, 1, 1,
-0.2248603, 0.0004617283, 1.10913, 1, 1, 1, 1, 1,
-0.222491, 1.165364, 1.104899, 1, 1, 1, 1, 1,
-0.2197453, -0.637341, -2.435102, 1, 1, 1, 1, 1,
-0.2165418, -0.4067022, -3.683583, 1, 1, 1, 1, 1,
-0.2160497, -0.4081105, -2.404271, 1, 1, 1, 1, 1,
-0.2157945, -0.8677596, -3.340672, 1, 1, 1, 1, 1,
-0.2146467, 0.7639915, -1.250968, 1, 1, 1, 1, 1,
-0.2137752, -1.791184, -3.341839, 1, 1, 1, 1, 1,
-0.2094564, -1.731257, -1.74404, 1, 1, 1, 1, 1,
-0.2091312, -1.684852, -3.1361, 1, 1, 1, 1, 1,
-0.2086509, 1.250232, -1.312808, 1, 1, 1, 1, 1,
-0.2069244, -0.263484, -2.311181, 1, 1, 1, 1, 1,
-0.2056511, 0.3512675, -0.5408254, 0, 0, 1, 1, 1,
-0.2010188, 1.122243, -1.040525, 1, 0, 0, 1, 1,
-0.1990919, 1.337668, -0.7605052, 1, 0, 0, 1, 1,
-0.1980609, -1.004529, -3.953532, 1, 0, 0, 1, 1,
-0.1978679, -1.2265, -1.894631, 1, 0, 0, 1, 1,
-0.197487, -0.04188105, -1.834891, 1, 0, 0, 1, 1,
-0.1966874, 2.604695, 0.2668122, 0, 0, 0, 1, 1,
-0.1923173, 0.3859068, 0.2799303, 0, 0, 0, 1, 1,
-0.1887003, -1.978209, -2.16624, 0, 0, 0, 1, 1,
-0.1853394, 0.6394303, -0.2813645, 0, 0, 0, 1, 1,
-0.1834303, -0.6163083, -2.053987, 0, 0, 0, 1, 1,
-0.1797662, 1.733816, -1.837212, 0, 0, 0, 1, 1,
-0.174823, -0.7920287, -2.324398, 0, 0, 0, 1, 1,
-0.1744548, -1.491459, -3.364034, 1, 1, 1, 1, 1,
-0.1744016, 0.09110215, -3.118786, 1, 1, 1, 1, 1,
-0.1742733, -0.541698, -1.379139, 1, 1, 1, 1, 1,
-0.1713269, -1.414649, -2.65734, 1, 1, 1, 1, 1,
-0.1695934, -0.5863782, -3.445491, 1, 1, 1, 1, 1,
-0.1653283, 1.027157, -0.165028, 1, 1, 1, 1, 1,
-0.162835, 0.3615099, -1.432639, 1, 1, 1, 1, 1,
-0.1628006, -0.5752444, -3.192943, 1, 1, 1, 1, 1,
-0.1609226, -1.1924, -3.517587, 1, 1, 1, 1, 1,
-0.1607209, 0.1900266, -0.9412037, 1, 1, 1, 1, 1,
-0.1605383, 0.586062, -2.059986, 1, 1, 1, 1, 1,
-0.159735, -0.615837, -3.650431, 1, 1, 1, 1, 1,
-0.1596222, 0.6934916, -1.23107, 1, 1, 1, 1, 1,
-0.1542515, -0.5925529, -2.433358, 1, 1, 1, 1, 1,
-0.150999, 0.7173843, 0.6824161, 1, 1, 1, 1, 1,
-0.1501167, -0.8236307, -1.63331, 0, 0, 1, 1, 1,
-0.1450689, 0.4796491, -0.1885826, 1, 0, 0, 1, 1,
-0.143012, -0.2190868, -2.382031, 1, 0, 0, 1, 1,
-0.1402888, -0.440504, -1.896532, 1, 0, 0, 1, 1,
-0.1391667, -0.09056237, -2.403284, 1, 0, 0, 1, 1,
-0.1379232, 1.158182, 1.272258, 1, 0, 0, 1, 1,
-0.1328962, 1.428852, -0.1889955, 0, 0, 0, 1, 1,
-0.1325539, 1.87707, -0.07052011, 0, 0, 0, 1, 1,
-0.1299861, 0.6362518, 0.3815194, 0, 0, 0, 1, 1,
-0.1292648, 0.7399191, 0.3288927, 0, 0, 0, 1, 1,
-0.1288396, 0.02703779, -0.2403539, 0, 0, 0, 1, 1,
-0.1275993, -0.2517926, -1.729337, 0, 0, 0, 1, 1,
-0.1249172, -1.558894, -0.8569307, 0, 0, 0, 1, 1,
-0.124331, -1.55735, -3.107339, 1, 1, 1, 1, 1,
-0.1232286, -1.923328, -1.245984, 1, 1, 1, 1, 1,
-0.1166939, 0.08604337, -0.8639288, 1, 1, 1, 1, 1,
-0.1131095, -1.071369, -3.67205, 1, 1, 1, 1, 1,
-0.1032026, -1.301403, -3.129195, 1, 1, 1, 1, 1,
-0.1022191, -1.451921, -2.515684, 1, 1, 1, 1, 1,
-0.1011685, 1.10203, 0.585124, 1, 1, 1, 1, 1,
-0.1004252, 0.2230534, -0.1236601, 1, 1, 1, 1, 1,
-0.09868425, -0.9403765, -3.318274, 1, 1, 1, 1, 1,
-0.08869318, 0.1112936, -0.612092, 1, 1, 1, 1, 1,
-0.08619224, 0.7496633, -0.3994028, 1, 1, 1, 1, 1,
-0.08507583, -1.92277, -1.747958, 1, 1, 1, 1, 1,
-0.08181107, -2.027885, -3.616924, 1, 1, 1, 1, 1,
-0.08143716, 1.062595, -0.1013715, 1, 1, 1, 1, 1,
-0.07830606, -0.5036019, -4.510053, 1, 1, 1, 1, 1,
-0.07769332, 0.1459456, -1.611103, 0, 0, 1, 1, 1,
-0.0770401, 0.8700209, -0.8201788, 1, 0, 0, 1, 1,
-0.074734, 0.9159678, -0.260622, 1, 0, 0, 1, 1,
-0.07132879, 0.245083, -0.7089633, 1, 0, 0, 1, 1,
-0.06876491, 0.9547272, -1.580744, 1, 0, 0, 1, 1,
-0.06517874, -0.6893621, -4.849496, 1, 0, 0, 1, 1,
-0.0628622, 1.006654, -1.280466, 0, 0, 0, 1, 1,
-0.05376702, 0.4776188, 0.6530876, 0, 0, 0, 1, 1,
-0.05283183, -0.7432532, -4.237078, 0, 0, 0, 1, 1,
-0.04060869, -0.3197919, -1.285762, 0, 0, 0, 1, 1,
-0.03954318, -0.3900397, -2.816785, 0, 0, 0, 1, 1,
-0.03846824, 0.04543804, -0.4332978, 0, 0, 0, 1, 1,
-0.03676585, 0.9735896, 0.3023998, 0, 0, 0, 1, 1,
-0.03546072, -0.7493226, -3.409948, 1, 1, 1, 1, 1,
-0.03304529, 0.673213, -0.9564213, 1, 1, 1, 1, 1,
-0.03076011, -1.927721, -3.450437, 1, 1, 1, 1, 1,
-0.02964927, 0.3040623, -0.4040616, 1, 1, 1, 1, 1,
-0.02370189, 1.400592, 1.073695, 1, 1, 1, 1, 1,
-0.01851721, 0.2937968, 0.1610977, 1, 1, 1, 1, 1,
-0.01821883, -1.02856, -3.112122, 1, 1, 1, 1, 1,
-0.0162561, -0.2820846, -3.602836, 1, 1, 1, 1, 1,
-0.01270017, 0.5987118, 0.7908976, 1, 1, 1, 1, 1,
-0.01009873, -1.084395, -2.541918, 1, 1, 1, 1, 1,
-0.009781495, -1.988099, -2.959269, 1, 1, 1, 1, 1,
-0.008033174, 0.4559804, 0.05942021, 1, 1, 1, 1, 1,
-0.007226998, 1.478598, -0.1937969, 1, 1, 1, 1, 1,
-0.003716653, 0.4228073, -1.286288, 1, 1, 1, 1, 1,
-0.002251466, -0.6849234, -3.327331, 1, 1, 1, 1, 1,
0.0008572832, 1.634747, 0.3483146, 0, 0, 1, 1, 1,
0.003250407, -0.8157614, 2.586771, 1, 0, 0, 1, 1,
0.005271641, 0.8817136, 0.9938558, 1, 0, 0, 1, 1,
0.007383008, 1.546131, -0.135884, 1, 0, 0, 1, 1,
0.008963131, -0.4059054, 2.567861, 1, 0, 0, 1, 1,
0.009714586, 0.6710523, -0.6879824, 1, 0, 0, 1, 1,
0.01974957, 0.09406466, -0.2786995, 0, 0, 0, 1, 1,
0.02236792, 0.544853, -1.228246, 0, 0, 0, 1, 1,
0.02289724, -0.8042988, 2.388386, 0, 0, 0, 1, 1,
0.02965447, -0.1766851, 2.315383, 0, 0, 0, 1, 1,
0.03037981, 0.1383554, 0.6453996, 0, 0, 0, 1, 1,
0.03083023, 2.130239, -0.1777741, 0, 0, 0, 1, 1,
0.03107254, 1.554005, -0.5512738, 0, 0, 0, 1, 1,
0.03179147, 0.9224952, 0.6186356, 1, 1, 1, 1, 1,
0.03213552, -0.5253913, 3.535745, 1, 1, 1, 1, 1,
0.03554253, -0.9370106, 2.353471, 1, 1, 1, 1, 1,
0.03591711, -1.333501, 1.864871, 1, 1, 1, 1, 1,
0.03611296, -0.5656936, 3.831136, 1, 1, 1, 1, 1,
0.03841568, -1.071866, 2.71157, 1, 1, 1, 1, 1,
0.04042779, -1.77232, 3.223396, 1, 1, 1, 1, 1,
0.04695627, 0.2227429, 0.1643958, 1, 1, 1, 1, 1,
0.05036643, 1.642559, 0.6114298, 1, 1, 1, 1, 1,
0.05143826, -0.5485054, 3.72706, 1, 1, 1, 1, 1,
0.05220113, 1.321339, 0.5574577, 1, 1, 1, 1, 1,
0.0526026, -1.883044, 2.661893, 1, 1, 1, 1, 1,
0.05892774, -1.088484, 4.366966, 1, 1, 1, 1, 1,
0.06017454, 0.312898, 1.490139, 1, 1, 1, 1, 1,
0.06341267, 0.7000726, 0.2318479, 1, 1, 1, 1, 1,
0.06458468, -0.4502574, 3.301591, 0, 0, 1, 1, 1,
0.06570888, 0.8331425, -0.05976828, 1, 0, 0, 1, 1,
0.06678057, 0.8710821, 0.2035417, 1, 0, 0, 1, 1,
0.06777683, -1.204182, 4.110091, 1, 0, 0, 1, 1,
0.06796181, -0.3980026, 3.89359, 1, 0, 0, 1, 1,
0.07274222, -0.3724155, 3.396318, 1, 0, 0, 1, 1,
0.07280608, 0.3664922, 1.284019, 0, 0, 0, 1, 1,
0.07557745, 0.3906214, -0.8985162, 0, 0, 0, 1, 1,
0.07680071, -1.00059, 2.501856, 0, 0, 0, 1, 1,
0.07792711, -1.262389, 4.038883, 0, 0, 0, 1, 1,
0.08320551, -2.3467, 3.793549, 0, 0, 0, 1, 1,
0.08438776, -0.140048, 2.518169, 0, 0, 0, 1, 1,
0.08565865, -0.4919845, 2.613627, 0, 0, 0, 1, 1,
0.08586274, -0.1191849, 2.841276, 1, 1, 1, 1, 1,
0.08981047, 1.632206, 0.5970547, 1, 1, 1, 1, 1,
0.09522077, 0.8843501, -0.8052037, 1, 1, 1, 1, 1,
0.09968992, -0.7741979, 4.42179, 1, 1, 1, 1, 1,
0.1005254, -0.04119542, 1.2371, 1, 1, 1, 1, 1,
0.1028498, -0.4910427, 2.473568, 1, 1, 1, 1, 1,
0.1030475, -1.615514, 3.162581, 1, 1, 1, 1, 1,
0.1080822, 1.922873, 0.07138184, 1, 1, 1, 1, 1,
0.1092181, 1.308969, -1.719326, 1, 1, 1, 1, 1,
0.1127934, -0.5896527, 3.031014, 1, 1, 1, 1, 1,
0.1136922, 1.27815, 0.29278, 1, 1, 1, 1, 1,
0.1150225, 0.2297301, -0.7131897, 1, 1, 1, 1, 1,
0.1170858, -1.853577, 3.846243, 1, 1, 1, 1, 1,
0.1172728, 1.096066, -1.644779, 1, 1, 1, 1, 1,
0.1193863, -0.974676, 1.580074, 1, 1, 1, 1, 1,
0.1206983, -0.5808134, 3.778807, 0, 0, 1, 1, 1,
0.1229338, 0.3744069, -0.5387243, 1, 0, 0, 1, 1,
0.1364661, 1.539382, 1.707868, 1, 0, 0, 1, 1,
0.139733, -1.390649, 3.151139, 1, 0, 0, 1, 1,
0.1411876, 0.7272048, 1.293337, 1, 0, 0, 1, 1,
0.1441478, 1.183434, -0.189496, 1, 0, 0, 1, 1,
0.1442875, 1.330271, 2.025767, 0, 0, 0, 1, 1,
0.1448827, 0.2694375, 0.8202785, 0, 0, 0, 1, 1,
0.1450098, -1.054819, 1.627877, 0, 0, 0, 1, 1,
0.1485797, -0.4700621, 3.931462, 0, 0, 0, 1, 1,
0.1508529, 0.3958934, 0.03422588, 0, 0, 0, 1, 1,
0.1509554, -2.789394, 2.742165, 0, 0, 0, 1, 1,
0.1516478, 0.1797216, 2.744137, 0, 0, 0, 1, 1,
0.1543256, 1.276192, 0.1760495, 1, 1, 1, 1, 1,
0.1648779, 0.6304992, 0.3691664, 1, 1, 1, 1, 1,
0.1692329, -1.163261, 3.359659, 1, 1, 1, 1, 1,
0.1709024, 1.022376, 1.560656, 1, 1, 1, 1, 1,
0.1725831, -0.07899747, 2.570089, 1, 1, 1, 1, 1,
0.172917, 0.4566241, -0.1371029, 1, 1, 1, 1, 1,
0.1740103, -0.01569472, 2.003438, 1, 1, 1, 1, 1,
0.1758952, -0.7297669, 4.318464, 1, 1, 1, 1, 1,
0.1777279, 0.849013, -2.648076, 1, 1, 1, 1, 1,
0.1779773, 2.000915, -0.2574732, 1, 1, 1, 1, 1,
0.1792796, 2.996874, 0.14157, 1, 1, 1, 1, 1,
0.1809569, -0.3195668, 2.806925, 1, 1, 1, 1, 1,
0.1810888, 0.1885748, 0.5748549, 1, 1, 1, 1, 1,
0.1852574, 1.550004, 1.089681, 1, 1, 1, 1, 1,
0.1860881, -0.5362312, 1.569532, 1, 1, 1, 1, 1,
0.1876133, -2.734226, 3.863581, 0, 0, 1, 1, 1,
0.1877472, 0.160326, 2.220861, 1, 0, 0, 1, 1,
0.1953407, -0.8456903, 1.250117, 1, 0, 0, 1, 1,
0.1985925, -2.375914, 2.427583, 1, 0, 0, 1, 1,
0.199077, 1.256242, 1.903815, 1, 0, 0, 1, 1,
0.1995784, -0.3427106, 2.615532, 1, 0, 0, 1, 1,
0.1996123, -0.6088462, 3.330528, 0, 0, 0, 1, 1,
0.205144, 0.1501506, 1.426528, 0, 0, 0, 1, 1,
0.2054339, 0.3969364, -0.208815, 0, 0, 0, 1, 1,
0.2064041, 0.7974061, 1.30759, 0, 0, 0, 1, 1,
0.2113296, -0.8174655, 1.385145, 0, 0, 0, 1, 1,
0.2114017, -2.165176, 3.772103, 0, 0, 0, 1, 1,
0.2137341, 2.517887, -1.654155, 0, 0, 0, 1, 1,
0.2152068, -0.6640776, 3.578458, 1, 1, 1, 1, 1,
0.2179571, 0.4139223, 0.02674595, 1, 1, 1, 1, 1,
0.2184072, -0.4496915, 3.419561, 1, 1, 1, 1, 1,
0.2184705, 1.039198, -1.01484, 1, 1, 1, 1, 1,
0.2185263, -0.8543658, 1.470275, 1, 1, 1, 1, 1,
0.2193232, -0.8278862, 3.574713, 1, 1, 1, 1, 1,
0.2257688, -0.807478, 1.721902, 1, 1, 1, 1, 1,
0.2260973, 1.294414, -1.711395, 1, 1, 1, 1, 1,
0.2269433, 0.7589935, 1.387637, 1, 1, 1, 1, 1,
0.2285095, 2.208364, 0.2393337, 1, 1, 1, 1, 1,
0.2436536, -0.4748704, 1.364481, 1, 1, 1, 1, 1,
0.2508455, 0.2905087, 2.079935, 1, 1, 1, 1, 1,
0.2556172, 0.4467842, -0.242566, 1, 1, 1, 1, 1,
0.2615134, -0.8680438, 1.604393, 1, 1, 1, 1, 1,
0.2620054, 0.5134536, -0.2364887, 1, 1, 1, 1, 1,
0.2635824, 0.520321, -1.413849, 0, 0, 1, 1, 1,
0.2674149, -0.08378065, 2.135948, 1, 0, 0, 1, 1,
0.2716905, 0.2603605, 0.6237344, 1, 0, 0, 1, 1,
0.2736485, -2.305073, 2.630977, 1, 0, 0, 1, 1,
0.2799326, 1.461434, -1.250427, 1, 0, 0, 1, 1,
0.2845828, 0.4027727, 1.802912, 1, 0, 0, 1, 1,
0.2848023, -0.7219709, 4.892648, 0, 0, 0, 1, 1,
0.2850302, -0.6818063, 0.796957, 0, 0, 0, 1, 1,
0.2872652, -0.89522, 2.095935, 0, 0, 0, 1, 1,
0.2883294, -1.009088, 2.750844, 0, 0, 0, 1, 1,
0.2990513, 0.3040409, 0.247728, 0, 0, 0, 1, 1,
0.3000116, -1.091676, 4.23573, 0, 0, 0, 1, 1,
0.3016569, -2.148791, 3.465697, 0, 0, 0, 1, 1,
0.3023126, 1.442702, 2.63465, 1, 1, 1, 1, 1,
0.3048921, -0.09708963, 1.805898, 1, 1, 1, 1, 1,
0.3130862, -0.794691, 3.4347, 1, 1, 1, 1, 1,
0.3165509, -0.8813957, 2.180803, 1, 1, 1, 1, 1,
0.3199055, 0.465385, -0.5473022, 1, 1, 1, 1, 1,
0.3220433, -0.2840887, 2.804828, 1, 1, 1, 1, 1,
0.3260677, -0.5580503, 3.374307, 1, 1, 1, 1, 1,
0.334107, -0.08364239, 1.565964, 1, 1, 1, 1, 1,
0.3365467, 0.5740056, -0.1980725, 1, 1, 1, 1, 1,
0.3371931, -1.04642, 4.45338, 1, 1, 1, 1, 1,
0.3375748, 1.090089, 1.542572, 1, 1, 1, 1, 1,
0.3407494, 0.2276551, 0.5364636, 1, 1, 1, 1, 1,
0.341511, -1.496492, 2.616444, 1, 1, 1, 1, 1,
0.3435415, -1.681048, 2.146032, 1, 1, 1, 1, 1,
0.3438593, -1.436794, 1.629755, 1, 1, 1, 1, 1,
0.3463468, -0.7255002, 2.602572, 0, 0, 1, 1, 1,
0.3470707, -1.546403, 2.45288, 1, 0, 0, 1, 1,
0.3480326, -0.5650286, 2.274381, 1, 0, 0, 1, 1,
0.3521791, -0.02411265, 0.968914, 1, 0, 0, 1, 1,
0.3531159, 0.2513301, 1.410498, 1, 0, 0, 1, 1,
0.3537873, -0.8421213, 3.073613, 1, 0, 0, 1, 1,
0.3563016, -1.198503, 1.739907, 0, 0, 0, 1, 1,
0.357511, -0.6671116, 1.760873, 0, 0, 0, 1, 1,
0.3592443, -1.85219, 3.374371, 0, 0, 0, 1, 1,
0.3619319, 1.42889, 0.3338184, 0, 0, 0, 1, 1,
0.3690157, 0.2333785, 2.160191, 0, 0, 0, 1, 1,
0.3713157, -0.7033871, 1.198603, 0, 0, 0, 1, 1,
0.373256, -0.5760243, 2.970857, 0, 0, 0, 1, 1,
0.3777339, -0.9198012, 2.242509, 1, 1, 1, 1, 1,
0.3874872, -0.2194776, 3.065768, 1, 1, 1, 1, 1,
0.3907504, 0.6539913, 0.3418405, 1, 1, 1, 1, 1,
0.3917821, -0.1892519, 4.10734, 1, 1, 1, 1, 1,
0.3951934, -1.036585, 2.789924, 1, 1, 1, 1, 1,
0.3960897, 0.582173, -0.5307418, 1, 1, 1, 1, 1,
0.3980132, 0.761084, 1.220481, 1, 1, 1, 1, 1,
0.3980435, -0.2838279, -0.6912029, 1, 1, 1, 1, 1,
0.4025681, -1.675585, 3.283811, 1, 1, 1, 1, 1,
0.4046036, -0.7186769, 2.972623, 1, 1, 1, 1, 1,
0.4061126, 1.00843, 1.851309, 1, 1, 1, 1, 1,
0.4076163, 0.9138192, -0.5919453, 1, 1, 1, 1, 1,
0.4099851, 0.7297396, -1.221679, 1, 1, 1, 1, 1,
0.4100367, -0.01720846, 1.499825, 1, 1, 1, 1, 1,
0.4282869, -0.04172128, 2.553435, 1, 1, 1, 1, 1,
0.4291441, 2.116382, 1.833364, 0, 0, 1, 1, 1,
0.4303315, -1.295637, 3.251758, 1, 0, 0, 1, 1,
0.4306718, 1.493565, 1.580011, 1, 0, 0, 1, 1,
0.4342817, 0.2792034, 1.424612, 1, 0, 0, 1, 1,
0.435533, 0.2751048, 1.032281, 1, 0, 0, 1, 1,
0.4479107, -0.9646148, 2.631579, 1, 0, 0, 1, 1,
0.4505053, -0.4470873, 2.948443, 0, 0, 0, 1, 1,
0.4511241, 0.2864068, 2.166702, 0, 0, 0, 1, 1,
0.452198, -0.3203204, 1.686942, 0, 0, 0, 1, 1,
0.4529673, 0.5196285, 1.120493, 0, 0, 0, 1, 1,
0.455377, 1.172073, 0.1619938, 0, 0, 0, 1, 1,
0.4571501, -0.1169975, 2.180007, 0, 0, 0, 1, 1,
0.4609081, -1.112112, 2.085477, 0, 0, 0, 1, 1,
0.4631695, 0.246968, 2.166756, 1, 1, 1, 1, 1,
0.4721655, -0.8887839, 3.281499, 1, 1, 1, 1, 1,
0.4723857, 0.7850361, 1.78628, 1, 1, 1, 1, 1,
0.4807885, 0.8406207, 0.8361513, 1, 1, 1, 1, 1,
0.4836274, -0.5955576, 1.404112, 1, 1, 1, 1, 1,
0.4839748, 0.06850695, 1.816733, 1, 1, 1, 1, 1,
0.4867365, 0.66964, 0.85958, 1, 1, 1, 1, 1,
0.4875902, 1.793591, 0.3750907, 1, 1, 1, 1, 1,
0.4895425, -0.2783847, 2.43937, 1, 1, 1, 1, 1,
0.4901036, -0.9980692, 3.585685, 1, 1, 1, 1, 1,
0.4961315, -1.502941, 1.81101, 1, 1, 1, 1, 1,
0.5018155, -0.5032517, 2.683806, 1, 1, 1, 1, 1,
0.504717, 0.1758999, 1.809101, 1, 1, 1, 1, 1,
0.5055749, -1.141214, 2.988171, 1, 1, 1, 1, 1,
0.5058263, -1.496829, 1.015111, 1, 1, 1, 1, 1,
0.5073908, 1.319168, 1.600772, 0, 0, 1, 1, 1,
0.5109705, 0.4436705, 0.9236752, 1, 0, 0, 1, 1,
0.5198411, 0.01374516, 1.856142, 1, 0, 0, 1, 1,
0.5240082, -1.611987, 2.178877, 1, 0, 0, 1, 1,
0.528101, 0.4202025, 1.782225, 1, 0, 0, 1, 1,
0.5298707, 0.7592262, 0.9516553, 1, 0, 0, 1, 1,
0.533316, -0.8525271, 2.878527, 0, 0, 0, 1, 1,
0.5381074, 0.4844995, 0.1054037, 0, 0, 0, 1, 1,
0.5404724, -0.1433848, 1.470632, 0, 0, 0, 1, 1,
0.5412332, 0.06765094, 2.560949, 0, 0, 0, 1, 1,
0.5431002, -0.0850059, 2.95549, 0, 0, 0, 1, 1,
0.5458786, -0.7679107, 1.658214, 0, 0, 0, 1, 1,
0.5472738, 0.3801826, 1.330239, 0, 0, 0, 1, 1,
0.5508478, -0.001567589, 2.870916, 1, 1, 1, 1, 1,
0.5513535, 1.643998, 0.4212531, 1, 1, 1, 1, 1,
0.5518191, 0.8982677, 0.09977196, 1, 1, 1, 1, 1,
0.5606285, 0.9667881, 0.7403572, 1, 1, 1, 1, 1,
0.5608673, 2.323918, 2.191838, 1, 1, 1, 1, 1,
0.5623136, 1.995928, -1.48249, 1, 1, 1, 1, 1,
0.564136, 2.035787, -1.431301, 1, 1, 1, 1, 1,
0.5646008, 0.05152853, 1.971243, 1, 1, 1, 1, 1,
0.5669717, 1.183282, 0.705985, 1, 1, 1, 1, 1,
0.5712464, -2.012464, 2.169407, 1, 1, 1, 1, 1,
0.5833508, -0.847833, 2.086122, 1, 1, 1, 1, 1,
0.5840123, -0.06311655, 2.887882, 1, 1, 1, 1, 1,
0.5880463, -0.7520891, 2.510891, 1, 1, 1, 1, 1,
0.5960543, 0.2263553, 1.940625, 1, 1, 1, 1, 1,
0.6021671, -1.029728, 2.121982, 1, 1, 1, 1, 1,
0.6065273, -0.7004672, 2.639488, 0, 0, 1, 1, 1,
0.6071783, 1.002889, -0.7903791, 1, 0, 0, 1, 1,
0.607316, -0.3408057, 2.224084, 1, 0, 0, 1, 1,
0.6073235, -0.8879568, 2.941611, 1, 0, 0, 1, 1,
0.6156311, -0.70208, 2.518811, 1, 0, 0, 1, 1,
0.6185333, -2.29896, 0.8356557, 1, 0, 0, 1, 1,
0.6233885, -1.02238, 3.347707, 0, 0, 0, 1, 1,
0.6249033, 0.7529325, 0.6533573, 0, 0, 0, 1, 1,
0.6277035, 0.03774493, 0.982667, 0, 0, 0, 1, 1,
0.6300142, -1.882962, 2.275293, 0, 0, 0, 1, 1,
0.6363268, 0.2279003, 1.734, 0, 0, 0, 1, 1,
0.6428143, 1.408104, -0.1387188, 0, 0, 0, 1, 1,
0.6433725, -1.017004, 2.86341, 0, 0, 0, 1, 1,
0.6455267, -0.3943564, 1.288875, 1, 1, 1, 1, 1,
0.6459427, 1.575828, 0.902744, 1, 1, 1, 1, 1,
0.6463722, -0.8106663, 4.83572, 1, 1, 1, 1, 1,
0.6503053, -0.1418752, 1.93533, 1, 1, 1, 1, 1,
0.6560864, -1.25035, 1.066837, 1, 1, 1, 1, 1,
0.6577396, -0.8501273, 2.232255, 1, 1, 1, 1, 1,
0.6592606, -1.653911, 0.8632357, 1, 1, 1, 1, 1,
0.6624877, 0.738186, 1.119131, 1, 1, 1, 1, 1,
0.663395, 1.089309, -1.273564, 1, 1, 1, 1, 1,
0.6668956, -0.520373, 1.669591, 1, 1, 1, 1, 1,
0.6680754, -0.5627713, 1.90319, 1, 1, 1, 1, 1,
0.672088, 0.1839819, 0.616111, 1, 1, 1, 1, 1,
0.6741745, -0.306435, 0.7070002, 1, 1, 1, 1, 1,
0.6745172, -0.6666068, 4.439029, 1, 1, 1, 1, 1,
0.6749413, 0.6397136, 1.495846, 1, 1, 1, 1, 1,
0.6838307, 0.1574711, 0.1780949, 0, 0, 1, 1, 1,
0.6855919, 1.225942, -0.0962189, 1, 0, 0, 1, 1,
0.6876857, 0.1582474, 1.307379, 1, 0, 0, 1, 1,
0.691573, 1.055942, 1.748059, 1, 0, 0, 1, 1,
0.6921355, 0.3960658, 0.262816, 1, 0, 0, 1, 1,
0.6967874, -0.02926964, 2.026947, 1, 0, 0, 1, 1,
0.7028438, -0.09715564, 2.465121, 0, 0, 0, 1, 1,
0.7031333, 0.9508078, 1.508041, 0, 0, 0, 1, 1,
0.7040939, 2.804471, 2.298297, 0, 0, 0, 1, 1,
0.7102284, -0.3054724, 2.018291, 0, 0, 0, 1, 1,
0.7114342, 0.6096889, 1.020501, 0, 0, 0, 1, 1,
0.7187802, 0.2759033, 1.649217, 0, 0, 0, 1, 1,
0.7197159, -0.4206819, 1.841472, 0, 0, 0, 1, 1,
0.7231786, 1.67567, 0.7383666, 1, 1, 1, 1, 1,
0.7287595, 0.4688015, 0.8324018, 1, 1, 1, 1, 1,
0.7299352, 0.3079407, 0.1791622, 1, 1, 1, 1, 1,
0.7347348, 0.1391776, 4.763361, 1, 1, 1, 1, 1,
0.7405672, -1.106723, 0.3118508, 1, 1, 1, 1, 1,
0.7456319, 1.423425, -0.5481058, 1, 1, 1, 1, 1,
0.7501746, -0.3767554, 1.872776, 1, 1, 1, 1, 1,
0.7506096, -0.6899492, 1.887253, 1, 1, 1, 1, 1,
0.7536805, -1.009957, 2.526781, 1, 1, 1, 1, 1,
0.7564499, 0.6794514, 0.7916008, 1, 1, 1, 1, 1,
0.7592192, -1.27431, 1.964536, 1, 1, 1, 1, 1,
0.7621422, -1.477549, 2.979216, 1, 1, 1, 1, 1,
0.7664388, 1.111509, 1.635407, 1, 1, 1, 1, 1,
0.7689031, -0.9283629, 2.433558, 1, 1, 1, 1, 1,
0.769003, -1.4326, 0.4724747, 1, 1, 1, 1, 1,
0.7706171, -1.480827, 3.11073, 0, 0, 1, 1, 1,
0.7738848, 0.08069609, 2.122001, 1, 0, 0, 1, 1,
0.7756493, 1.071915, -0.406738, 1, 0, 0, 1, 1,
0.776455, 0.3122119, 0.3882238, 1, 0, 0, 1, 1,
0.7770807, 2.104994, 0.1026584, 1, 0, 0, 1, 1,
0.780919, 0.2621431, 1.377041, 1, 0, 0, 1, 1,
0.7818674, -0.1180365, 1.104455, 0, 0, 0, 1, 1,
0.7824114, 0.7695595, 0.7259903, 0, 0, 0, 1, 1,
0.7843045, -0.4293606, 1.796319, 0, 0, 0, 1, 1,
0.7875243, 0.396943, 2.189312, 0, 0, 0, 1, 1,
0.7898993, -0.2584113, 0.8680519, 0, 0, 0, 1, 1,
0.7911472, -1.461491, 4.627459, 0, 0, 0, 1, 1,
0.7922406, -0.06574266, 2.409963, 0, 0, 0, 1, 1,
0.7930831, -1.092021, 2.70649, 1, 1, 1, 1, 1,
0.794899, 0.5238556, 2.044512, 1, 1, 1, 1, 1,
0.8049768, 0.9540136, 1.050746, 1, 1, 1, 1, 1,
0.8057818, 1.380781, 1.7822, 1, 1, 1, 1, 1,
0.812081, 0.1323652, 2.461679, 1, 1, 1, 1, 1,
0.814172, 0.6172118, -0.146016, 1, 1, 1, 1, 1,
0.8191991, -0.1662153, 1.055138, 1, 1, 1, 1, 1,
0.8213354, -0.9285495, 1.769404, 1, 1, 1, 1, 1,
0.8215657, -0.03331357, 1.496997, 1, 1, 1, 1, 1,
0.8265066, 1.476958, -0.7159176, 1, 1, 1, 1, 1,
0.8344681, 0.8723512, 2.169989, 1, 1, 1, 1, 1,
0.8414672, -0.5604516, 1.754508, 1, 1, 1, 1, 1,
0.8534158, 1.251278, -0.5787875, 1, 1, 1, 1, 1,
0.861201, 0.3588651, -0.6681955, 1, 1, 1, 1, 1,
0.8656204, 0.8821943, -0.4627426, 1, 1, 1, 1, 1,
0.8714048, -2.01695, 2.759516, 0, 0, 1, 1, 1,
0.8752862, 0.4130337, 1.027515, 1, 0, 0, 1, 1,
0.8759685, -0.1757877, 2.542147, 1, 0, 0, 1, 1,
0.8786423, -0.05431505, -0.2328005, 1, 0, 0, 1, 1,
0.8825572, -3.399123, 3.10698, 1, 0, 0, 1, 1,
0.9010906, -0.4799055, 1.752099, 1, 0, 0, 1, 1,
0.9022284, 2.56337, -0.2126011, 0, 0, 0, 1, 1,
0.9055082, -0.3022085, 1.816887, 0, 0, 0, 1, 1,
0.9058656, 1.729382, -0.5972124, 0, 0, 0, 1, 1,
0.9069128, 1.877262, 0.977107, 0, 0, 0, 1, 1,
0.9070153, -0.2962186, 2.498456, 0, 0, 0, 1, 1,
0.9081731, 0.3370994, 1.598298, 0, 0, 0, 1, 1,
0.9141427, -0.4343649, 1.174294, 0, 0, 0, 1, 1,
0.9155514, -0.7077665, 1.520824, 1, 1, 1, 1, 1,
0.9187939, 0.544517, 1.583828, 1, 1, 1, 1, 1,
0.9207774, -1.099625, 2.164981, 1, 1, 1, 1, 1,
0.9357849, -0.193203, 2.9843, 1, 1, 1, 1, 1,
0.9489767, -0.6211677, 1.349646, 1, 1, 1, 1, 1,
0.9582835, -0.6357711, 2.629081, 1, 1, 1, 1, 1,
0.9603514, -0.2088326, 3.395512, 1, 1, 1, 1, 1,
0.9609482, 1.226183, 0.6312692, 1, 1, 1, 1, 1,
0.9639131, -0.28556, 0.641855, 1, 1, 1, 1, 1,
0.9679112, 1.758265, -0.2873993, 1, 1, 1, 1, 1,
0.969458, -0.7960982, 2.561578, 1, 1, 1, 1, 1,
0.9756882, -0.01284342, 0.4359546, 1, 1, 1, 1, 1,
0.9772225, -0.434288, 2.785102, 1, 1, 1, 1, 1,
0.980812, 0.9182699, 0.1453809, 1, 1, 1, 1, 1,
0.9837382, 1.042499, -0.5580151, 1, 1, 1, 1, 1,
0.9957363, -0.6009166, 2.7402, 0, 0, 1, 1, 1,
0.9965874, 0.2625309, 2.312463, 1, 0, 0, 1, 1,
0.9992817, 0.8659166, 2.128933, 1, 0, 0, 1, 1,
1.002841, 1.162691, 0.2731862, 1, 0, 0, 1, 1,
1.003711, 0.07299972, 1.482878, 1, 0, 0, 1, 1,
1.006384, -0.6281833, 2.881826, 1, 0, 0, 1, 1,
1.022645, -0.5279487, 2.474351, 0, 0, 0, 1, 1,
1.024144, 0.611922, 0.817112, 0, 0, 0, 1, 1,
1.035476, -0.6301734, 1.657837, 0, 0, 0, 1, 1,
1.044816, -0.3284732, 0.7193013, 0, 0, 0, 1, 1,
1.046521, 0.2680589, 1.862192, 0, 0, 0, 1, 1,
1.051862, -0.5844893, 3.094807, 0, 0, 0, 1, 1,
1.052901, -0.8536798, 3.49438, 0, 0, 0, 1, 1,
1.058195, 2.375874, 0.8429481, 1, 1, 1, 1, 1,
1.062124, 0.2938634, 3.047853, 1, 1, 1, 1, 1,
1.089664, 0.4578544, -0.04823224, 1, 1, 1, 1, 1,
1.092456, -0.1646468, -1.359655, 1, 1, 1, 1, 1,
1.096815, 0.9802004, -0.9521516, 1, 1, 1, 1, 1,
1.10304, 1.416013, 0.4770428, 1, 1, 1, 1, 1,
1.108719, 0.1583114, 0.9502004, 1, 1, 1, 1, 1,
1.111395, 0.2881986, 1.20638, 1, 1, 1, 1, 1,
1.117597, -0.4692754, 3.876126, 1, 1, 1, 1, 1,
1.121072, -0.585691, 3.045821, 1, 1, 1, 1, 1,
1.122113, -1.930269, 2.4717, 1, 1, 1, 1, 1,
1.127255, -1.690009, 3.155375, 1, 1, 1, 1, 1,
1.129329, 0.2163764, 0.2762089, 1, 1, 1, 1, 1,
1.129784, 0.7942933, -0.3073881, 1, 1, 1, 1, 1,
1.134072, 1.753117, 1.418567, 1, 1, 1, 1, 1,
1.134474, 2.116775, 1.863774, 0, 0, 1, 1, 1,
1.141179, -0.2436623, 2.364256, 1, 0, 0, 1, 1,
1.151056, -0.174107, 3.873985, 1, 0, 0, 1, 1,
1.153248, -0.2842901, 1.153774, 1, 0, 0, 1, 1,
1.156674, -0.7578843, 2.958483, 1, 0, 0, 1, 1,
1.160578, -1.382492, 2.207566, 1, 0, 0, 1, 1,
1.165786, 0.0006335446, -0.4832748, 0, 0, 0, 1, 1,
1.173412, 0.04435471, 2.43462, 0, 0, 0, 1, 1,
1.18421, -0.1974959, 1.572527, 0, 0, 0, 1, 1,
1.18583, -0.001144199, 1.366139, 0, 0, 0, 1, 1,
1.196298, -1.769567, 0.5415916, 0, 0, 0, 1, 1,
1.200647, 0.5506209, 0.01474751, 0, 0, 0, 1, 1,
1.201789, 2.552758, -1.074783, 0, 0, 0, 1, 1,
1.205378, -0.651131, 2.915397, 1, 1, 1, 1, 1,
1.208919, 0.05533034, 1.153402, 1, 1, 1, 1, 1,
1.209401, 1.153432, 0.7528589, 1, 1, 1, 1, 1,
1.220018, -1.644954, 1.255725, 1, 1, 1, 1, 1,
1.243463, 0.4382161, 1.99443, 1, 1, 1, 1, 1,
1.257567, 0.4770435, 0.8234413, 1, 1, 1, 1, 1,
1.261138, 0.3692044, 2.039724, 1, 1, 1, 1, 1,
1.271264, 1.687166, 0.8726553, 1, 1, 1, 1, 1,
1.273892, -1.094561, 3.246265, 1, 1, 1, 1, 1,
1.283448, 1.128724, 0.1728868, 1, 1, 1, 1, 1,
1.286685, -0.9644001, 1.913501, 1, 1, 1, 1, 1,
1.28897, 1.097617, 2.823317, 1, 1, 1, 1, 1,
1.292377, -0.818635, 3.901031, 1, 1, 1, 1, 1,
1.297294, -0.1217993, 0.7415355, 1, 1, 1, 1, 1,
1.301255, 2.894797, 0.2465663, 1, 1, 1, 1, 1,
1.322908, -1.269211, 2.82742, 0, 0, 1, 1, 1,
1.324743, 0.5625905, 2.485316, 1, 0, 0, 1, 1,
1.325211, 1.093726, 1.384355, 1, 0, 0, 1, 1,
1.330419, 0.6152273, -2.101398, 1, 0, 0, 1, 1,
1.345005, -0.6074596, 2.943407, 1, 0, 0, 1, 1,
1.345773, -0.908103, 3.765253, 1, 0, 0, 1, 1,
1.347157, -0.0005271366, -0.4822685, 0, 0, 0, 1, 1,
1.358995, 1.33476, 0.6142269, 0, 0, 0, 1, 1,
1.366439, -1.47727, 1.68901, 0, 0, 0, 1, 1,
1.372902, 0.6508548, 1.399105, 0, 0, 0, 1, 1,
1.383795, -0.7349042, 2.356394, 0, 0, 0, 1, 1,
1.395445, -0.2929386, 2.024123, 0, 0, 0, 1, 1,
1.396018, 0.7023222, 0.4824708, 0, 0, 0, 1, 1,
1.396185, 2.465156, 0.3611154, 1, 1, 1, 1, 1,
1.397911, -0.2425996, 3.239393, 1, 1, 1, 1, 1,
1.40058, 0.2611028, 3.761547, 1, 1, 1, 1, 1,
1.403741, 2.237236, -0.74499, 1, 1, 1, 1, 1,
1.406492, 1.360222, 3.018301, 1, 1, 1, 1, 1,
1.412247, 1.337907, 2.187173, 1, 1, 1, 1, 1,
1.416269, 0.9503309, 0.7636642, 1, 1, 1, 1, 1,
1.417331, 0.620306, 1.843184, 1, 1, 1, 1, 1,
1.424636, -0.5933738, 0.8962762, 1, 1, 1, 1, 1,
1.42887, 1.247207, 1.1646, 1, 1, 1, 1, 1,
1.430822, -0.7283599, 1.658021, 1, 1, 1, 1, 1,
1.439822, -2.180968, 2.446284, 1, 1, 1, 1, 1,
1.480899, -0.2353644, 1.93301, 1, 1, 1, 1, 1,
1.489585, 1.251645, -0.3419734, 1, 1, 1, 1, 1,
1.50094, -1.083928, 3.370924, 1, 1, 1, 1, 1,
1.511753, 1.749315, 2.151541, 0, 0, 1, 1, 1,
1.52296, 1.307678, 1.545609, 1, 0, 0, 1, 1,
1.529375, 0.4582467, 0.8859226, 1, 0, 0, 1, 1,
1.529507, 0.5782865, 3.071483, 1, 0, 0, 1, 1,
1.531877, 1.816657, 1.827501, 1, 0, 0, 1, 1,
1.532539, 0.6187059, 2.302738, 1, 0, 0, 1, 1,
1.535852, 0.128018, 1.36243, 0, 0, 0, 1, 1,
1.536619, 0.5091293, 3.297256, 0, 0, 0, 1, 1,
1.547544, -0.4984102, 1.599526, 0, 0, 0, 1, 1,
1.549794, 0.6230503, 0.451352, 0, 0, 0, 1, 1,
1.558207, -1.267935, 0.3789375, 0, 0, 0, 1, 1,
1.558806, -0.911535, 2.36633, 0, 0, 0, 1, 1,
1.559991, 0.5008009, 1.519041, 0, 0, 0, 1, 1,
1.560555, -0.4905182, 1.896706, 1, 1, 1, 1, 1,
1.564199, -0.1864777, 1.88057, 1, 1, 1, 1, 1,
1.57432, -0.2018952, 1.468102, 1, 1, 1, 1, 1,
1.588005, 0.01157436, 1.113188, 1, 1, 1, 1, 1,
1.588609, 1.54179, 0.9688792, 1, 1, 1, 1, 1,
1.592926, 0.5051215, -0.2229138, 1, 1, 1, 1, 1,
1.612294, -0.02907918, 1.335016, 1, 1, 1, 1, 1,
1.61573, -0.0144575, 2.432369, 1, 1, 1, 1, 1,
1.636189, -0.3029005, 1.64397, 1, 1, 1, 1, 1,
1.636217, 0.8143684, 0.5674357, 1, 1, 1, 1, 1,
1.647727, 0.2277732, -0.9025273, 1, 1, 1, 1, 1,
1.671347, -0.4535852, 2.172224, 1, 1, 1, 1, 1,
1.672556, 0.4198129, 2.8977, 1, 1, 1, 1, 1,
1.690254, 0.3605914, 1.304528, 1, 1, 1, 1, 1,
1.696083, -0.6562535, 1.474623, 1, 1, 1, 1, 1,
1.713585, 0.004875413, 0.7256513, 0, 0, 1, 1, 1,
1.714044, -0.377589, 4.465037, 1, 0, 0, 1, 1,
1.730904, -1.946391, 1.448684, 1, 0, 0, 1, 1,
1.73694, -0.8642862, 2.923094, 1, 0, 0, 1, 1,
1.737837, 0.3210877, 2.059766, 1, 0, 0, 1, 1,
1.755233, -0.1646346, 2.196788, 1, 0, 0, 1, 1,
1.775003, 1.197384, 2.74377, 0, 0, 0, 1, 1,
1.7874, 0.07137705, 2.335258, 0, 0, 0, 1, 1,
1.793876, 0.9577386, 2.059409, 0, 0, 0, 1, 1,
1.809559, 1.237687, 0.5374798, 0, 0, 0, 1, 1,
1.825933, -2.894411, 2.955725, 0, 0, 0, 1, 1,
1.852984, -0.4705372, 3.211942, 0, 0, 0, 1, 1,
1.868843, 0.3902124, 0.4829518, 0, 0, 0, 1, 1,
1.882011, 0.2968041, 0.447973, 1, 1, 1, 1, 1,
1.897775, 0.5892136, 1.247558, 1, 1, 1, 1, 1,
1.919941, -0.9952578, 1.224972, 1, 1, 1, 1, 1,
1.926087, 0.01457269, 0.7096437, 1, 1, 1, 1, 1,
1.931726, -0.3446032, 1.758832, 1, 1, 1, 1, 1,
1.933446, -0.04713382, 2.075053, 1, 1, 1, 1, 1,
1.9497, -2.466368, 2.55304, 1, 1, 1, 1, 1,
1.973531, -0.2028851, 0.9165177, 1, 1, 1, 1, 1,
1.995752, 0.06790385, 2.299731, 1, 1, 1, 1, 1,
2.026893, 0.7935667, 0.8152422, 1, 1, 1, 1, 1,
2.056936, -1.093249, 1.800391, 1, 1, 1, 1, 1,
2.063043, -1.752657, 1.572533, 1, 1, 1, 1, 1,
2.065899, 1.344588, 1.552711, 1, 1, 1, 1, 1,
2.146028, -0.9127027, 2.492982, 1, 1, 1, 1, 1,
2.169686, -0.1794451, 1.318019, 1, 1, 1, 1, 1,
2.170019, -0.4431982, 0.6463623, 0, 0, 1, 1, 1,
2.184559, -0.3282676, 0.8455223, 1, 0, 0, 1, 1,
2.235126, 0.03660059, 1.176114, 1, 0, 0, 1, 1,
2.254769, -0.2337051, 0.6005423, 1, 0, 0, 1, 1,
2.258007, -0.7679271, 3.031367, 1, 0, 0, 1, 1,
2.27979, -0.8537809, 1.986938, 1, 0, 0, 1, 1,
2.331544, -0.4946386, 1.617132, 0, 0, 0, 1, 1,
2.441413, -1.319163, 1.180263, 0, 0, 0, 1, 1,
2.446473, 2.137869, 0.8470175, 0, 0, 0, 1, 1,
2.493932, 1.310815, -0.05604488, 0, 0, 0, 1, 1,
2.502141, -0.08432532, 1.518916, 0, 0, 0, 1, 1,
2.505908, -1.226953, 1.509844, 0, 0, 0, 1, 1,
2.571622, 0.4306872, 3.375392, 0, 0, 0, 1, 1,
2.581965, 0.1068391, 1.492363, 1, 1, 1, 1, 1,
2.588144, -0.299957, 1.220372, 1, 1, 1, 1, 1,
2.676178, -0.3034092, -0.7254591, 1, 1, 1, 1, 1,
2.682124, -0.5137602, 0.7368824, 1, 1, 1, 1, 1,
2.768129, 0.9508086, 0.5024941, 1, 1, 1, 1, 1,
3.005516, -0.3570696, 1.317975, 1, 1, 1, 1, 1,
3.020053, 0.2801132, 2.08025, 1, 1, 1, 1, 1
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
var radius = 9.1445;
var distance = 32.11967;
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
mvMatrix.translate( 0.06745791, 0.2011244, 0.004644394 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.11967);
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
