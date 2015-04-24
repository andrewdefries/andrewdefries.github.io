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
-3.21489, -0.5537352, -2.58966, 1, 0, 0, 1,
-3.127725, 0.9664256, -2.597034, 1, 0.007843138, 0, 1,
-3.004569, -0.5654622, -3.331924, 1, 0.01176471, 0, 1,
-2.862206, -0.2639358, -1.666363, 1, 0.01960784, 0, 1,
-2.818465, 0.1874716, -0.2521706, 1, 0.02352941, 0, 1,
-2.496398, 3.181583, -2.37868, 1, 0.03137255, 0, 1,
-2.484105, -0.4143136, -1.849887, 1, 0.03529412, 0, 1,
-2.425353, 0.3999762, -1.465724, 1, 0.04313726, 0, 1,
-2.370231, 0.4306332, -2.810549, 1, 0.04705882, 0, 1,
-2.296024, -1.315341, -1.540298, 1, 0.05490196, 0, 1,
-2.273027, 0.6934692, -0.9610944, 1, 0.05882353, 0, 1,
-2.270733, 0.8372166, -1.099216, 1, 0.06666667, 0, 1,
-2.198153, 0.2647081, -1.420864, 1, 0.07058824, 0, 1,
-2.171251, -2.57526, -2.886156, 1, 0.07843138, 0, 1,
-2.166293, 0.9189304, -2.065627, 1, 0.08235294, 0, 1,
-2.115776, 0.632545, -0.8575023, 1, 0.09019608, 0, 1,
-2.100528, 0.759838, -2.122684, 1, 0.09411765, 0, 1,
-2.072523, -0.5919041, -0.5226091, 1, 0.1019608, 0, 1,
-2.028886, -0.9056306, -1.299613, 1, 0.1098039, 0, 1,
-2.015492, -1.754242, -4.226855, 1, 0.1137255, 0, 1,
-2.015351, 0.1859581, -1.102616, 1, 0.1215686, 0, 1,
-2.002054, -1.725838, -2.881006, 1, 0.1254902, 0, 1,
-1.986982, -0.2303843, -1.675628, 1, 0.1333333, 0, 1,
-1.984262, 0.1780256, -1.270429, 1, 0.1372549, 0, 1,
-1.977857, -0.1187743, -1.159872, 1, 0.145098, 0, 1,
-1.966202, -1.476536, -2.412386, 1, 0.1490196, 0, 1,
-1.963581, 0.07647582, -0.812458, 1, 0.1568628, 0, 1,
-1.924928, -0.5399736, 0.007685539, 1, 0.1607843, 0, 1,
-1.920991, -0.08321337, -1.669494, 1, 0.1686275, 0, 1,
-1.886616, -0.3772673, -1.605038, 1, 0.172549, 0, 1,
-1.877943, 0.2964661, -3.257888, 1, 0.1803922, 0, 1,
-1.876812, 0.5374425, -1.243928, 1, 0.1843137, 0, 1,
-1.84676, 0.418961, -0.2171502, 1, 0.1921569, 0, 1,
-1.83879, -0.6042231, -3.408186, 1, 0.1960784, 0, 1,
-1.813823, 1.672496, -0.1267835, 1, 0.2039216, 0, 1,
-1.802894, 1.043062, -0.5326642, 1, 0.2117647, 0, 1,
-1.794685, -1.267922, -3.122258, 1, 0.2156863, 0, 1,
-1.781162, 0.5876374, -1.40946, 1, 0.2235294, 0, 1,
-1.753182, 0.653345, 0.0150729, 1, 0.227451, 0, 1,
-1.738868, -0.5649688, -2.005565, 1, 0.2352941, 0, 1,
-1.723226, 0.3730808, -2.320448, 1, 0.2392157, 0, 1,
-1.719746, -0.8446403, -3.586499, 1, 0.2470588, 0, 1,
-1.713479, 0.4916045, -1.376342, 1, 0.2509804, 0, 1,
-1.705107, -2.648616, -3.584552, 1, 0.2588235, 0, 1,
-1.690065, -0.3144228, -0.2110877, 1, 0.2627451, 0, 1,
-1.689881, -0.5940759, 1.134539, 1, 0.2705882, 0, 1,
-1.680312, 1.426462, 0.9674526, 1, 0.2745098, 0, 1,
-1.678682, -0.001482712, -3.084918, 1, 0.282353, 0, 1,
-1.678477, 1.022198, -0.7025968, 1, 0.2862745, 0, 1,
-1.678266, 0.8432858, -2.065016, 1, 0.2941177, 0, 1,
-1.660453, -0.2184116, -1.569598, 1, 0.3019608, 0, 1,
-1.651744, -0.2985808, -2.021119, 1, 0.3058824, 0, 1,
-1.642637, 0.4177799, -2.012688, 1, 0.3137255, 0, 1,
-1.638206, -0.4443561, -1.161633, 1, 0.3176471, 0, 1,
-1.634522, 1.125597, -0.5664491, 1, 0.3254902, 0, 1,
-1.618614, -0.1383805, 1.730711, 1, 0.3294118, 0, 1,
-1.618451, -0.4176942, -1.93009, 1, 0.3372549, 0, 1,
-1.61747, 0.6698866, -0.794444, 1, 0.3411765, 0, 1,
-1.611364, -2.756937, -2.356487, 1, 0.3490196, 0, 1,
-1.609101, -1.669564, -2.488139, 1, 0.3529412, 0, 1,
-1.602865, -1.819335, -2.741834, 1, 0.3607843, 0, 1,
-1.600468, -0.5821736, -2.279939, 1, 0.3647059, 0, 1,
-1.559399, -0.564113, -1.064516, 1, 0.372549, 0, 1,
-1.541976, -1.021429, -2.597765, 1, 0.3764706, 0, 1,
-1.541839, 0.3544945, -1.643613, 1, 0.3843137, 0, 1,
-1.535387, -0.05402119, -1.100996, 1, 0.3882353, 0, 1,
-1.532641, -0.4136584, -2.547248, 1, 0.3960784, 0, 1,
-1.520428, -0.7161154, -1.85515, 1, 0.4039216, 0, 1,
-1.517992, -0.07444599, -2.987637, 1, 0.4078431, 0, 1,
-1.494631, 0.2230816, -1.795083, 1, 0.4156863, 0, 1,
-1.476348, -1.323905, -3.362213, 1, 0.4196078, 0, 1,
-1.475763, 1.543936, -0.01123748, 1, 0.427451, 0, 1,
-1.474641, 0.07260526, -2.129442, 1, 0.4313726, 0, 1,
-1.470576, -2.076266, -3.477073, 1, 0.4392157, 0, 1,
-1.467634, 0.002917964, -1.928259, 1, 0.4431373, 0, 1,
-1.461138, 1.044676, -0.2212848, 1, 0.4509804, 0, 1,
-1.450979, 0.3262711, -1.387558, 1, 0.454902, 0, 1,
-1.442583, 0.1268015, 0.5130284, 1, 0.4627451, 0, 1,
-1.439465, 1.082193, 0.5615342, 1, 0.4666667, 0, 1,
-1.438204, 0.46484, -0.665202, 1, 0.4745098, 0, 1,
-1.430216, -0.9763706, -1.469448, 1, 0.4784314, 0, 1,
-1.429986, -1.653896, -1.626811, 1, 0.4862745, 0, 1,
-1.428945, -0.7760857, -1.434715, 1, 0.4901961, 0, 1,
-1.426522, 1.671657, -1.946647, 1, 0.4980392, 0, 1,
-1.424448, -0.9598111, -3.410526, 1, 0.5058824, 0, 1,
-1.38634, 0.2938549, 0.004500172, 1, 0.509804, 0, 1,
-1.371033, 0.7717776, -0.6445366, 1, 0.5176471, 0, 1,
-1.370173, 1.617565, -0.1821515, 1, 0.5215687, 0, 1,
-1.368831, -0.8564099, -2.023251, 1, 0.5294118, 0, 1,
-1.363088, 0.4605037, -2.24938, 1, 0.5333334, 0, 1,
-1.361695, 0.3207225, -0.7652268, 1, 0.5411765, 0, 1,
-1.332518, -0.2674336, -1.371808, 1, 0.5450981, 0, 1,
-1.329136, 2.068958, -1.259601, 1, 0.5529412, 0, 1,
-1.320043, -0.2639881, -2.225798, 1, 0.5568628, 0, 1,
-1.317569, 1.557646, 0.4696667, 1, 0.5647059, 0, 1,
-1.317124, 0.390314, -1.074067, 1, 0.5686275, 0, 1,
-1.31421, 0.8168344, -0.428347, 1, 0.5764706, 0, 1,
-1.311804, -0.7236264, -3.379397, 1, 0.5803922, 0, 1,
-1.310897, 1.563676, -2.122271, 1, 0.5882353, 0, 1,
-1.305806, -0.2509156, -1.741598, 1, 0.5921569, 0, 1,
-1.294996, 0.9136885, -1.392209, 1, 0.6, 0, 1,
-1.293318, -0.7665631, -0.9870359, 1, 0.6078432, 0, 1,
-1.291078, -1.797058, -0.8233432, 1, 0.6117647, 0, 1,
-1.283282, 1.998082, -0.3955913, 1, 0.6196079, 0, 1,
-1.278697, 1.270147, 1.183507, 1, 0.6235294, 0, 1,
-1.274433, -0.1569346, 0.0867432, 1, 0.6313726, 0, 1,
-1.25959, 1.297874, -1.294219, 1, 0.6352941, 0, 1,
-1.247652, -1.057773, -2.256032, 1, 0.6431373, 0, 1,
-1.242871, -0.2626906, -2.530438, 1, 0.6470588, 0, 1,
-1.237428, 0.191752, -1.476591, 1, 0.654902, 0, 1,
-1.233412, 1.288879, -0.8005401, 1, 0.6588235, 0, 1,
-1.225402, -1.042568, -2.514898, 1, 0.6666667, 0, 1,
-1.222473, -0.4516737, -2.253748, 1, 0.6705883, 0, 1,
-1.216127, 0.9310371, -1.463256, 1, 0.6784314, 0, 1,
-1.207192, -0.70391, -1.740889, 1, 0.682353, 0, 1,
-1.199696, -1.161492, -3.915536, 1, 0.6901961, 0, 1,
-1.199005, 0.06519156, 0.2223539, 1, 0.6941177, 0, 1,
-1.196508, -1.387904, -2.330892, 1, 0.7019608, 0, 1,
-1.192858, -0.05622619, -1.966689, 1, 0.7098039, 0, 1,
-1.180556, 1.072198, 0.01963459, 1, 0.7137255, 0, 1,
-1.178185, -0.01303608, -1.190353, 1, 0.7215686, 0, 1,
-1.177621, -0.1917471, -3.740579, 1, 0.7254902, 0, 1,
-1.176582, 0.7867113, -2.641531, 1, 0.7333333, 0, 1,
-1.168367, 1.00848, -1.284187, 1, 0.7372549, 0, 1,
-1.167575, 0.7294603, 0.1283444, 1, 0.7450981, 0, 1,
-1.163914, -1.208613, -1.644402, 1, 0.7490196, 0, 1,
-1.161221, 0.429826, -0.6687973, 1, 0.7568628, 0, 1,
-1.161083, 1.334749, -1.401666, 1, 0.7607843, 0, 1,
-1.153429, -1.317801, -3.242931, 1, 0.7686275, 0, 1,
-1.152729, 0.8335495, -0.4477966, 1, 0.772549, 0, 1,
-1.151296, -0.2190617, -1.265404, 1, 0.7803922, 0, 1,
-1.150942, 0.644384, 1.052197, 1, 0.7843137, 0, 1,
-1.147026, 0.2879052, 0.7638523, 1, 0.7921569, 0, 1,
-1.132633, 0.0810321, -1.049801, 1, 0.7960784, 0, 1,
-1.125402, -0.57094, -2.536686, 1, 0.8039216, 0, 1,
-1.125093, -0.0300664, -1.680897, 1, 0.8117647, 0, 1,
-1.124195, 0.8126234, -1.071292, 1, 0.8156863, 0, 1,
-1.120705, -0.3056791, -0.5936427, 1, 0.8235294, 0, 1,
-1.119959, -0.04405263, -0.6701558, 1, 0.827451, 0, 1,
-1.118614, -1.181587, -2.375256, 1, 0.8352941, 0, 1,
-1.116393, 0.8596298, -0.4773054, 1, 0.8392157, 0, 1,
-1.112916, -0.6597054, -1.755801, 1, 0.8470588, 0, 1,
-1.112839, 1.015319, -0.09552039, 1, 0.8509804, 0, 1,
-1.108297, -0.5019624, -2.164876, 1, 0.8588235, 0, 1,
-1.105168, 0.1330341, -1.603208, 1, 0.8627451, 0, 1,
-1.101623, 0.4649037, -0.2370357, 1, 0.8705882, 0, 1,
-1.100935, 0.6731097, -2.050668, 1, 0.8745098, 0, 1,
-1.094838, -0.2734538, -1.725078, 1, 0.8823529, 0, 1,
-1.090987, -0.4160007, -2.3086, 1, 0.8862745, 0, 1,
-1.086243, 1.46971, -0.9485809, 1, 0.8941177, 0, 1,
-1.079471, -1.492009, -3.782832, 1, 0.8980392, 0, 1,
-1.076283, -0.1885751, -0.8860896, 1, 0.9058824, 0, 1,
-1.07266, 0.582818, -0.3685459, 1, 0.9137255, 0, 1,
-1.067499, -1.902724, -2.182406, 1, 0.9176471, 0, 1,
-1.065779, -0.5815645, -2.325035, 1, 0.9254902, 0, 1,
-1.065056, 1.255217, -0.7005069, 1, 0.9294118, 0, 1,
-1.056745, 1.225427, 0.6983362, 1, 0.9372549, 0, 1,
-1.05441, 1.504006, -1.90362, 1, 0.9411765, 0, 1,
-1.048887, 1.132492, -2.229514, 1, 0.9490196, 0, 1,
-1.046147, -0.9753346, -1.202383, 1, 0.9529412, 0, 1,
-1.042628, -1.242193, -1.806712, 1, 0.9607843, 0, 1,
-1.031288, -1.565481, -1.456013, 1, 0.9647059, 0, 1,
-1.029024, -0.6474003, -3.10039, 1, 0.972549, 0, 1,
-1.027728, 0.9053009, -0.8582842, 1, 0.9764706, 0, 1,
-1.025776, -1.382057, -2.847048, 1, 0.9843137, 0, 1,
-1.023327, 1.256424, -0.4573153, 1, 0.9882353, 0, 1,
-1.022287, -1.552708, -5.308799, 1, 0.9960784, 0, 1,
-1.022031, 0.4599057, -0.2525062, 0.9960784, 1, 0, 1,
-1.014431, 0.1061675, 0.02107332, 0.9921569, 1, 0, 1,
-1.004955, -0.4650878, -1.443808, 0.9843137, 1, 0, 1,
-1.00066, 1.027314, -0.5774302, 0.9803922, 1, 0, 1,
-0.9950464, 1.080063, -0.3079145, 0.972549, 1, 0, 1,
-0.994223, 0.6334376, -1.356019, 0.9686275, 1, 0, 1,
-0.9940459, -0.03037217, -1.70448, 0.9607843, 1, 0, 1,
-0.9889402, -2.414633, -1.965434, 0.9568627, 1, 0, 1,
-0.9868978, 1.005921, -1.708153, 0.9490196, 1, 0, 1,
-0.9810287, 0.1979474, -0.02475526, 0.945098, 1, 0, 1,
-0.9707857, 0.7588666, -1.430073, 0.9372549, 1, 0, 1,
-0.9703352, -2.714796, -3.746615, 0.9333333, 1, 0, 1,
-0.9579355, -1.091382, -2.403668, 0.9254902, 1, 0, 1,
-0.9569338, 0.4286882, -1.470616, 0.9215686, 1, 0, 1,
-0.9536374, 2.027641, -2.989804, 0.9137255, 1, 0, 1,
-0.9487417, -0.3837325, -2.288456, 0.9098039, 1, 0, 1,
-0.947361, 0.8563504, -0.6486096, 0.9019608, 1, 0, 1,
-0.9351069, 1.036872, -0.6967615, 0.8941177, 1, 0, 1,
-0.934338, -1.763754, -1.68705, 0.8901961, 1, 0, 1,
-0.9329212, -0.09470294, -2.140506, 0.8823529, 1, 0, 1,
-0.929748, 0.2695579, -0.1589032, 0.8784314, 1, 0, 1,
-0.9241057, -1.832001, -2.77618, 0.8705882, 1, 0, 1,
-0.9146692, 0.4053202, -0.9971316, 0.8666667, 1, 0, 1,
-0.9116248, -0.9169661, -2.148396, 0.8588235, 1, 0, 1,
-0.9081695, 0.01247259, -2.011493, 0.854902, 1, 0, 1,
-0.8992954, -0.7979875, -3.980657, 0.8470588, 1, 0, 1,
-0.8988105, 0.0600674, -2.181958, 0.8431373, 1, 0, 1,
-0.8930882, -1.175009, -3.276018, 0.8352941, 1, 0, 1,
-0.8930689, -0.0658547, -1.655995, 0.8313726, 1, 0, 1,
-0.8928714, -0.3083544, -2.120818, 0.8235294, 1, 0, 1,
-0.8893892, 0.04342935, 0.06845336, 0.8196079, 1, 0, 1,
-0.8848063, -0.7852422, -3.035236, 0.8117647, 1, 0, 1,
-0.8817381, 1.021418, -0.963292, 0.8078431, 1, 0, 1,
-0.8812868, 0.5579651, -0.9271402, 0.8, 1, 0, 1,
-0.8775312, 0.5003036, -3.312419, 0.7921569, 1, 0, 1,
-0.8755759, -0.5846375, -2.89801, 0.7882353, 1, 0, 1,
-0.871627, 0.644316, -1.419834, 0.7803922, 1, 0, 1,
-0.8648695, 0.9357035, -0.3574521, 0.7764706, 1, 0, 1,
-0.8569852, 0.04322763, -3.154997, 0.7686275, 1, 0, 1,
-0.8538254, -1.663787, -2.710136, 0.7647059, 1, 0, 1,
-0.8460473, 0.5874853, 0.07798709, 0.7568628, 1, 0, 1,
-0.8458725, 1.105906, -1.781202, 0.7529412, 1, 0, 1,
-0.844016, 0.725062, -0.172378, 0.7450981, 1, 0, 1,
-0.8429887, 1.714855, -0.3558709, 0.7411765, 1, 0, 1,
-0.8379374, -0.9293026, -2.803742, 0.7333333, 1, 0, 1,
-0.8357112, 0.3186618, -1.694421, 0.7294118, 1, 0, 1,
-0.8263609, -1.44253, -2.898042, 0.7215686, 1, 0, 1,
-0.8261729, 0.6544893, -1.941178, 0.7176471, 1, 0, 1,
-0.8253981, -0.730747, -2.183753, 0.7098039, 1, 0, 1,
-0.8251088, 0.1925026, -1.389481, 0.7058824, 1, 0, 1,
-0.8244335, -2.075098, -3.850916, 0.6980392, 1, 0, 1,
-0.811082, -0.3509111, -1.935382, 0.6901961, 1, 0, 1,
-0.8100666, 1.074072, -1.511192, 0.6862745, 1, 0, 1,
-0.8077207, -0.8062566, -2.354205, 0.6784314, 1, 0, 1,
-0.8052823, -0.0498706, -1.980783, 0.6745098, 1, 0, 1,
-0.802771, -0.4470507, -2.500298, 0.6666667, 1, 0, 1,
-0.8027549, 0.483979, 0.9800196, 0.6627451, 1, 0, 1,
-0.7989218, 0.9390033, -0.1514514, 0.654902, 1, 0, 1,
-0.7984816, 0.6539201, 0.4117973, 0.6509804, 1, 0, 1,
-0.7983158, -1.885446, -2.974261, 0.6431373, 1, 0, 1,
-0.7950332, -0.8041475, -1.130212, 0.6392157, 1, 0, 1,
-0.7896708, 0.3951885, -2.039545, 0.6313726, 1, 0, 1,
-0.7854255, -1.165341, -1.440587, 0.627451, 1, 0, 1,
-0.7734862, 1.344974, 0.4201729, 0.6196079, 1, 0, 1,
-0.7713447, -0.2612302, -1.443434, 0.6156863, 1, 0, 1,
-0.7702632, 0.1270421, -1.322851, 0.6078432, 1, 0, 1,
-0.7673551, 1.06896, 0.8345108, 0.6039216, 1, 0, 1,
-0.7657866, -0.7944338, -2.511601, 0.5960785, 1, 0, 1,
-0.7619393, -0.6866048, -1.446311, 0.5882353, 1, 0, 1,
-0.7607614, 0.6673478, -0.4556076, 0.5843138, 1, 0, 1,
-0.7604938, -0.06684817, -2.68166, 0.5764706, 1, 0, 1,
-0.7585769, 0.9584571, -0.3202511, 0.572549, 1, 0, 1,
-0.7565442, 0.491469, 0.3719304, 0.5647059, 1, 0, 1,
-0.7530937, 1.103843, -2.166634, 0.5607843, 1, 0, 1,
-0.7517189, 0.4130562, -1.35653, 0.5529412, 1, 0, 1,
-0.7504716, 0.8707693, -0.7706411, 0.5490196, 1, 0, 1,
-0.7487664, -0.1512191, -0.1686945, 0.5411765, 1, 0, 1,
-0.745004, -1.777205, -2.607688, 0.5372549, 1, 0, 1,
-0.7349048, -0.3306362, -2.092671, 0.5294118, 1, 0, 1,
-0.7270107, 0.9016217, -3.21652, 0.5254902, 1, 0, 1,
-0.7264032, 0.1304882, -2.141387, 0.5176471, 1, 0, 1,
-0.7263679, -0.544746, -3.874138, 0.5137255, 1, 0, 1,
-0.7202315, 0.9238899, -0.2209499, 0.5058824, 1, 0, 1,
-0.7165543, 1.335696, -1.21085, 0.5019608, 1, 0, 1,
-0.7095271, 1.426309, -0.9783902, 0.4941176, 1, 0, 1,
-0.7090122, -0.8422744, -2.221412, 0.4862745, 1, 0, 1,
-0.7083263, 1.327569, -1.122275, 0.4823529, 1, 0, 1,
-0.7067978, 1.286478, 1.232093, 0.4745098, 1, 0, 1,
-0.6991352, -0.9474396, -2.140354, 0.4705882, 1, 0, 1,
-0.6984815, -1.315226, -2.89342, 0.4627451, 1, 0, 1,
-0.6928769, 0.8331264, -0.5546424, 0.4588235, 1, 0, 1,
-0.6927388, -0.5370032, -1.817806, 0.4509804, 1, 0, 1,
-0.6917145, 0.9609534, -1.214764, 0.4470588, 1, 0, 1,
-0.6891276, 0.8266968, -1.259965, 0.4392157, 1, 0, 1,
-0.6798449, -0.3980081, -4.371677, 0.4352941, 1, 0, 1,
-0.6796548, 1.010082, -0.3821452, 0.427451, 1, 0, 1,
-0.6793776, 1.361509, 1.491682, 0.4235294, 1, 0, 1,
-0.6778405, 0.1434866, -1.021511, 0.4156863, 1, 0, 1,
-0.6763297, -0.08893325, -2.164308, 0.4117647, 1, 0, 1,
-0.672559, -0.1460244, -1.622773, 0.4039216, 1, 0, 1,
-0.6657917, -0.7022606, -3.856601, 0.3960784, 1, 0, 1,
-0.6648962, -0.2821755, -1.466724, 0.3921569, 1, 0, 1,
-0.6641803, -1.765765, -0.84982, 0.3843137, 1, 0, 1,
-0.6630765, 0.2229696, -0.6124098, 0.3803922, 1, 0, 1,
-0.6562822, -1.321669, -2.139948, 0.372549, 1, 0, 1,
-0.6557255, 0.6532111, -0.1612671, 0.3686275, 1, 0, 1,
-0.6553918, -0.3101608, -1.116004, 0.3607843, 1, 0, 1,
-0.6550799, 0.03172798, -0.3415229, 0.3568628, 1, 0, 1,
-0.6397594, -0.638021, -3.454332, 0.3490196, 1, 0, 1,
-0.6366948, -0.9577366, -1.60887, 0.345098, 1, 0, 1,
-0.6357923, 1.341845, 2.295098, 0.3372549, 1, 0, 1,
-0.6324087, -0.9311193, -2.119876, 0.3333333, 1, 0, 1,
-0.6321127, -0.2601838, -1.152479, 0.3254902, 1, 0, 1,
-0.6311081, 0.834483, -1.705549, 0.3215686, 1, 0, 1,
-0.6257522, 1.645639, 0.3265008, 0.3137255, 1, 0, 1,
-0.6255392, 1.27405, 1.031208, 0.3098039, 1, 0, 1,
-0.6239187, 1.436569, -0.3188839, 0.3019608, 1, 0, 1,
-0.6201742, -0.8110584, -1.668463, 0.2941177, 1, 0, 1,
-0.6175178, 0.8656214, -0.4872116, 0.2901961, 1, 0, 1,
-0.6171933, -0.7234863, -3.31681, 0.282353, 1, 0, 1,
-0.6171001, 0.1287721, -1.826249, 0.2784314, 1, 0, 1,
-0.61369, 0.6642219, 0.1078849, 0.2705882, 1, 0, 1,
-0.6119761, 1.584107, 0.03851758, 0.2666667, 1, 0, 1,
-0.6063739, -1.800689, -1.824202, 0.2588235, 1, 0, 1,
-0.5951111, 1.16057, -0.02193192, 0.254902, 1, 0, 1,
-0.5943189, 1.248582, -0.6101686, 0.2470588, 1, 0, 1,
-0.5799907, -1.351159, -1.427666, 0.2431373, 1, 0, 1,
-0.5758145, -1.446032, -4.110501, 0.2352941, 1, 0, 1,
-0.5709336, 1.025022, 0.2856264, 0.2313726, 1, 0, 1,
-0.5694064, 1.351208, 0.1344484, 0.2235294, 1, 0, 1,
-0.5672272, 0.3001513, -2.57487, 0.2196078, 1, 0, 1,
-0.5663258, 0.6836754, -0.654339, 0.2117647, 1, 0, 1,
-0.5568628, 0.7746966, 0.2777578, 0.2078431, 1, 0, 1,
-0.5565314, 0.9643489, -0.9336829, 0.2, 1, 0, 1,
-0.5553676, 0.570451, -0.6204776, 0.1921569, 1, 0, 1,
-0.5545409, -0.6301596, -1.626412, 0.1882353, 1, 0, 1,
-0.5473833, 1.08303, -0.3660378, 0.1803922, 1, 0, 1,
-0.5431533, -0.7892461, -3.668246, 0.1764706, 1, 0, 1,
-0.5423853, -1.110018, -2.341277, 0.1686275, 1, 0, 1,
-0.5419329, 0.9020987, -0.3763269, 0.1647059, 1, 0, 1,
-0.5377427, 0.4806572, -0.233489, 0.1568628, 1, 0, 1,
-0.5370136, 0.003722784, -1.021442, 0.1529412, 1, 0, 1,
-0.5311389, -0.07246261, -1.354388, 0.145098, 1, 0, 1,
-0.5278053, 0.7498943, 1.489209, 0.1411765, 1, 0, 1,
-0.5260323, 1.098605, 0.8179033, 0.1333333, 1, 0, 1,
-0.5195054, 0.1068398, -2.332195, 0.1294118, 1, 0, 1,
-0.5184303, 0.07334301, -2.310744, 0.1215686, 1, 0, 1,
-0.5061797, 1.828259, -0.8916701, 0.1176471, 1, 0, 1,
-0.4996776, -0.279413, -3.482699, 0.1098039, 1, 0, 1,
-0.4963515, 0.329208, -0.01720281, 0.1058824, 1, 0, 1,
-0.4938544, -0.4156211, -3.769403, 0.09803922, 1, 0, 1,
-0.4913457, 0.4515613, -1.103036, 0.09019608, 1, 0, 1,
-0.4897344, 0.99661, -1.059172, 0.08627451, 1, 0, 1,
-0.4897084, 0.07477966, -2.706709, 0.07843138, 1, 0, 1,
-0.4887735, -0.5516409, -2.444521, 0.07450981, 1, 0, 1,
-0.4841022, 1.135492, -1.390731, 0.06666667, 1, 0, 1,
-0.4818611, 1.077719, -0.6435074, 0.0627451, 1, 0, 1,
-0.4805404, -2.232001, -2.52362, 0.05490196, 1, 0, 1,
-0.476955, 1.683005, 0.02424911, 0.05098039, 1, 0, 1,
-0.474191, -1.076568, -4.470652, 0.04313726, 1, 0, 1,
-0.4726496, 0.5949816, -1.919937, 0.03921569, 1, 0, 1,
-0.4700432, -0.9450936, -4.455315, 0.03137255, 1, 0, 1,
-0.4691547, 0.6077398, -1.537049, 0.02745098, 1, 0, 1,
-0.4642001, -0.5194799, -2.65429, 0.01960784, 1, 0, 1,
-0.4583364, 1.685153, -0.8037938, 0.01568628, 1, 0, 1,
-0.4556912, 0.6454829, 1.583162, 0.007843138, 1, 0, 1,
-0.4546978, -0.1411415, -1.125224, 0.003921569, 1, 0, 1,
-0.45202, 1.190976, -0.2222619, 0, 1, 0.003921569, 1,
-0.4519063, -0.6593097, -3.130666, 0, 1, 0.01176471, 1,
-0.4429803, 0.9228032, 0.4784568, 0, 1, 0.01568628, 1,
-0.4424895, -0.1157161, -0.6171234, 0, 1, 0.02352941, 1,
-0.4418008, 1.490387, -0.8583974, 0, 1, 0.02745098, 1,
-0.4305882, 0.467624, -0.7477517, 0, 1, 0.03529412, 1,
-0.4263557, 0.3745216, -2.406631, 0, 1, 0.03921569, 1,
-0.4258453, 0.7173195, -1.029887, 0, 1, 0.04705882, 1,
-0.4255637, 0.1546893, 0.5584576, 0, 1, 0.05098039, 1,
-0.4183256, -1.330456, -2.739768, 0, 1, 0.05882353, 1,
-0.4172387, -0.007530147, -1.239275, 0, 1, 0.0627451, 1,
-0.4127646, 1.218275, 0.1669756, 0, 1, 0.07058824, 1,
-0.4097161, 0.2314298, 0.009396596, 0, 1, 0.07450981, 1,
-0.4094095, 3.244178, -1.137647, 0, 1, 0.08235294, 1,
-0.4088994, -0.778639, -4.447616, 0, 1, 0.08627451, 1,
-0.4087856, 1.544203, 0.7028496, 0, 1, 0.09411765, 1,
-0.407389, -1.097126, -3.085988, 0, 1, 0.1019608, 1,
-0.4056151, 0.4226314, -1.233851, 0, 1, 0.1058824, 1,
-0.4048729, -0.6358167, -0.3235571, 0, 1, 0.1137255, 1,
-0.4029269, 0.4734468, -1.115421, 0, 1, 0.1176471, 1,
-0.3957388, 0.8914595, 0.8436416, 0, 1, 0.1254902, 1,
-0.3948939, -0.5732119, -2.024004, 0, 1, 0.1294118, 1,
-0.3929093, -0.1272011, -1.82449, 0, 1, 0.1372549, 1,
-0.3885404, 1.217447, 0.4327944, 0, 1, 0.1411765, 1,
-0.3855662, -0.2382617, -1.435218, 0, 1, 0.1490196, 1,
-0.3829812, -1.598157, -4.402407, 0, 1, 0.1529412, 1,
-0.3799773, 0.5684358, -1.830408, 0, 1, 0.1607843, 1,
-0.379346, 1.113064, -0.2090283, 0, 1, 0.1647059, 1,
-0.3787286, -0.880473, -3.274016, 0, 1, 0.172549, 1,
-0.3774793, -0.432993, -2.611875, 0, 1, 0.1764706, 1,
-0.3769015, -0.04550591, -1.776041, 0, 1, 0.1843137, 1,
-0.3710892, -0.4033677, -2.55894, 0, 1, 0.1882353, 1,
-0.3687464, 0.1350033, -0.2785708, 0, 1, 0.1960784, 1,
-0.3678609, -0.001496183, -1.495702, 0, 1, 0.2039216, 1,
-0.3674624, -0.5990392, -2.694707, 0, 1, 0.2078431, 1,
-0.3655638, -1.554897, -2.604948, 0, 1, 0.2156863, 1,
-0.3636487, 0.5773054, 0.1891845, 0, 1, 0.2196078, 1,
-0.3617807, -0.4494584, -3.248229, 0, 1, 0.227451, 1,
-0.3614008, -0.1321619, -2.366221, 0, 1, 0.2313726, 1,
-0.3559963, -0.1992193, -3.038675, 0, 1, 0.2392157, 1,
-0.355599, -0.5228687, -3.856404, 0, 1, 0.2431373, 1,
-0.3541747, 1.580795, 1.487706, 0, 1, 0.2509804, 1,
-0.3541377, 0.1888939, -1.786171, 0, 1, 0.254902, 1,
-0.3502916, 3.828596, -2.502871, 0, 1, 0.2627451, 1,
-0.3487445, 0.6201958, -1.146617, 0, 1, 0.2666667, 1,
-0.33582, 0.1431961, -1.163216, 0, 1, 0.2745098, 1,
-0.3340648, 1.29511, -1.268637, 0, 1, 0.2784314, 1,
-0.3288625, 1.316017, 1.48265, 0, 1, 0.2862745, 1,
-0.3267787, -1.678957, -3.715638, 0, 1, 0.2901961, 1,
-0.3254794, 0.0297016, -1.476625, 0, 1, 0.2980392, 1,
-0.322153, -2.071904, -3.486661, 0, 1, 0.3058824, 1,
-0.3211134, 0.4849691, -0.5836573, 0, 1, 0.3098039, 1,
-0.3192843, 0.640565, 0.6936312, 0, 1, 0.3176471, 1,
-0.3192559, -0.199827, -0.7852883, 0, 1, 0.3215686, 1,
-0.3085466, 1.263342, -1.791128, 0, 1, 0.3294118, 1,
-0.3080186, -0.6352013, -3.500108, 0, 1, 0.3333333, 1,
-0.2986003, 0.7922677, -1.604715, 0, 1, 0.3411765, 1,
-0.2974193, 0.06775037, -1.554516, 0, 1, 0.345098, 1,
-0.2949416, -0.5804369, -1.576374, 0, 1, 0.3529412, 1,
-0.2931626, -0.2245227, -0.3685938, 0, 1, 0.3568628, 1,
-0.2898922, 0.4424144, -0.7837234, 0, 1, 0.3647059, 1,
-0.2788376, -0.1737017, -1.498374, 0, 1, 0.3686275, 1,
-0.2787209, 0.5387306, -0.01596449, 0, 1, 0.3764706, 1,
-0.2769423, 1.182454, 0.5170707, 0, 1, 0.3803922, 1,
-0.2768316, 0.9847317, 0.7942302, 0, 1, 0.3882353, 1,
-0.2752226, 0.1681668, -1.31897, 0, 1, 0.3921569, 1,
-0.2724769, -0.2035685, -4.167825, 0, 1, 0.4, 1,
-0.272337, -0.9766088, -2.505507, 0, 1, 0.4078431, 1,
-0.2718499, -1.320306, -2.910084, 0, 1, 0.4117647, 1,
-0.2636114, -1.904281, -2.589043, 0, 1, 0.4196078, 1,
-0.2589437, 0.9184238, 1.297264, 0, 1, 0.4235294, 1,
-0.2540163, -0.1469296, -3.738259, 0, 1, 0.4313726, 1,
-0.2516704, 0.1923573, -0.1170673, 0, 1, 0.4352941, 1,
-0.2489381, -0.1951885, -1.993725, 0, 1, 0.4431373, 1,
-0.2444259, -0.2717024, -2.06485, 0, 1, 0.4470588, 1,
-0.2357279, 0.2803825, 1.13496, 0, 1, 0.454902, 1,
-0.2338842, -0.6249354, -1.976745, 0, 1, 0.4588235, 1,
-0.2332025, -0.4206655, -2.504992, 0, 1, 0.4666667, 1,
-0.2327453, 0.2555853, 0.6402916, 0, 1, 0.4705882, 1,
-0.2283341, -0.2231955, -2.511433, 0, 1, 0.4784314, 1,
-0.2255732, 0.2738841, -0.5412408, 0, 1, 0.4823529, 1,
-0.2254471, 0.419291, -0.1471429, 0, 1, 0.4901961, 1,
-0.2223565, -2.481233, -3.603096, 0, 1, 0.4941176, 1,
-0.2207985, -0.3546183, -3.99559, 0, 1, 0.5019608, 1,
-0.217484, -0.5180573, -1.367876, 0, 1, 0.509804, 1,
-0.215964, -1.519234, -1.560426, 0, 1, 0.5137255, 1,
-0.2156595, -1.843026, -3.06656, 0, 1, 0.5215687, 1,
-0.215502, -0.07112817, -1.792356, 0, 1, 0.5254902, 1,
-0.2146794, 1.022581, 0.5809433, 0, 1, 0.5333334, 1,
-0.2095968, 1.018753, 0.2155722, 0, 1, 0.5372549, 1,
-0.2047256, 1.449323, 2.627997, 0, 1, 0.5450981, 1,
-0.203474, 0.8217912, 0.08747868, 0, 1, 0.5490196, 1,
-0.2006489, 0.7599207, 0.6762997, 0, 1, 0.5568628, 1,
-0.1975071, -1.787665, -2.137954, 0, 1, 0.5607843, 1,
-0.1971113, -0.7852068, -1.629141, 0, 1, 0.5686275, 1,
-0.1953236, 0.04744725, -0.8087903, 0, 1, 0.572549, 1,
-0.1937382, -1.43888, -3.389052, 0, 1, 0.5803922, 1,
-0.191389, 0.7416035, -0.6615318, 0, 1, 0.5843138, 1,
-0.1850578, -1.16756, -2.119868, 0, 1, 0.5921569, 1,
-0.1777647, -0.8793087, -4.532036, 0, 1, 0.5960785, 1,
-0.1769477, -2.56705, -1.460989, 0, 1, 0.6039216, 1,
-0.1766407, 0.7132379, -1.640931, 0, 1, 0.6117647, 1,
-0.1732601, 0.6772277, -0.6248147, 0, 1, 0.6156863, 1,
-0.1716604, -0.657507, -3.998106, 0, 1, 0.6235294, 1,
-0.169136, 1.645195, -0.4220817, 0, 1, 0.627451, 1,
-0.1690597, -0.6695361, -1.652035, 0, 1, 0.6352941, 1,
-0.1675571, 0.3952782, -2.175807, 0, 1, 0.6392157, 1,
-0.1648764, -1.595547, -4.161914, 0, 1, 0.6470588, 1,
-0.1648266, -0.7344164, -3.076508, 0, 1, 0.6509804, 1,
-0.1624892, -0.4538856, -3.322637, 0, 1, 0.6588235, 1,
-0.1574145, -0.4267711, -3.40701, 0, 1, 0.6627451, 1,
-0.1479387, -0.6860789, -4.709773, 0, 1, 0.6705883, 1,
-0.1455096, 0.7796657, 0.07765914, 0, 1, 0.6745098, 1,
-0.1439429, -1.57595, -3.474727, 0, 1, 0.682353, 1,
-0.1425509, 0.7458761, 0.540522, 0, 1, 0.6862745, 1,
-0.1410822, -0.7872533, -3.4852, 0, 1, 0.6941177, 1,
-0.1371523, 0.6054969, -0.4501875, 0, 1, 0.7019608, 1,
-0.1363266, -1.776114, -4.840741, 0, 1, 0.7058824, 1,
-0.1357498, -0.5965165, -1.326795, 0, 1, 0.7137255, 1,
-0.1348855, -1.311522, -2.467797, 0, 1, 0.7176471, 1,
-0.1345126, 1.06829, -1.497178, 0, 1, 0.7254902, 1,
-0.1326732, -0.2296453, -3.433653, 0, 1, 0.7294118, 1,
-0.1320087, -0.5975925, -2.373881, 0, 1, 0.7372549, 1,
-0.1303706, -1.172266, -2.220078, 0, 1, 0.7411765, 1,
-0.1216852, -1.505701, -2.928834, 0, 1, 0.7490196, 1,
-0.120109, -0.3490036, -2.19569, 0, 1, 0.7529412, 1,
-0.1157475, -0.9110426, -3.187874, 0, 1, 0.7607843, 1,
-0.1156136, 0.1533062, 0.8043903, 0, 1, 0.7647059, 1,
-0.1110573, -0.8912629, -2.651124, 0, 1, 0.772549, 1,
-0.1077652, 0.8972584, 0.08222038, 0, 1, 0.7764706, 1,
-0.1074549, -1.277585, -4.126823, 0, 1, 0.7843137, 1,
-0.1063645, 0.06215894, -2.430306, 0, 1, 0.7882353, 1,
-0.105248, -0.6148501, -4.727741, 0, 1, 0.7960784, 1,
-0.1008602, 0.8221697, 1.28597, 0, 1, 0.8039216, 1,
-0.1000927, -0.3648013, -1.63899, 0, 1, 0.8078431, 1,
-0.09890994, 1.197614, 1.009039, 0, 1, 0.8156863, 1,
-0.09833462, -1.308515, -5.645872, 0, 1, 0.8196079, 1,
-0.09382347, 0.1906598, 0.5139053, 0, 1, 0.827451, 1,
-0.08966188, -1.360206, -2.678479, 0, 1, 0.8313726, 1,
-0.08935806, 1.091919, -0.9928895, 0, 1, 0.8392157, 1,
-0.08760667, -0.3863687, -3.497178, 0, 1, 0.8431373, 1,
-0.08745411, -1.312418, -1.907521, 0, 1, 0.8509804, 1,
-0.08272747, 0.1731897, -0.9236783, 0, 1, 0.854902, 1,
-0.07461222, 0.6113158, -1.557096, 0, 1, 0.8627451, 1,
-0.07184941, 1.543925, -0.4068005, 0, 1, 0.8666667, 1,
-0.07120901, -1.888618, -4.332623, 0, 1, 0.8745098, 1,
-0.07009087, -0.08255719, -2.507307, 0, 1, 0.8784314, 1,
-0.06960825, 0.6240819, -1.159019, 0, 1, 0.8862745, 1,
-0.06579418, 1.85011, -1.974253, 0, 1, 0.8901961, 1,
-0.06301059, -0.5405914, -3.140339, 0, 1, 0.8980392, 1,
-0.06118481, 0.1329142, -1.373469, 0, 1, 0.9058824, 1,
-0.06046781, -1.711398, -5.269755, 0, 1, 0.9098039, 1,
-0.05984714, 1.474027, 0.3944844, 0, 1, 0.9176471, 1,
-0.05813983, -0.9134041, -2.378556, 0, 1, 0.9215686, 1,
-0.0575267, -0.6305801, -2.157243, 0, 1, 0.9294118, 1,
-0.0535249, -0.7069334, -3.171663, 0, 1, 0.9333333, 1,
-0.04727484, 0.7536926, -0.4869441, 0, 1, 0.9411765, 1,
-0.03827186, 0.6520157, -0.3696976, 0, 1, 0.945098, 1,
-0.03819822, 0.5726497, -0.4491183, 0, 1, 0.9529412, 1,
-0.03287238, -0.1209193, -3.272879, 0, 1, 0.9568627, 1,
-0.03172053, -0.003510744, -2.510398, 0, 1, 0.9647059, 1,
-0.02922522, -1.663244, -3.893365, 0, 1, 0.9686275, 1,
-0.02822211, 0.6926393, -1.959084, 0, 1, 0.9764706, 1,
-0.02206682, 0.6213627, 0.005221414, 0, 1, 0.9803922, 1,
-0.01652737, -0.1724972, -3.1424, 0, 1, 0.9882353, 1,
-0.01270142, 0.6216239, -0.2065614, 0, 1, 0.9921569, 1,
-0.01255607, 1.31359, 0.6475525, 0, 1, 1, 1,
-0.01127039, 0.03968047, 0.3530456, 0, 0.9921569, 1, 1,
-0.009025841, 0.2406401, -2.532341, 0, 0.9882353, 1, 1,
-0.006607066, -0.05582866, -5.035715, 0, 0.9803922, 1, 1,
-0.003748876, -1.643476, -2.200817, 0, 0.9764706, 1, 1,
0.0001160375, -0.7164344, 2.180604, 0, 0.9686275, 1, 1,
0.001363802, 1.165434, -1.683342, 0, 0.9647059, 1, 1,
0.005987539, 0.8153172, 1.995841, 0, 0.9568627, 1, 1,
0.008817605, 0.9886567, 0.5590053, 0, 0.9529412, 1, 1,
0.01137883, -0.8987875, 4.227079, 0, 0.945098, 1, 1,
0.01431089, -0.5680954, 2.667505, 0, 0.9411765, 1, 1,
0.01457213, 0.8643329, -0.5942751, 0, 0.9333333, 1, 1,
0.01467153, -0.123259, 3.144055, 0, 0.9294118, 1, 1,
0.01626864, -0.3815973, 3.158516, 0, 0.9215686, 1, 1,
0.01748359, -1.393039, 2.48076, 0, 0.9176471, 1, 1,
0.01764571, 0.3349027, -0.3869188, 0, 0.9098039, 1, 1,
0.01774032, 0.8218235, -0.6057858, 0, 0.9058824, 1, 1,
0.02362637, 0.7831668, 0.5859591, 0, 0.8980392, 1, 1,
0.02489129, 1.044642, -0.1538474, 0, 0.8901961, 1, 1,
0.02492194, -0.8573459, 4.975705, 0, 0.8862745, 1, 1,
0.02563062, 0.206704, 0.7465043, 0, 0.8784314, 1, 1,
0.02842694, -0.5072384, 3.51547, 0, 0.8745098, 1, 1,
0.03167032, 2.459917, 0.6689849, 0, 0.8666667, 1, 1,
0.03363837, 0.4231713, 2.280971, 0, 0.8627451, 1, 1,
0.0393851, 1.479998, -0.6460786, 0, 0.854902, 1, 1,
0.04066321, 0.2729373, 0.02101902, 0, 0.8509804, 1, 1,
0.04098985, 0.5651789, 0.09019063, 0, 0.8431373, 1, 1,
0.04290509, -1.778784, 3.994297, 0, 0.8392157, 1, 1,
0.0490812, 0.3048813, -0.8717642, 0, 0.8313726, 1, 1,
0.05016638, 0.331486, 1.635532, 0, 0.827451, 1, 1,
0.05182356, 1.978268, -1.463928, 0, 0.8196079, 1, 1,
0.05213188, 0.6714661, -0.4907545, 0, 0.8156863, 1, 1,
0.0548688, -0.09596916, 2.810658, 0, 0.8078431, 1, 1,
0.05953865, 0.3969918, 0.5894384, 0, 0.8039216, 1, 1,
0.06496138, 0.8742135, 0.928603, 0, 0.7960784, 1, 1,
0.06826098, 0.8345836, -1.049156, 0, 0.7882353, 1, 1,
0.06844635, 2.035788, 0.0804384, 0, 0.7843137, 1, 1,
0.07188465, -0.5858437, 1.751806, 0, 0.7764706, 1, 1,
0.07652173, 0.1702638, 0.9289175, 0, 0.772549, 1, 1,
0.07669277, -0.1327881, 4.039149, 0, 0.7647059, 1, 1,
0.07865185, 0.5422564, 0.7380576, 0, 0.7607843, 1, 1,
0.081073, 0.6300905, -1.33139, 0, 0.7529412, 1, 1,
0.08108764, -1.085135, 2.289962, 0, 0.7490196, 1, 1,
0.08293822, -0.2996356, 2.50755, 0, 0.7411765, 1, 1,
0.08432743, 1.788478, 0.592829, 0, 0.7372549, 1, 1,
0.08641985, 0.07225387, 2.556451, 0, 0.7294118, 1, 1,
0.0933707, -0.4667498, 2.131494, 0, 0.7254902, 1, 1,
0.09517273, 0.8894932, 0.6317665, 0, 0.7176471, 1, 1,
0.09607855, 0.5412015, 1.328531, 0, 0.7137255, 1, 1,
0.09750918, 0.07600857, 1.030257, 0, 0.7058824, 1, 1,
0.1007238, 0.8174257, 0.779955, 0, 0.6980392, 1, 1,
0.1025724, -0.8804001, 1.227015, 0, 0.6941177, 1, 1,
0.1040551, -0.05375527, 2.084362, 0, 0.6862745, 1, 1,
0.1078308, -0.4749205, 2.023304, 0, 0.682353, 1, 1,
0.1084154, -0.3531225, 2.827889, 0, 0.6745098, 1, 1,
0.1130206, 0.4473454, -0.3742251, 0, 0.6705883, 1, 1,
0.115312, -0.7408295, 4.019734, 0, 0.6627451, 1, 1,
0.1154281, 0.2096837, 0.9050128, 0, 0.6588235, 1, 1,
0.1165659, -1.497388, 3.069522, 0, 0.6509804, 1, 1,
0.1178993, -1.572223, 2.766814, 0, 0.6470588, 1, 1,
0.118055, 1.073573, -0.4319622, 0, 0.6392157, 1, 1,
0.1186506, -0.196442, 2.083877, 0, 0.6352941, 1, 1,
0.1267436, -0.487713, 2.77105, 0, 0.627451, 1, 1,
0.1304746, 0.1345972, 0.8787843, 0, 0.6235294, 1, 1,
0.1309382, -1.042277, 4.110062, 0, 0.6156863, 1, 1,
0.1328841, 0.8405408, 2.026021, 0, 0.6117647, 1, 1,
0.1415314, -0.6475099, 4.136189, 0, 0.6039216, 1, 1,
0.1434399, 0.8696895, 1.035389, 0, 0.5960785, 1, 1,
0.1459006, 0.4474224, -0.6209008, 0, 0.5921569, 1, 1,
0.1459553, -1.579975, 3.602431, 0, 0.5843138, 1, 1,
0.1527506, 0.3571726, 0.1042777, 0, 0.5803922, 1, 1,
0.16426, 1.842808, -0.08320619, 0, 0.572549, 1, 1,
0.164414, 0.5164506, -1.167582, 0, 0.5686275, 1, 1,
0.1663708, 1.172715, 0.5624624, 0, 0.5607843, 1, 1,
0.1695488, -0.2790706, 3.324032, 0, 0.5568628, 1, 1,
0.1700458, 0.7137731, -1.451089, 0, 0.5490196, 1, 1,
0.1714212, -2.023068, 3.245945, 0, 0.5450981, 1, 1,
0.1795405, 0.7992433, 1.157351, 0, 0.5372549, 1, 1,
0.1799214, -1.361746, 2.799518, 0, 0.5333334, 1, 1,
0.1807866, -0.146554, 1.020335, 0, 0.5254902, 1, 1,
0.1818223, -0.5356005, 2.732969, 0, 0.5215687, 1, 1,
0.1833231, 0.06447347, 1.704806, 0, 0.5137255, 1, 1,
0.185803, -0.4699591, 2.719115, 0, 0.509804, 1, 1,
0.1912921, 1.260008, -1.571405, 0, 0.5019608, 1, 1,
0.1922888, -0.2636706, 2.150958, 0, 0.4941176, 1, 1,
0.1978673, -1.013307, 3.072199, 0, 0.4901961, 1, 1,
0.1993523, -0.1892037, 3.111331, 0, 0.4823529, 1, 1,
0.2059994, 1.448275, 1.627739, 0, 0.4784314, 1, 1,
0.2062799, 1.049004, 0.8484283, 0, 0.4705882, 1, 1,
0.2110453, 0.6786888, 0.7715191, 0, 0.4666667, 1, 1,
0.2116483, 0.008036192, 0.9293814, 0, 0.4588235, 1, 1,
0.2190086, -0.6399611, 2.034533, 0, 0.454902, 1, 1,
0.2207503, -1.494376, 3.224744, 0, 0.4470588, 1, 1,
0.2209566, -0.1439384, 1.314885, 0, 0.4431373, 1, 1,
0.2212299, -1.332122, 2.132123, 0, 0.4352941, 1, 1,
0.2220459, 2.272462, -0.4256636, 0, 0.4313726, 1, 1,
0.2226824, 0.05726135, 1.207736, 0, 0.4235294, 1, 1,
0.2239229, -0.9443457, 1.35508, 0, 0.4196078, 1, 1,
0.2283274, -0.7066177, 3.188982, 0, 0.4117647, 1, 1,
0.2313555, 1.815691, -0.785348, 0, 0.4078431, 1, 1,
0.2401724, 0.08190193, 2.059875, 0, 0.4, 1, 1,
0.2421873, -2.847548, 1.354825, 0, 0.3921569, 1, 1,
0.2425895, 0.01510634, 0.9363929, 0, 0.3882353, 1, 1,
0.2444587, 1.857036, -1.061127, 0, 0.3803922, 1, 1,
0.245875, 1.11325, 1.150077, 0, 0.3764706, 1, 1,
0.2468877, -0.1125496, 2.209185, 0, 0.3686275, 1, 1,
0.2487268, 0.7043734, 0.1857908, 0, 0.3647059, 1, 1,
0.2502108, 0.16866, 0.9646422, 0, 0.3568628, 1, 1,
0.2548905, -0.5976063, 3.275292, 0, 0.3529412, 1, 1,
0.2548941, 0.1070683, 1.019507, 0, 0.345098, 1, 1,
0.2564557, 1.604986, -1.685116, 0, 0.3411765, 1, 1,
0.2580878, 0.37001, -1.07471, 0, 0.3333333, 1, 1,
0.2592612, -1.363346, 1.608449, 0, 0.3294118, 1, 1,
0.2594799, 0.3306592, 1.022345, 0, 0.3215686, 1, 1,
0.263943, 0.1953114, 1.862942, 0, 0.3176471, 1, 1,
0.2680346, 1.147604, -0.0571297, 0, 0.3098039, 1, 1,
0.2702773, -1.592744, 3.809674, 0, 0.3058824, 1, 1,
0.2772641, 0.1700033, 1.141919, 0, 0.2980392, 1, 1,
0.2899767, 1.080545, -1.784291, 0, 0.2901961, 1, 1,
0.2917726, 0.6382721, 0.0006013665, 0, 0.2862745, 1, 1,
0.2933868, -1.153907, 2.698562, 0, 0.2784314, 1, 1,
0.2941587, 0.2748471, 0.9117792, 0, 0.2745098, 1, 1,
0.2968674, -0.7785087, 2.543812, 0, 0.2666667, 1, 1,
0.3028545, 1.908738, 1.412129, 0, 0.2627451, 1, 1,
0.3069099, -0.1336688, -1.289516, 0, 0.254902, 1, 1,
0.3128246, -1.214599, 2.371429, 0, 0.2509804, 1, 1,
0.3129925, -1.584679, 1.996503, 0, 0.2431373, 1, 1,
0.3129994, 0.006614981, 2.775423, 0, 0.2392157, 1, 1,
0.32124, 0.04112054, 1.187626, 0, 0.2313726, 1, 1,
0.3266498, -0.1086588, 1.766733, 0, 0.227451, 1, 1,
0.329257, -0.6219218, 2.256892, 0, 0.2196078, 1, 1,
0.3324399, 0.927018, 0.9481235, 0, 0.2156863, 1, 1,
0.3416476, -0.5831726, 4.933282, 0, 0.2078431, 1, 1,
0.3433204, 1.109924, 0.5903755, 0, 0.2039216, 1, 1,
0.3463186, -0.8318149, 4.354354, 0, 0.1960784, 1, 1,
0.3470347, -0.3491856, 2.375969, 0, 0.1882353, 1, 1,
0.3489152, 1.749523, -1.094875, 0, 0.1843137, 1, 1,
0.3508191, -1.086621, 2.65584, 0, 0.1764706, 1, 1,
0.3525381, -1.561378, 1.818469, 0, 0.172549, 1, 1,
0.3659468, 1.315654, 1.939296, 0, 0.1647059, 1, 1,
0.3702357, 0.1243378, 1.820505, 0, 0.1607843, 1, 1,
0.3727262, -0.4999411, 2.028019, 0, 0.1529412, 1, 1,
0.3763441, 0.0828783, -0.6291776, 0, 0.1490196, 1, 1,
0.3774866, -1.238005, 3.845434, 0, 0.1411765, 1, 1,
0.3787512, 1.16879, 1.788994, 0, 0.1372549, 1, 1,
0.3788279, -1.314048, 3.452341, 0, 0.1294118, 1, 1,
0.3828472, 1.063247, 0.3568495, 0, 0.1254902, 1, 1,
0.3912604, -0.4370182, 2.606562, 0, 0.1176471, 1, 1,
0.3921541, -0.5905319, 2.546245, 0, 0.1137255, 1, 1,
0.3939587, -1.248162, 2.899796, 0, 0.1058824, 1, 1,
0.3971352, 0.6686047, 0.04882087, 0, 0.09803922, 1, 1,
0.3973193, -0.06133109, 1.653885, 0, 0.09411765, 1, 1,
0.4027048, 1.563331, 0.04920047, 0, 0.08627451, 1, 1,
0.4034371, -1.175968, 2.239619, 0, 0.08235294, 1, 1,
0.4048599, -1.979263, 3.307534, 0, 0.07450981, 1, 1,
0.4136873, -0.3877841, 0.9050319, 0, 0.07058824, 1, 1,
0.4147674, 0.04118795, 2.390938, 0, 0.0627451, 1, 1,
0.4147863, 2.649876, 0.317834, 0, 0.05882353, 1, 1,
0.4148925, -0.1657068, 1.470357, 0, 0.05098039, 1, 1,
0.4153987, 1.55103, -0.1630176, 0, 0.04705882, 1, 1,
0.4204782, 0.8748626, 0.6448029, 0, 0.03921569, 1, 1,
0.4221105, 0.2275975, 1.10154, 0, 0.03529412, 1, 1,
0.42215, 1.151633, 1.876001, 0, 0.02745098, 1, 1,
0.4223604, 0.9511639, -0.9665093, 0, 0.02352941, 1, 1,
0.4252909, 0.3509691, 1.087465, 0, 0.01568628, 1, 1,
0.4280911, 1.969325, 0.7968919, 0, 0.01176471, 1, 1,
0.4381963, 1.735527, 0.2475011, 0, 0.003921569, 1, 1,
0.4402153, 0.09417465, 2.12799, 0.003921569, 0, 1, 1,
0.4420501, 1.777546, 0.5260993, 0.007843138, 0, 1, 1,
0.4474431, -1.8946, 4.121343, 0.01568628, 0, 1, 1,
0.4518635, 0.1458762, 0.9917394, 0.01960784, 0, 1, 1,
0.4613131, -1.041169, 0.2950954, 0.02745098, 0, 1, 1,
0.4626901, 1.946513, -1.830924, 0.03137255, 0, 1, 1,
0.4711651, 2.305073, 0.6815802, 0.03921569, 0, 1, 1,
0.4726866, -0.7674432, 4.256289, 0.04313726, 0, 1, 1,
0.4736378, 0.9790375, 0.2611643, 0.05098039, 0, 1, 1,
0.478492, 0.5548645, 0.9567415, 0.05490196, 0, 1, 1,
0.482393, -0.5785054, 3.95098, 0.0627451, 0, 1, 1,
0.4889845, 1.617849, 0.2201971, 0.06666667, 0, 1, 1,
0.4908762, 0.3095783, 0.3301817, 0.07450981, 0, 1, 1,
0.4910217, 0.2470764, -1.636272, 0.07843138, 0, 1, 1,
0.4920826, -0.9726678, 2.989226, 0.08627451, 0, 1, 1,
0.4927883, -0.4821477, 1.94276, 0.09019608, 0, 1, 1,
0.4952599, -0.7558981, 2.710456, 0.09803922, 0, 1, 1,
0.4970528, 0.3536627, -0.125446, 0.1058824, 0, 1, 1,
0.5035691, -0.7504041, 1.341009, 0.1098039, 0, 1, 1,
0.5046697, 0.2356225, 0.5655705, 0.1176471, 0, 1, 1,
0.5051223, -0.8117929, 1.511674, 0.1215686, 0, 1, 1,
0.5072328, 1.462938, 2.241418, 0.1294118, 0, 1, 1,
0.5113744, -0.2189483, 4.839777, 0.1333333, 0, 1, 1,
0.5126362, 0.2954369, 0.2308666, 0.1411765, 0, 1, 1,
0.5184507, -0.8161217, 2.96978, 0.145098, 0, 1, 1,
0.5185882, -0.8449788, 2.386793, 0.1529412, 0, 1, 1,
0.5218313, 0.4223125, 0.6221726, 0.1568628, 0, 1, 1,
0.5262579, -0.8718931, 3.277623, 0.1647059, 0, 1, 1,
0.5264203, -0.1352735, 3.649199, 0.1686275, 0, 1, 1,
0.5316501, -2.059401, 4.141084, 0.1764706, 0, 1, 1,
0.5350343, -0.8858947, 2.512592, 0.1803922, 0, 1, 1,
0.5371192, 0.8414167, 2.071513, 0.1882353, 0, 1, 1,
0.5419245, -1.060118, 1.146217, 0.1921569, 0, 1, 1,
0.5449527, 1.417619, -0.003253154, 0.2, 0, 1, 1,
0.5457308, 0.06595323, 0.6995094, 0.2078431, 0, 1, 1,
0.5522735, 1.626162, -3.151035, 0.2117647, 0, 1, 1,
0.5564879, 0.9355215, -0.2358013, 0.2196078, 0, 1, 1,
0.5667418, 0.5246662, 3.091733, 0.2235294, 0, 1, 1,
0.5679763, 1.753712, 0.2048677, 0.2313726, 0, 1, 1,
0.5726118, 1.190466, 1.125382, 0.2352941, 0, 1, 1,
0.5776832, -0.718617, 1.145322, 0.2431373, 0, 1, 1,
0.5930094, 1.300724, 1.43036, 0.2470588, 0, 1, 1,
0.5963207, -0.01627038, 0.2819048, 0.254902, 0, 1, 1,
0.599002, -0.7481875, 2.489387, 0.2588235, 0, 1, 1,
0.6021538, -0.3719659, -0.7758553, 0.2666667, 0, 1, 1,
0.606815, -0.5519015, 2.935107, 0.2705882, 0, 1, 1,
0.6069388, 1.56872, -0.9335515, 0.2784314, 0, 1, 1,
0.6095818, 0.841173, 1.348049, 0.282353, 0, 1, 1,
0.6147989, 1.597202, 1.294866, 0.2901961, 0, 1, 1,
0.6287255, 2.03147, 1.739265, 0.2941177, 0, 1, 1,
0.6375825, -1.870508, 0.7585982, 0.3019608, 0, 1, 1,
0.638535, 1.773785, -0.7884952, 0.3098039, 0, 1, 1,
0.643239, 0.3176512, 2.256529, 0.3137255, 0, 1, 1,
0.6437522, 0.07901599, 0.3510651, 0.3215686, 0, 1, 1,
0.6450309, 0.5817437, 0.2328198, 0.3254902, 0, 1, 1,
0.6488647, 0.503703, 1.113444, 0.3333333, 0, 1, 1,
0.6505587, -1.305111, 0.9262115, 0.3372549, 0, 1, 1,
0.6518305, -1.314288, 1.552476, 0.345098, 0, 1, 1,
0.6537906, -1.217711, 2.809577, 0.3490196, 0, 1, 1,
0.6574908, -0.4953016, 1.438537, 0.3568628, 0, 1, 1,
0.6584157, -0.5063662, 1.829455, 0.3607843, 0, 1, 1,
0.6600145, 0.08591942, 3.186633, 0.3686275, 0, 1, 1,
0.6602898, 0.7464359, 0.3777061, 0.372549, 0, 1, 1,
0.6693882, -1.589826, 2.705739, 0.3803922, 0, 1, 1,
0.6763966, 1.925225, 0.7663046, 0.3843137, 0, 1, 1,
0.6827639, 0.4492022, -0.3382749, 0.3921569, 0, 1, 1,
0.6836363, 0.1474871, 1.680159, 0.3960784, 0, 1, 1,
0.6841273, 1.441186, 0.9516115, 0.4039216, 0, 1, 1,
0.6848966, -0.6435565, 2.980128, 0.4117647, 0, 1, 1,
0.691424, -1.506617, 3.439945, 0.4156863, 0, 1, 1,
0.6929616, -0.2067078, 0.8025165, 0.4235294, 0, 1, 1,
0.6933001, -0.3271815, 1.295137, 0.427451, 0, 1, 1,
0.6935803, 0.1743704, 1.437803, 0.4352941, 0, 1, 1,
0.7001216, 1.138384, 0.8090894, 0.4392157, 0, 1, 1,
0.7038135, 0.3240496, 0.4850356, 0.4470588, 0, 1, 1,
0.7078414, -0.3327144, 2.982961, 0.4509804, 0, 1, 1,
0.7078763, 0.5807322, 1.519068, 0.4588235, 0, 1, 1,
0.7105781, -0.02497241, 0.7991167, 0.4627451, 0, 1, 1,
0.7108636, 1.459086, 1.443926, 0.4705882, 0, 1, 1,
0.7127702, -0.2489984, 3.308706, 0.4745098, 0, 1, 1,
0.7127862, -1.107195, 2.645304, 0.4823529, 0, 1, 1,
0.7133242, -1.170026, 3.273669, 0.4862745, 0, 1, 1,
0.7196426, -0.7436527, 4.768174, 0.4941176, 0, 1, 1,
0.7196931, -1.303152, 3.322007, 0.5019608, 0, 1, 1,
0.7215251, 0.6573932, -0.9687775, 0.5058824, 0, 1, 1,
0.729856, -1.510846, 3.397341, 0.5137255, 0, 1, 1,
0.7336562, -0.8463724, 1.439167, 0.5176471, 0, 1, 1,
0.7374038, 0.8754762, 0.8998712, 0.5254902, 0, 1, 1,
0.7377592, -1.709699, 3.051296, 0.5294118, 0, 1, 1,
0.7390581, 0.4728406, -0.5204962, 0.5372549, 0, 1, 1,
0.7401806, 0.8165941, 1.572966, 0.5411765, 0, 1, 1,
0.7436116, 1.406695, 1.396698, 0.5490196, 0, 1, 1,
0.7536997, 1.0544, 0.9304882, 0.5529412, 0, 1, 1,
0.7559377, -0.8312065, 1.119994, 0.5607843, 0, 1, 1,
0.7570134, 0.8663975, 2.49377, 0.5647059, 0, 1, 1,
0.757027, 0.1343972, 0.9964142, 0.572549, 0, 1, 1,
0.7572218, -0.1400637, 2.520008, 0.5764706, 0, 1, 1,
0.7673832, -0.3395486, 3.396815, 0.5843138, 0, 1, 1,
0.7675584, -1.2592, 3.148798, 0.5882353, 0, 1, 1,
0.7675614, -0.6268108, 3.245708, 0.5960785, 0, 1, 1,
0.7820294, -1.033834, 3.422034, 0.6039216, 0, 1, 1,
0.7829663, 0.438415, 0.5751265, 0.6078432, 0, 1, 1,
0.7862931, -1.191655, 0.6138736, 0.6156863, 0, 1, 1,
0.7973217, 1.850825, -1.138266, 0.6196079, 0, 1, 1,
0.7995924, 0.6175265, 0.8175443, 0.627451, 0, 1, 1,
0.8016145, -0.211191, 3.170935, 0.6313726, 0, 1, 1,
0.8018974, -0.07912615, -0.6659994, 0.6392157, 0, 1, 1,
0.8043818, -0.3704908, 1.551944, 0.6431373, 0, 1, 1,
0.8053252, -0.3524927, 1.498931, 0.6509804, 0, 1, 1,
0.8074861, 0.2519136, 2.636752, 0.654902, 0, 1, 1,
0.8091679, 0.1046309, 1.051146, 0.6627451, 0, 1, 1,
0.8114657, -1.852255, 5.24785, 0.6666667, 0, 1, 1,
0.8144757, -0.3617977, 2.728469, 0.6745098, 0, 1, 1,
0.8146926, -1.23692, 3.543229, 0.6784314, 0, 1, 1,
0.8171556, -1.595342, 3.561766, 0.6862745, 0, 1, 1,
0.8182411, 0.388864, 1.789873, 0.6901961, 0, 1, 1,
0.8200887, -1.153137, 3.240894, 0.6980392, 0, 1, 1,
0.8232454, -0.9006516, 1.21745, 0.7058824, 0, 1, 1,
0.8239866, -0.9520493, 2.976266, 0.7098039, 0, 1, 1,
0.8242514, -0.0026708, 2.495084, 0.7176471, 0, 1, 1,
0.8301718, 0.6553146, 1.27701, 0.7215686, 0, 1, 1,
0.8331485, -0.06332798, 2.685443, 0.7294118, 0, 1, 1,
0.8333582, 0.0301568, 0.6307088, 0.7333333, 0, 1, 1,
0.8430105, -2.209224, 2.520037, 0.7411765, 0, 1, 1,
0.8468037, -1.430209, 3.139565, 0.7450981, 0, 1, 1,
0.8485582, -1.011207, 2.462479, 0.7529412, 0, 1, 1,
0.8493105, 0.6477904, 0.6124087, 0.7568628, 0, 1, 1,
0.8537835, -1.101904, 1.98852, 0.7647059, 0, 1, 1,
0.8538682, -0.8313081, 2.393347, 0.7686275, 0, 1, 1,
0.8550531, -1.082107, 2.433564, 0.7764706, 0, 1, 1,
0.8564036, 0.4579282, 0.3836326, 0.7803922, 0, 1, 1,
0.8624046, 2.148279, 0.7917995, 0.7882353, 0, 1, 1,
0.8667464, -1.744218, 3.91707, 0.7921569, 0, 1, 1,
0.8696344, -0.1822852, 2.34478, 0.8, 0, 1, 1,
0.8750374, -2.308026, 2.473394, 0.8078431, 0, 1, 1,
0.8777705, 0.7766551, 3.129622, 0.8117647, 0, 1, 1,
0.8797782, -0.4509687, 2.27934, 0.8196079, 0, 1, 1,
0.8801708, 0.5969421, 1.27811, 0.8235294, 0, 1, 1,
0.8879578, 0.4902432, 1.97468, 0.8313726, 0, 1, 1,
0.8913218, -0.880064, 1.96231, 0.8352941, 0, 1, 1,
0.8974413, 0.7562302, -0.6749752, 0.8431373, 0, 1, 1,
0.9000496, 0.2946817, 2.114494, 0.8470588, 0, 1, 1,
0.9021289, -0.9473727, 1.566469, 0.854902, 0, 1, 1,
0.9051606, 0.4396625, 1.27488, 0.8588235, 0, 1, 1,
0.9055885, -0.3079956, 2.073124, 0.8666667, 0, 1, 1,
0.9056149, 0.5006005, -0.1242908, 0.8705882, 0, 1, 1,
0.9186624, -0.308075, 2.766517, 0.8784314, 0, 1, 1,
0.9195535, 0.9866621, 0.5215694, 0.8823529, 0, 1, 1,
0.9246392, 0.5731905, 0.7041349, 0.8901961, 0, 1, 1,
0.9265326, 0.897397, -0.395748, 0.8941177, 0, 1, 1,
0.9270324, -0.9197952, 4.112885, 0.9019608, 0, 1, 1,
0.9275023, -0.852519, 0.8885068, 0.9098039, 0, 1, 1,
0.937655, -0.07419621, 1.459369, 0.9137255, 0, 1, 1,
0.9516589, -0.2374306, 0.7796865, 0.9215686, 0, 1, 1,
0.9568575, -1.078352, 1.887539, 0.9254902, 0, 1, 1,
0.9646541, 0.4738201, -0.7107729, 0.9333333, 0, 1, 1,
0.9702029, -0.3394273, 1.293314, 0.9372549, 0, 1, 1,
0.9705204, 0.1986279, 2.682695, 0.945098, 0, 1, 1,
0.9755914, 1.822586, 1.131021, 0.9490196, 0, 1, 1,
0.9830058, -0.01151343, 1.167768, 0.9568627, 0, 1, 1,
0.9908453, -0.1900933, 0.3682469, 0.9607843, 0, 1, 1,
0.9940465, 0.2653218, -0.1419619, 0.9686275, 0, 1, 1,
1.009831, -0.9114925, 2.026982, 0.972549, 0, 1, 1,
1.012654, 0.7999722, 1.742333, 0.9803922, 0, 1, 1,
1.01276, 1.60896, -0.1061754, 0.9843137, 0, 1, 1,
1.019711, 0.4985168, 0.9891291, 0.9921569, 0, 1, 1,
1.022146, -0.9420471, 3.12434, 0.9960784, 0, 1, 1,
1.024527, -0.6596316, 3.470788, 1, 0, 0.9960784, 1,
1.025719, -0.55871, 2.695524, 1, 0, 0.9882353, 1,
1.029498, 0.6202119, 1.32374, 1, 0, 0.9843137, 1,
1.036979, 1.230383, -0.3933998, 1, 0, 0.9764706, 1,
1.037253, -1.49152, 2.819664, 1, 0, 0.972549, 1,
1.044032, 0.6024875, 1.648291, 1, 0, 0.9647059, 1,
1.046404, 0.1399644, 2.453787, 1, 0, 0.9607843, 1,
1.053364, -1.537789, 1.634057, 1, 0, 0.9529412, 1,
1.055097, 0.2877254, 0.5314763, 1, 0, 0.9490196, 1,
1.061275, -1.552584, 3.698315, 1, 0, 0.9411765, 1,
1.062009, 0.3624163, 2.323434, 1, 0, 0.9372549, 1,
1.071047, 1.137138, 1.780151, 1, 0, 0.9294118, 1,
1.072063, -0.09421781, 3.072767, 1, 0, 0.9254902, 1,
1.072118, -0.5181856, 1.813781, 1, 0, 0.9176471, 1,
1.077219, -0.9811468, 3.665687, 1, 0, 0.9137255, 1,
1.081662, 0.7641882, -0.006355417, 1, 0, 0.9058824, 1,
1.084794, -1.528555, 4.080925, 1, 0, 0.9019608, 1,
1.094607, 0.71486, 1.327346, 1, 0, 0.8941177, 1,
1.100147, 1.387195, 1.213818, 1, 0, 0.8862745, 1,
1.102364, 0.3019456, 3.047639, 1, 0, 0.8823529, 1,
1.10581, 2.256482, -0.08987956, 1, 0, 0.8745098, 1,
1.106048, -0.438737, 1.34607, 1, 0, 0.8705882, 1,
1.112931, -1.977144, 3.205446, 1, 0, 0.8627451, 1,
1.113275, -1.707182, 3.05683, 1, 0, 0.8588235, 1,
1.1227, -0.7605253, 1.167618, 1, 0, 0.8509804, 1,
1.124811, -0.8174778, 1.27879, 1, 0, 0.8470588, 1,
1.126117, -0.3115557, 3.014781, 1, 0, 0.8392157, 1,
1.133779, 0.1456597, 1.064772, 1, 0, 0.8352941, 1,
1.147575, 0.8779645, 0.8574241, 1, 0, 0.827451, 1,
1.151122, 1.165945, 1.774607, 1, 0, 0.8235294, 1,
1.155415, 0.04177577, 1.720025, 1, 0, 0.8156863, 1,
1.159551, 0.3810933, 2.267617, 1, 0, 0.8117647, 1,
1.165663, -0.2436701, 3.262519, 1, 0, 0.8039216, 1,
1.165892, 0.341607, 0.355906, 1, 0, 0.7960784, 1,
1.167305, 0.4692187, 1.733335, 1, 0, 0.7921569, 1,
1.168273, 1.547353, 2.338536, 1, 0, 0.7843137, 1,
1.168559, 0.7927095, 0.3382894, 1, 0, 0.7803922, 1,
1.181307, -0.4809942, 2.297281, 1, 0, 0.772549, 1,
1.18917, -0.7690368, 2.112782, 1, 0, 0.7686275, 1,
1.19098, -0.01613532, 1.432903, 1, 0, 0.7607843, 1,
1.19784, 1.205036, 0.6011665, 1, 0, 0.7568628, 1,
1.202615, 1.091108, 1.456694, 1, 0, 0.7490196, 1,
1.20389, 0.1271438, 2.256884, 1, 0, 0.7450981, 1,
1.2341, 0.6934345, 1.999908, 1, 0, 0.7372549, 1,
1.242494, -1.438428, 3.17906, 1, 0, 0.7333333, 1,
1.243125, 0.5950036, 2.144051, 1, 0, 0.7254902, 1,
1.257191, -0.7270194, 0.1380407, 1, 0, 0.7215686, 1,
1.267141, 0.6025308, 0.3104608, 1, 0, 0.7137255, 1,
1.267911, 0.4084889, 0.0847993, 1, 0, 0.7098039, 1,
1.279046, -1.386002, 3.737858, 1, 0, 0.7019608, 1,
1.282564, 0.2531525, 2.380186, 1, 0, 0.6941177, 1,
1.297197, 1.012235, 2.853241, 1, 0, 0.6901961, 1,
1.317268, 0.651782, -0.8042491, 1, 0, 0.682353, 1,
1.318763, 0.3362567, 0.9087613, 1, 0, 0.6784314, 1,
1.321413, -0.8021905, 1.275133, 1, 0, 0.6705883, 1,
1.330974, -0.4529324, 0.08136348, 1, 0, 0.6666667, 1,
1.331942, -0.2868799, 2.41158, 1, 0, 0.6588235, 1,
1.3584, -0.601734, 4.166396, 1, 0, 0.654902, 1,
1.362922, 0.3670511, 2.920991, 1, 0, 0.6470588, 1,
1.367946, -2.164986, 2.0223, 1, 0, 0.6431373, 1,
1.385582, -0.8029562, 3.716621, 1, 0, 0.6352941, 1,
1.386165, -0.1796773, 0.2318245, 1, 0, 0.6313726, 1,
1.389682, -0.4048669, 1.301536, 1, 0, 0.6235294, 1,
1.393373, -1.265569, 3.346308, 1, 0, 0.6196079, 1,
1.399074, 0.6325884, 1.653746, 1, 0, 0.6117647, 1,
1.403666, 0.579986, 1.019343, 1, 0, 0.6078432, 1,
1.412673, 0.4840234, 1.214362, 1, 0, 0.6, 1,
1.418879, -1.447668, 0.5059126, 1, 0, 0.5921569, 1,
1.424034, -0.5041631, 1.429043, 1, 0, 0.5882353, 1,
1.430203, 0.7442481, -1.63877, 1, 0, 0.5803922, 1,
1.433645, -2.314428, 2.065353, 1, 0, 0.5764706, 1,
1.435129, 0.2634943, 1.130562, 1, 0, 0.5686275, 1,
1.43755, 0.8153802, 2.25199, 1, 0, 0.5647059, 1,
1.449198, -0.1390958, 0.1822916, 1, 0, 0.5568628, 1,
1.450832, -0.02097816, 2.256562, 1, 0, 0.5529412, 1,
1.451856, -1.558535, 3.280659, 1, 0, 0.5450981, 1,
1.464932, -0.9642597, 1.538617, 1, 0, 0.5411765, 1,
1.468066, -1.24183, 1.855664, 1, 0, 0.5333334, 1,
1.468247, 0.7434348, 0.9482244, 1, 0, 0.5294118, 1,
1.477275, 1.218276, 2.363141, 1, 0, 0.5215687, 1,
1.481073, -0.4044989, 1.260731, 1, 0, 0.5176471, 1,
1.491853, -1.606278, 2.645086, 1, 0, 0.509804, 1,
1.521951, 1.966313, 1.917392, 1, 0, 0.5058824, 1,
1.523034, 1.084038, 1.060685, 1, 0, 0.4980392, 1,
1.529885, -1.110759, 1.853099, 1, 0, 0.4901961, 1,
1.540571, 0.001817163, -0.6505116, 1, 0, 0.4862745, 1,
1.543932, -0.5629724, 2.646795, 1, 0, 0.4784314, 1,
1.589804, 1.227293, 2.618326, 1, 0, 0.4745098, 1,
1.591812, -0.9013401, 1.437332, 1, 0, 0.4666667, 1,
1.594828, 0.8115271, 2.787999, 1, 0, 0.4627451, 1,
1.595403, -0.3497533, -0.3391951, 1, 0, 0.454902, 1,
1.59751, -0.09584911, 2.117032, 1, 0, 0.4509804, 1,
1.60697, -0.3269315, 1.135716, 1, 0, 0.4431373, 1,
1.611866, 1.646046, 0.5167635, 1, 0, 0.4392157, 1,
1.612504, -0.5819001, 0.1464197, 1, 0, 0.4313726, 1,
1.627607, 1.922221, 0.9054747, 1, 0, 0.427451, 1,
1.631989, -0.9849808, 1.607825, 1, 0, 0.4196078, 1,
1.634275, 0.4319799, 1.607649, 1, 0, 0.4156863, 1,
1.64545, 2.685354, -0.3245085, 1, 0, 0.4078431, 1,
1.654368, -1.367101, 3.392225, 1, 0, 0.4039216, 1,
1.666026, -0.6841557, 2.623977, 1, 0, 0.3960784, 1,
1.667382, 1.366145, 0.8237395, 1, 0, 0.3882353, 1,
1.678886, -0.5183325, 2.87205, 1, 0, 0.3843137, 1,
1.681503, -0.538156, 4.908137, 1, 0, 0.3764706, 1,
1.681853, 0.538845, 1.710228, 1, 0, 0.372549, 1,
1.684605, -0.2207448, 1.777734, 1, 0, 0.3647059, 1,
1.685509, -1.984151, 2.073881, 1, 0, 0.3607843, 1,
1.714759, 1.490317, -0.3243472, 1, 0, 0.3529412, 1,
1.717047, 0.3590854, 1.240143, 1, 0, 0.3490196, 1,
1.718432, -0.6981599, 2.403206, 1, 0, 0.3411765, 1,
1.736496, 1.226359, 0.8953785, 1, 0, 0.3372549, 1,
1.737898, -0.1433387, 2.593082, 1, 0, 0.3294118, 1,
1.754856, 0.6516654, 1.055073, 1, 0, 0.3254902, 1,
1.756562, -1.914469, 3.486897, 1, 0, 0.3176471, 1,
1.770403, 0.8018267, 0.4784373, 1, 0, 0.3137255, 1,
1.77404, -0.9942329, 2.754652, 1, 0, 0.3058824, 1,
1.785912, -0.8529663, 2.749454, 1, 0, 0.2980392, 1,
1.797976, 0.509793, 0.2416811, 1, 0, 0.2941177, 1,
1.799224, -0.5221377, 2.305034, 1, 0, 0.2862745, 1,
1.804318, 1.348513, 1.197886, 1, 0, 0.282353, 1,
1.815193, -0.361517, 1.729921, 1, 0, 0.2745098, 1,
1.822571, -1.070085, 1.028506, 1, 0, 0.2705882, 1,
1.834483, 0.7376344, 0.6919649, 1, 0, 0.2627451, 1,
1.836307, -1.218257, 1.228095, 1, 0, 0.2588235, 1,
1.840266, 1.383162, 0.3870433, 1, 0, 0.2509804, 1,
1.859168, 0.670462, 2.228397, 1, 0, 0.2470588, 1,
1.893526, 0.1677045, 1.59042, 1, 0, 0.2392157, 1,
1.923362, 0.524438, -1.185881, 1, 0, 0.2352941, 1,
1.924011, 0.2845882, 1.364574, 1, 0, 0.227451, 1,
1.92407, -1.136261, 2.916128, 1, 0, 0.2235294, 1,
1.932085, 0.1779582, 0.570239, 1, 0, 0.2156863, 1,
1.957721, 2.427383, 2.36452, 1, 0, 0.2117647, 1,
1.971273, -1.293728, 1.015111, 1, 0, 0.2039216, 1,
2.021366, -1.250235, 1.655729, 1, 0, 0.1960784, 1,
2.021828, 0.3791681, 1.705141, 1, 0, 0.1921569, 1,
2.025227, 1.134027, 2.247788, 1, 0, 0.1843137, 1,
2.028476, 0.8816252, -0.6371592, 1, 0, 0.1803922, 1,
2.029768, 0.341828, 1.379938, 1, 0, 0.172549, 1,
2.03792, -1.394819, 1.444386, 1, 0, 0.1686275, 1,
2.048909, 0.1663165, 0.2248064, 1, 0, 0.1607843, 1,
2.061859, 0.2809539, 2.114128, 1, 0, 0.1568628, 1,
2.077791, 1.583889, -0.3558539, 1, 0, 0.1490196, 1,
2.093108, -0.1209369, 0.9434745, 1, 0, 0.145098, 1,
2.106804, -0.03648813, 2.768536, 1, 0, 0.1372549, 1,
2.143574, 0.5040571, 1.56228, 1, 0, 0.1333333, 1,
2.177711, 0.1089077, 3.3587, 1, 0, 0.1254902, 1,
2.19958, 0.4450004, 1.116822, 1, 0, 0.1215686, 1,
2.204533, 0.5511769, 0.1184656, 1, 0, 0.1137255, 1,
2.215134, 1.220888, 1.158707, 1, 0, 0.1098039, 1,
2.216113, 0.9209019, 1.706157, 1, 0, 0.1019608, 1,
2.221035, -1.323671, 1.544529, 1, 0, 0.09411765, 1,
2.226043, 0.3416386, 2.354942, 1, 0, 0.09019608, 1,
2.273132, 1.007132, 1.89309, 1, 0, 0.08235294, 1,
2.297129, -1.021606, 1.538039, 1, 0, 0.07843138, 1,
2.306559, -0.3376002, 3.121923, 1, 0, 0.07058824, 1,
2.420848, 0.1467047, 2.268807, 1, 0, 0.06666667, 1,
2.440202, -0.7345546, 1.991136, 1, 0, 0.05882353, 1,
2.464417, -0.4328446, -0.5142239, 1, 0, 0.05490196, 1,
2.469743, -0.4176591, 1.190826, 1, 0, 0.04705882, 1,
2.509083, -0.3787198, 1.728313, 1, 0, 0.04313726, 1,
2.614666, -1.702934, 2.418548, 1, 0, 0.03529412, 1,
3.003118, -0.7633522, 1.502063, 1, 0, 0.03137255, 1,
3.070904, 1.412295, 0.5384755, 1, 0, 0.02352941, 1,
3.096439, -1.313475, 1.181925, 1, 0, 0.01960784, 1,
3.129142, 1.468749, 0.898235, 1, 0, 0.01176471, 1,
3.72296, -0.8528877, 2.554627, 1, 0, 0.007843138, 1
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
0.254035, -3.979154, -7.492357, 0, -0.5, 0.5, 0.5,
0.254035, -3.979154, -7.492357, 1, -0.5, 0.5, 0.5,
0.254035, -3.979154, -7.492357, 1, 1.5, 0.5, 0.5,
0.254035, -3.979154, -7.492357, 0, 1.5, 0.5, 0.5
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
-4.390855, 0.4905241, -7.492357, 0, -0.5, 0.5, 0.5,
-4.390855, 0.4905241, -7.492357, 1, -0.5, 0.5, 0.5,
-4.390855, 0.4905241, -7.492357, 1, 1.5, 0.5, 0.5,
-4.390855, 0.4905241, -7.492357, 0, 1.5, 0.5, 0.5
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
-4.390855, -3.979154, -0.1990108, 0, -0.5, 0.5, 0.5,
-4.390855, -3.979154, -0.1990108, 1, -0.5, 0.5, 0.5,
-4.390855, -3.979154, -0.1990108, 1, 1.5, 0.5, 0.5,
-4.390855, -3.979154, -0.1990108, 0, 1.5, 0.5, 0.5
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
-3, -2.94769, -5.809278,
3, -2.94769, -5.809278,
-3, -2.94769, -5.809278,
-3, -3.119601, -6.089791,
-2, -2.94769, -5.809278,
-2, -3.119601, -6.089791,
-1, -2.94769, -5.809278,
-1, -3.119601, -6.089791,
0, -2.94769, -5.809278,
0, -3.119601, -6.089791,
1, -2.94769, -5.809278,
1, -3.119601, -6.089791,
2, -2.94769, -5.809278,
2, -3.119601, -6.089791,
3, -2.94769, -5.809278,
3, -3.119601, -6.089791
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
-3, -3.463422, -6.650817, 0, -0.5, 0.5, 0.5,
-3, -3.463422, -6.650817, 1, -0.5, 0.5, 0.5,
-3, -3.463422, -6.650817, 1, 1.5, 0.5, 0.5,
-3, -3.463422, -6.650817, 0, 1.5, 0.5, 0.5,
-2, -3.463422, -6.650817, 0, -0.5, 0.5, 0.5,
-2, -3.463422, -6.650817, 1, -0.5, 0.5, 0.5,
-2, -3.463422, -6.650817, 1, 1.5, 0.5, 0.5,
-2, -3.463422, -6.650817, 0, 1.5, 0.5, 0.5,
-1, -3.463422, -6.650817, 0, -0.5, 0.5, 0.5,
-1, -3.463422, -6.650817, 1, -0.5, 0.5, 0.5,
-1, -3.463422, -6.650817, 1, 1.5, 0.5, 0.5,
-1, -3.463422, -6.650817, 0, 1.5, 0.5, 0.5,
0, -3.463422, -6.650817, 0, -0.5, 0.5, 0.5,
0, -3.463422, -6.650817, 1, -0.5, 0.5, 0.5,
0, -3.463422, -6.650817, 1, 1.5, 0.5, 0.5,
0, -3.463422, -6.650817, 0, 1.5, 0.5, 0.5,
1, -3.463422, -6.650817, 0, -0.5, 0.5, 0.5,
1, -3.463422, -6.650817, 1, -0.5, 0.5, 0.5,
1, -3.463422, -6.650817, 1, 1.5, 0.5, 0.5,
1, -3.463422, -6.650817, 0, 1.5, 0.5, 0.5,
2, -3.463422, -6.650817, 0, -0.5, 0.5, 0.5,
2, -3.463422, -6.650817, 1, -0.5, 0.5, 0.5,
2, -3.463422, -6.650817, 1, 1.5, 0.5, 0.5,
2, -3.463422, -6.650817, 0, 1.5, 0.5, 0.5,
3, -3.463422, -6.650817, 0, -0.5, 0.5, 0.5,
3, -3.463422, -6.650817, 1, -0.5, 0.5, 0.5,
3, -3.463422, -6.650817, 1, 1.5, 0.5, 0.5,
3, -3.463422, -6.650817, 0, 1.5, 0.5, 0.5
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
-3.318958, -2, -5.809278,
-3.318958, 3, -5.809278,
-3.318958, -2, -5.809278,
-3.497607, -2, -6.089791,
-3.318958, -1, -5.809278,
-3.497607, -1, -6.089791,
-3.318958, 0, -5.809278,
-3.497607, 0, -6.089791,
-3.318958, 1, -5.809278,
-3.497607, 1, -6.089791,
-3.318958, 2, -5.809278,
-3.497607, 2, -6.089791,
-3.318958, 3, -5.809278,
-3.497607, 3, -6.089791
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
-3.854906, -2, -6.650817, 0, -0.5, 0.5, 0.5,
-3.854906, -2, -6.650817, 1, -0.5, 0.5, 0.5,
-3.854906, -2, -6.650817, 1, 1.5, 0.5, 0.5,
-3.854906, -2, -6.650817, 0, 1.5, 0.5, 0.5,
-3.854906, -1, -6.650817, 0, -0.5, 0.5, 0.5,
-3.854906, -1, -6.650817, 1, -0.5, 0.5, 0.5,
-3.854906, -1, -6.650817, 1, 1.5, 0.5, 0.5,
-3.854906, -1, -6.650817, 0, 1.5, 0.5, 0.5,
-3.854906, 0, -6.650817, 0, -0.5, 0.5, 0.5,
-3.854906, 0, -6.650817, 1, -0.5, 0.5, 0.5,
-3.854906, 0, -6.650817, 1, 1.5, 0.5, 0.5,
-3.854906, 0, -6.650817, 0, 1.5, 0.5, 0.5,
-3.854906, 1, -6.650817, 0, -0.5, 0.5, 0.5,
-3.854906, 1, -6.650817, 1, -0.5, 0.5, 0.5,
-3.854906, 1, -6.650817, 1, 1.5, 0.5, 0.5,
-3.854906, 1, -6.650817, 0, 1.5, 0.5, 0.5,
-3.854906, 2, -6.650817, 0, -0.5, 0.5, 0.5,
-3.854906, 2, -6.650817, 1, -0.5, 0.5, 0.5,
-3.854906, 2, -6.650817, 1, 1.5, 0.5, 0.5,
-3.854906, 2, -6.650817, 0, 1.5, 0.5, 0.5,
-3.854906, 3, -6.650817, 0, -0.5, 0.5, 0.5,
-3.854906, 3, -6.650817, 1, -0.5, 0.5, 0.5,
-3.854906, 3, -6.650817, 1, 1.5, 0.5, 0.5,
-3.854906, 3, -6.650817, 0, 1.5, 0.5, 0.5
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
-3.318958, -2.94769, -4,
-3.318958, -2.94769, 4,
-3.318958, -2.94769, -4,
-3.497607, -3.119601, -4,
-3.318958, -2.94769, -2,
-3.497607, -3.119601, -2,
-3.318958, -2.94769, 0,
-3.497607, -3.119601, 0,
-3.318958, -2.94769, 2,
-3.497607, -3.119601, 2,
-3.318958, -2.94769, 4,
-3.497607, -3.119601, 4
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
-3.854906, -3.463422, -4, 0, -0.5, 0.5, 0.5,
-3.854906, -3.463422, -4, 1, -0.5, 0.5, 0.5,
-3.854906, -3.463422, -4, 1, 1.5, 0.5, 0.5,
-3.854906, -3.463422, -4, 0, 1.5, 0.5, 0.5,
-3.854906, -3.463422, -2, 0, -0.5, 0.5, 0.5,
-3.854906, -3.463422, -2, 1, -0.5, 0.5, 0.5,
-3.854906, -3.463422, -2, 1, 1.5, 0.5, 0.5,
-3.854906, -3.463422, -2, 0, 1.5, 0.5, 0.5,
-3.854906, -3.463422, 0, 0, -0.5, 0.5, 0.5,
-3.854906, -3.463422, 0, 1, -0.5, 0.5, 0.5,
-3.854906, -3.463422, 0, 1, 1.5, 0.5, 0.5,
-3.854906, -3.463422, 0, 0, 1.5, 0.5, 0.5,
-3.854906, -3.463422, 2, 0, -0.5, 0.5, 0.5,
-3.854906, -3.463422, 2, 1, -0.5, 0.5, 0.5,
-3.854906, -3.463422, 2, 1, 1.5, 0.5, 0.5,
-3.854906, -3.463422, 2, 0, 1.5, 0.5, 0.5,
-3.854906, -3.463422, 4, 0, -0.5, 0.5, 0.5,
-3.854906, -3.463422, 4, 1, -0.5, 0.5, 0.5,
-3.854906, -3.463422, 4, 1, 1.5, 0.5, 0.5,
-3.854906, -3.463422, 4, 0, 1.5, 0.5, 0.5
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
-3.318958, -2.94769, -5.809278,
-3.318958, 3.928738, -5.809278,
-3.318958, -2.94769, 5.411256,
-3.318958, 3.928738, 5.411256,
-3.318958, -2.94769, -5.809278,
-3.318958, -2.94769, 5.411256,
-3.318958, 3.928738, -5.809278,
-3.318958, 3.928738, 5.411256,
-3.318958, -2.94769, -5.809278,
3.827028, -2.94769, -5.809278,
-3.318958, -2.94769, 5.411256,
3.827028, -2.94769, 5.411256,
-3.318958, 3.928738, -5.809278,
3.827028, 3.928738, -5.809278,
-3.318958, 3.928738, 5.411256,
3.827028, 3.928738, 5.411256,
3.827028, -2.94769, -5.809278,
3.827028, 3.928738, -5.809278,
3.827028, -2.94769, 5.411256,
3.827028, 3.928738, 5.411256,
3.827028, -2.94769, -5.809278,
3.827028, -2.94769, 5.411256,
3.827028, 3.928738, -5.809278,
3.827028, 3.928738, 5.411256
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
var radius = 7.996361;
var distance = 35.57671;
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
mvMatrix.translate( -0.254035, -0.4905241, 0.1990108 );
mvMatrix.scale( 1.209885, 1.257313, 0.7705358 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.57671);
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
triclosan<-read.table("triclosan.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-triclosan$V2
```

```
## Error in eval(expr, envir, enclos): object 'triclosan' not found
```

```r
y<-triclosan$V3
```

```
## Error in eval(expr, envir, enclos): object 'triclosan' not found
```

```r
z<-triclosan$V4
```

```
## Error in eval(expr, envir, enclos): object 'triclosan' not found
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
-3.21489, -0.5537352, -2.58966, 0, 0, 1, 1, 1,
-3.127725, 0.9664256, -2.597034, 1, 0, 0, 1, 1,
-3.004569, -0.5654622, -3.331924, 1, 0, 0, 1, 1,
-2.862206, -0.2639358, -1.666363, 1, 0, 0, 1, 1,
-2.818465, 0.1874716, -0.2521706, 1, 0, 0, 1, 1,
-2.496398, 3.181583, -2.37868, 1, 0, 0, 1, 1,
-2.484105, -0.4143136, -1.849887, 0, 0, 0, 1, 1,
-2.425353, 0.3999762, -1.465724, 0, 0, 0, 1, 1,
-2.370231, 0.4306332, -2.810549, 0, 0, 0, 1, 1,
-2.296024, -1.315341, -1.540298, 0, 0, 0, 1, 1,
-2.273027, 0.6934692, -0.9610944, 0, 0, 0, 1, 1,
-2.270733, 0.8372166, -1.099216, 0, 0, 0, 1, 1,
-2.198153, 0.2647081, -1.420864, 0, 0, 0, 1, 1,
-2.171251, -2.57526, -2.886156, 1, 1, 1, 1, 1,
-2.166293, 0.9189304, -2.065627, 1, 1, 1, 1, 1,
-2.115776, 0.632545, -0.8575023, 1, 1, 1, 1, 1,
-2.100528, 0.759838, -2.122684, 1, 1, 1, 1, 1,
-2.072523, -0.5919041, -0.5226091, 1, 1, 1, 1, 1,
-2.028886, -0.9056306, -1.299613, 1, 1, 1, 1, 1,
-2.015492, -1.754242, -4.226855, 1, 1, 1, 1, 1,
-2.015351, 0.1859581, -1.102616, 1, 1, 1, 1, 1,
-2.002054, -1.725838, -2.881006, 1, 1, 1, 1, 1,
-1.986982, -0.2303843, -1.675628, 1, 1, 1, 1, 1,
-1.984262, 0.1780256, -1.270429, 1, 1, 1, 1, 1,
-1.977857, -0.1187743, -1.159872, 1, 1, 1, 1, 1,
-1.966202, -1.476536, -2.412386, 1, 1, 1, 1, 1,
-1.963581, 0.07647582, -0.812458, 1, 1, 1, 1, 1,
-1.924928, -0.5399736, 0.007685539, 1, 1, 1, 1, 1,
-1.920991, -0.08321337, -1.669494, 0, 0, 1, 1, 1,
-1.886616, -0.3772673, -1.605038, 1, 0, 0, 1, 1,
-1.877943, 0.2964661, -3.257888, 1, 0, 0, 1, 1,
-1.876812, 0.5374425, -1.243928, 1, 0, 0, 1, 1,
-1.84676, 0.418961, -0.2171502, 1, 0, 0, 1, 1,
-1.83879, -0.6042231, -3.408186, 1, 0, 0, 1, 1,
-1.813823, 1.672496, -0.1267835, 0, 0, 0, 1, 1,
-1.802894, 1.043062, -0.5326642, 0, 0, 0, 1, 1,
-1.794685, -1.267922, -3.122258, 0, 0, 0, 1, 1,
-1.781162, 0.5876374, -1.40946, 0, 0, 0, 1, 1,
-1.753182, 0.653345, 0.0150729, 0, 0, 0, 1, 1,
-1.738868, -0.5649688, -2.005565, 0, 0, 0, 1, 1,
-1.723226, 0.3730808, -2.320448, 0, 0, 0, 1, 1,
-1.719746, -0.8446403, -3.586499, 1, 1, 1, 1, 1,
-1.713479, 0.4916045, -1.376342, 1, 1, 1, 1, 1,
-1.705107, -2.648616, -3.584552, 1, 1, 1, 1, 1,
-1.690065, -0.3144228, -0.2110877, 1, 1, 1, 1, 1,
-1.689881, -0.5940759, 1.134539, 1, 1, 1, 1, 1,
-1.680312, 1.426462, 0.9674526, 1, 1, 1, 1, 1,
-1.678682, -0.001482712, -3.084918, 1, 1, 1, 1, 1,
-1.678477, 1.022198, -0.7025968, 1, 1, 1, 1, 1,
-1.678266, 0.8432858, -2.065016, 1, 1, 1, 1, 1,
-1.660453, -0.2184116, -1.569598, 1, 1, 1, 1, 1,
-1.651744, -0.2985808, -2.021119, 1, 1, 1, 1, 1,
-1.642637, 0.4177799, -2.012688, 1, 1, 1, 1, 1,
-1.638206, -0.4443561, -1.161633, 1, 1, 1, 1, 1,
-1.634522, 1.125597, -0.5664491, 1, 1, 1, 1, 1,
-1.618614, -0.1383805, 1.730711, 1, 1, 1, 1, 1,
-1.618451, -0.4176942, -1.93009, 0, 0, 1, 1, 1,
-1.61747, 0.6698866, -0.794444, 1, 0, 0, 1, 1,
-1.611364, -2.756937, -2.356487, 1, 0, 0, 1, 1,
-1.609101, -1.669564, -2.488139, 1, 0, 0, 1, 1,
-1.602865, -1.819335, -2.741834, 1, 0, 0, 1, 1,
-1.600468, -0.5821736, -2.279939, 1, 0, 0, 1, 1,
-1.559399, -0.564113, -1.064516, 0, 0, 0, 1, 1,
-1.541976, -1.021429, -2.597765, 0, 0, 0, 1, 1,
-1.541839, 0.3544945, -1.643613, 0, 0, 0, 1, 1,
-1.535387, -0.05402119, -1.100996, 0, 0, 0, 1, 1,
-1.532641, -0.4136584, -2.547248, 0, 0, 0, 1, 1,
-1.520428, -0.7161154, -1.85515, 0, 0, 0, 1, 1,
-1.517992, -0.07444599, -2.987637, 0, 0, 0, 1, 1,
-1.494631, 0.2230816, -1.795083, 1, 1, 1, 1, 1,
-1.476348, -1.323905, -3.362213, 1, 1, 1, 1, 1,
-1.475763, 1.543936, -0.01123748, 1, 1, 1, 1, 1,
-1.474641, 0.07260526, -2.129442, 1, 1, 1, 1, 1,
-1.470576, -2.076266, -3.477073, 1, 1, 1, 1, 1,
-1.467634, 0.002917964, -1.928259, 1, 1, 1, 1, 1,
-1.461138, 1.044676, -0.2212848, 1, 1, 1, 1, 1,
-1.450979, 0.3262711, -1.387558, 1, 1, 1, 1, 1,
-1.442583, 0.1268015, 0.5130284, 1, 1, 1, 1, 1,
-1.439465, 1.082193, 0.5615342, 1, 1, 1, 1, 1,
-1.438204, 0.46484, -0.665202, 1, 1, 1, 1, 1,
-1.430216, -0.9763706, -1.469448, 1, 1, 1, 1, 1,
-1.429986, -1.653896, -1.626811, 1, 1, 1, 1, 1,
-1.428945, -0.7760857, -1.434715, 1, 1, 1, 1, 1,
-1.426522, 1.671657, -1.946647, 1, 1, 1, 1, 1,
-1.424448, -0.9598111, -3.410526, 0, 0, 1, 1, 1,
-1.38634, 0.2938549, 0.004500172, 1, 0, 0, 1, 1,
-1.371033, 0.7717776, -0.6445366, 1, 0, 0, 1, 1,
-1.370173, 1.617565, -0.1821515, 1, 0, 0, 1, 1,
-1.368831, -0.8564099, -2.023251, 1, 0, 0, 1, 1,
-1.363088, 0.4605037, -2.24938, 1, 0, 0, 1, 1,
-1.361695, 0.3207225, -0.7652268, 0, 0, 0, 1, 1,
-1.332518, -0.2674336, -1.371808, 0, 0, 0, 1, 1,
-1.329136, 2.068958, -1.259601, 0, 0, 0, 1, 1,
-1.320043, -0.2639881, -2.225798, 0, 0, 0, 1, 1,
-1.317569, 1.557646, 0.4696667, 0, 0, 0, 1, 1,
-1.317124, 0.390314, -1.074067, 0, 0, 0, 1, 1,
-1.31421, 0.8168344, -0.428347, 0, 0, 0, 1, 1,
-1.311804, -0.7236264, -3.379397, 1, 1, 1, 1, 1,
-1.310897, 1.563676, -2.122271, 1, 1, 1, 1, 1,
-1.305806, -0.2509156, -1.741598, 1, 1, 1, 1, 1,
-1.294996, 0.9136885, -1.392209, 1, 1, 1, 1, 1,
-1.293318, -0.7665631, -0.9870359, 1, 1, 1, 1, 1,
-1.291078, -1.797058, -0.8233432, 1, 1, 1, 1, 1,
-1.283282, 1.998082, -0.3955913, 1, 1, 1, 1, 1,
-1.278697, 1.270147, 1.183507, 1, 1, 1, 1, 1,
-1.274433, -0.1569346, 0.0867432, 1, 1, 1, 1, 1,
-1.25959, 1.297874, -1.294219, 1, 1, 1, 1, 1,
-1.247652, -1.057773, -2.256032, 1, 1, 1, 1, 1,
-1.242871, -0.2626906, -2.530438, 1, 1, 1, 1, 1,
-1.237428, 0.191752, -1.476591, 1, 1, 1, 1, 1,
-1.233412, 1.288879, -0.8005401, 1, 1, 1, 1, 1,
-1.225402, -1.042568, -2.514898, 1, 1, 1, 1, 1,
-1.222473, -0.4516737, -2.253748, 0, 0, 1, 1, 1,
-1.216127, 0.9310371, -1.463256, 1, 0, 0, 1, 1,
-1.207192, -0.70391, -1.740889, 1, 0, 0, 1, 1,
-1.199696, -1.161492, -3.915536, 1, 0, 0, 1, 1,
-1.199005, 0.06519156, 0.2223539, 1, 0, 0, 1, 1,
-1.196508, -1.387904, -2.330892, 1, 0, 0, 1, 1,
-1.192858, -0.05622619, -1.966689, 0, 0, 0, 1, 1,
-1.180556, 1.072198, 0.01963459, 0, 0, 0, 1, 1,
-1.178185, -0.01303608, -1.190353, 0, 0, 0, 1, 1,
-1.177621, -0.1917471, -3.740579, 0, 0, 0, 1, 1,
-1.176582, 0.7867113, -2.641531, 0, 0, 0, 1, 1,
-1.168367, 1.00848, -1.284187, 0, 0, 0, 1, 1,
-1.167575, 0.7294603, 0.1283444, 0, 0, 0, 1, 1,
-1.163914, -1.208613, -1.644402, 1, 1, 1, 1, 1,
-1.161221, 0.429826, -0.6687973, 1, 1, 1, 1, 1,
-1.161083, 1.334749, -1.401666, 1, 1, 1, 1, 1,
-1.153429, -1.317801, -3.242931, 1, 1, 1, 1, 1,
-1.152729, 0.8335495, -0.4477966, 1, 1, 1, 1, 1,
-1.151296, -0.2190617, -1.265404, 1, 1, 1, 1, 1,
-1.150942, 0.644384, 1.052197, 1, 1, 1, 1, 1,
-1.147026, 0.2879052, 0.7638523, 1, 1, 1, 1, 1,
-1.132633, 0.0810321, -1.049801, 1, 1, 1, 1, 1,
-1.125402, -0.57094, -2.536686, 1, 1, 1, 1, 1,
-1.125093, -0.0300664, -1.680897, 1, 1, 1, 1, 1,
-1.124195, 0.8126234, -1.071292, 1, 1, 1, 1, 1,
-1.120705, -0.3056791, -0.5936427, 1, 1, 1, 1, 1,
-1.119959, -0.04405263, -0.6701558, 1, 1, 1, 1, 1,
-1.118614, -1.181587, -2.375256, 1, 1, 1, 1, 1,
-1.116393, 0.8596298, -0.4773054, 0, 0, 1, 1, 1,
-1.112916, -0.6597054, -1.755801, 1, 0, 0, 1, 1,
-1.112839, 1.015319, -0.09552039, 1, 0, 0, 1, 1,
-1.108297, -0.5019624, -2.164876, 1, 0, 0, 1, 1,
-1.105168, 0.1330341, -1.603208, 1, 0, 0, 1, 1,
-1.101623, 0.4649037, -0.2370357, 1, 0, 0, 1, 1,
-1.100935, 0.6731097, -2.050668, 0, 0, 0, 1, 1,
-1.094838, -0.2734538, -1.725078, 0, 0, 0, 1, 1,
-1.090987, -0.4160007, -2.3086, 0, 0, 0, 1, 1,
-1.086243, 1.46971, -0.9485809, 0, 0, 0, 1, 1,
-1.079471, -1.492009, -3.782832, 0, 0, 0, 1, 1,
-1.076283, -0.1885751, -0.8860896, 0, 0, 0, 1, 1,
-1.07266, 0.582818, -0.3685459, 0, 0, 0, 1, 1,
-1.067499, -1.902724, -2.182406, 1, 1, 1, 1, 1,
-1.065779, -0.5815645, -2.325035, 1, 1, 1, 1, 1,
-1.065056, 1.255217, -0.7005069, 1, 1, 1, 1, 1,
-1.056745, 1.225427, 0.6983362, 1, 1, 1, 1, 1,
-1.05441, 1.504006, -1.90362, 1, 1, 1, 1, 1,
-1.048887, 1.132492, -2.229514, 1, 1, 1, 1, 1,
-1.046147, -0.9753346, -1.202383, 1, 1, 1, 1, 1,
-1.042628, -1.242193, -1.806712, 1, 1, 1, 1, 1,
-1.031288, -1.565481, -1.456013, 1, 1, 1, 1, 1,
-1.029024, -0.6474003, -3.10039, 1, 1, 1, 1, 1,
-1.027728, 0.9053009, -0.8582842, 1, 1, 1, 1, 1,
-1.025776, -1.382057, -2.847048, 1, 1, 1, 1, 1,
-1.023327, 1.256424, -0.4573153, 1, 1, 1, 1, 1,
-1.022287, -1.552708, -5.308799, 1, 1, 1, 1, 1,
-1.022031, 0.4599057, -0.2525062, 1, 1, 1, 1, 1,
-1.014431, 0.1061675, 0.02107332, 0, 0, 1, 1, 1,
-1.004955, -0.4650878, -1.443808, 1, 0, 0, 1, 1,
-1.00066, 1.027314, -0.5774302, 1, 0, 0, 1, 1,
-0.9950464, 1.080063, -0.3079145, 1, 0, 0, 1, 1,
-0.994223, 0.6334376, -1.356019, 1, 0, 0, 1, 1,
-0.9940459, -0.03037217, -1.70448, 1, 0, 0, 1, 1,
-0.9889402, -2.414633, -1.965434, 0, 0, 0, 1, 1,
-0.9868978, 1.005921, -1.708153, 0, 0, 0, 1, 1,
-0.9810287, 0.1979474, -0.02475526, 0, 0, 0, 1, 1,
-0.9707857, 0.7588666, -1.430073, 0, 0, 0, 1, 1,
-0.9703352, -2.714796, -3.746615, 0, 0, 0, 1, 1,
-0.9579355, -1.091382, -2.403668, 0, 0, 0, 1, 1,
-0.9569338, 0.4286882, -1.470616, 0, 0, 0, 1, 1,
-0.9536374, 2.027641, -2.989804, 1, 1, 1, 1, 1,
-0.9487417, -0.3837325, -2.288456, 1, 1, 1, 1, 1,
-0.947361, 0.8563504, -0.6486096, 1, 1, 1, 1, 1,
-0.9351069, 1.036872, -0.6967615, 1, 1, 1, 1, 1,
-0.934338, -1.763754, -1.68705, 1, 1, 1, 1, 1,
-0.9329212, -0.09470294, -2.140506, 1, 1, 1, 1, 1,
-0.929748, 0.2695579, -0.1589032, 1, 1, 1, 1, 1,
-0.9241057, -1.832001, -2.77618, 1, 1, 1, 1, 1,
-0.9146692, 0.4053202, -0.9971316, 1, 1, 1, 1, 1,
-0.9116248, -0.9169661, -2.148396, 1, 1, 1, 1, 1,
-0.9081695, 0.01247259, -2.011493, 1, 1, 1, 1, 1,
-0.8992954, -0.7979875, -3.980657, 1, 1, 1, 1, 1,
-0.8988105, 0.0600674, -2.181958, 1, 1, 1, 1, 1,
-0.8930882, -1.175009, -3.276018, 1, 1, 1, 1, 1,
-0.8930689, -0.0658547, -1.655995, 1, 1, 1, 1, 1,
-0.8928714, -0.3083544, -2.120818, 0, 0, 1, 1, 1,
-0.8893892, 0.04342935, 0.06845336, 1, 0, 0, 1, 1,
-0.8848063, -0.7852422, -3.035236, 1, 0, 0, 1, 1,
-0.8817381, 1.021418, -0.963292, 1, 0, 0, 1, 1,
-0.8812868, 0.5579651, -0.9271402, 1, 0, 0, 1, 1,
-0.8775312, 0.5003036, -3.312419, 1, 0, 0, 1, 1,
-0.8755759, -0.5846375, -2.89801, 0, 0, 0, 1, 1,
-0.871627, 0.644316, -1.419834, 0, 0, 0, 1, 1,
-0.8648695, 0.9357035, -0.3574521, 0, 0, 0, 1, 1,
-0.8569852, 0.04322763, -3.154997, 0, 0, 0, 1, 1,
-0.8538254, -1.663787, -2.710136, 0, 0, 0, 1, 1,
-0.8460473, 0.5874853, 0.07798709, 0, 0, 0, 1, 1,
-0.8458725, 1.105906, -1.781202, 0, 0, 0, 1, 1,
-0.844016, 0.725062, -0.172378, 1, 1, 1, 1, 1,
-0.8429887, 1.714855, -0.3558709, 1, 1, 1, 1, 1,
-0.8379374, -0.9293026, -2.803742, 1, 1, 1, 1, 1,
-0.8357112, 0.3186618, -1.694421, 1, 1, 1, 1, 1,
-0.8263609, -1.44253, -2.898042, 1, 1, 1, 1, 1,
-0.8261729, 0.6544893, -1.941178, 1, 1, 1, 1, 1,
-0.8253981, -0.730747, -2.183753, 1, 1, 1, 1, 1,
-0.8251088, 0.1925026, -1.389481, 1, 1, 1, 1, 1,
-0.8244335, -2.075098, -3.850916, 1, 1, 1, 1, 1,
-0.811082, -0.3509111, -1.935382, 1, 1, 1, 1, 1,
-0.8100666, 1.074072, -1.511192, 1, 1, 1, 1, 1,
-0.8077207, -0.8062566, -2.354205, 1, 1, 1, 1, 1,
-0.8052823, -0.0498706, -1.980783, 1, 1, 1, 1, 1,
-0.802771, -0.4470507, -2.500298, 1, 1, 1, 1, 1,
-0.8027549, 0.483979, 0.9800196, 1, 1, 1, 1, 1,
-0.7989218, 0.9390033, -0.1514514, 0, 0, 1, 1, 1,
-0.7984816, 0.6539201, 0.4117973, 1, 0, 0, 1, 1,
-0.7983158, -1.885446, -2.974261, 1, 0, 0, 1, 1,
-0.7950332, -0.8041475, -1.130212, 1, 0, 0, 1, 1,
-0.7896708, 0.3951885, -2.039545, 1, 0, 0, 1, 1,
-0.7854255, -1.165341, -1.440587, 1, 0, 0, 1, 1,
-0.7734862, 1.344974, 0.4201729, 0, 0, 0, 1, 1,
-0.7713447, -0.2612302, -1.443434, 0, 0, 0, 1, 1,
-0.7702632, 0.1270421, -1.322851, 0, 0, 0, 1, 1,
-0.7673551, 1.06896, 0.8345108, 0, 0, 0, 1, 1,
-0.7657866, -0.7944338, -2.511601, 0, 0, 0, 1, 1,
-0.7619393, -0.6866048, -1.446311, 0, 0, 0, 1, 1,
-0.7607614, 0.6673478, -0.4556076, 0, 0, 0, 1, 1,
-0.7604938, -0.06684817, -2.68166, 1, 1, 1, 1, 1,
-0.7585769, 0.9584571, -0.3202511, 1, 1, 1, 1, 1,
-0.7565442, 0.491469, 0.3719304, 1, 1, 1, 1, 1,
-0.7530937, 1.103843, -2.166634, 1, 1, 1, 1, 1,
-0.7517189, 0.4130562, -1.35653, 1, 1, 1, 1, 1,
-0.7504716, 0.8707693, -0.7706411, 1, 1, 1, 1, 1,
-0.7487664, -0.1512191, -0.1686945, 1, 1, 1, 1, 1,
-0.745004, -1.777205, -2.607688, 1, 1, 1, 1, 1,
-0.7349048, -0.3306362, -2.092671, 1, 1, 1, 1, 1,
-0.7270107, 0.9016217, -3.21652, 1, 1, 1, 1, 1,
-0.7264032, 0.1304882, -2.141387, 1, 1, 1, 1, 1,
-0.7263679, -0.544746, -3.874138, 1, 1, 1, 1, 1,
-0.7202315, 0.9238899, -0.2209499, 1, 1, 1, 1, 1,
-0.7165543, 1.335696, -1.21085, 1, 1, 1, 1, 1,
-0.7095271, 1.426309, -0.9783902, 1, 1, 1, 1, 1,
-0.7090122, -0.8422744, -2.221412, 0, 0, 1, 1, 1,
-0.7083263, 1.327569, -1.122275, 1, 0, 0, 1, 1,
-0.7067978, 1.286478, 1.232093, 1, 0, 0, 1, 1,
-0.6991352, -0.9474396, -2.140354, 1, 0, 0, 1, 1,
-0.6984815, -1.315226, -2.89342, 1, 0, 0, 1, 1,
-0.6928769, 0.8331264, -0.5546424, 1, 0, 0, 1, 1,
-0.6927388, -0.5370032, -1.817806, 0, 0, 0, 1, 1,
-0.6917145, 0.9609534, -1.214764, 0, 0, 0, 1, 1,
-0.6891276, 0.8266968, -1.259965, 0, 0, 0, 1, 1,
-0.6798449, -0.3980081, -4.371677, 0, 0, 0, 1, 1,
-0.6796548, 1.010082, -0.3821452, 0, 0, 0, 1, 1,
-0.6793776, 1.361509, 1.491682, 0, 0, 0, 1, 1,
-0.6778405, 0.1434866, -1.021511, 0, 0, 0, 1, 1,
-0.6763297, -0.08893325, -2.164308, 1, 1, 1, 1, 1,
-0.672559, -0.1460244, -1.622773, 1, 1, 1, 1, 1,
-0.6657917, -0.7022606, -3.856601, 1, 1, 1, 1, 1,
-0.6648962, -0.2821755, -1.466724, 1, 1, 1, 1, 1,
-0.6641803, -1.765765, -0.84982, 1, 1, 1, 1, 1,
-0.6630765, 0.2229696, -0.6124098, 1, 1, 1, 1, 1,
-0.6562822, -1.321669, -2.139948, 1, 1, 1, 1, 1,
-0.6557255, 0.6532111, -0.1612671, 1, 1, 1, 1, 1,
-0.6553918, -0.3101608, -1.116004, 1, 1, 1, 1, 1,
-0.6550799, 0.03172798, -0.3415229, 1, 1, 1, 1, 1,
-0.6397594, -0.638021, -3.454332, 1, 1, 1, 1, 1,
-0.6366948, -0.9577366, -1.60887, 1, 1, 1, 1, 1,
-0.6357923, 1.341845, 2.295098, 1, 1, 1, 1, 1,
-0.6324087, -0.9311193, -2.119876, 1, 1, 1, 1, 1,
-0.6321127, -0.2601838, -1.152479, 1, 1, 1, 1, 1,
-0.6311081, 0.834483, -1.705549, 0, 0, 1, 1, 1,
-0.6257522, 1.645639, 0.3265008, 1, 0, 0, 1, 1,
-0.6255392, 1.27405, 1.031208, 1, 0, 0, 1, 1,
-0.6239187, 1.436569, -0.3188839, 1, 0, 0, 1, 1,
-0.6201742, -0.8110584, -1.668463, 1, 0, 0, 1, 1,
-0.6175178, 0.8656214, -0.4872116, 1, 0, 0, 1, 1,
-0.6171933, -0.7234863, -3.31681, 0, 0, 0, 1, 1,
-0.6171001, 0.1287721, -1.826249, 0, 0, 0, 1, 1,
-0.61369, 0.6642219, 0.1078849, 0, 0, 0, 1, 1,
-0.6119761, 1.584107, 0.03851758, 0, 0, 0, 1, 1,
-0.6063739, -1.800689, -1.824202, 0, 0, 0, 1, 1,
-0.5951111, 1.16057, -0.02193192, 0, 0, 0, 1, 1,
-0.5943189, 1.248582, -0.6101686, 0, 0, 0, 1, 1,
-0.5799907, -1.351159, -1.427666, 1, 1, 1, 1, 1,
-0.5758145, -1.446032, -4.110501, 1, 1, 1, 1, 1,
-0.5709336, 1.025022, 0.2856264, 1, 1, 1, 1, 1,
-0.5694064, 1.351208, 0.1344484, 1, 1, 1, 1, 1,
-0.5672272, 0.3001513, -2.57487, 1, 1, 1, 1, 1,
-0.5663258, 0.6836754, -0.654339, 1, 1, 1, 1, 1,
-0.5568628, 0.7746966, 0.2777578, 1, 1, 1, 1, 1,
-0.5565314, 0.9643489, -0.9336829, 1, 1, 1, 1, 1,
-0.5553676, 0.570451, -0.6204776, 1, 1, 1, 1, 1,
-0.5545409, -0.6301596, -1.626412, 1, 1, 1, 1, 1,
-0.5473833, 1.08303, -0.3660378, 1, 1, 1, 1, 1,
-0.5431533, -0.7892461, -3.668246, 1, 1, 1, 1, 1,
-0.5423853, -1.110018, -2.341277, 1, 1, 1, 1, 1,
-0.5419329, 0.9020987, -0.3763269, 1, 1, 1, 1, 1,
-0.5377427, 0.4806572, -0.233489, 1, 1, 1, 1, 1,
-0.5370136, 0.003722784, -1.021442, 0, 0, 1, 1, 1,
-0.5311389, -0.07246261, -1.354388, 1, 0, 0, 1, 1,
-0.5278053, 0.7498943, 1.489209, 1, 0, 0, 1, 1,
-0.5260323, 1.098605, 0.8179033, 1, 0, 0, 1, 1,
-0.5195054, 0.1068398, -2.332195, 1, 0, 0, 1, 1,
-0.5184303, 0.07334301, -2.310744, 1, 0, 0, 1, 1,
-0.5061797, 1.828259, -0.8916701, 0, 0, 0, 1, 1,
-0.4996776, -0.279413, -3.482699, 0, 0, 0, 1, 1,
-0.4963515, 0.329208, -0.01720281, 0, 0, 0, 1, 1,
-0.4938544, -0.4156211, -3.769403, 0, 0, 0, 1, 1,
-0.4913457, 0.4515613, -1.103036, 0, 0, 0, 1, 1,
-0.4897344, 0.99661, -1.059172, 0, 0, 0, 1, 1,
-0.4897084, 0.07477966, -2.706709, 0, 0, 0, 1, 1,
-0.4887735, -0.5516409, -2.444521, 1, 1, 1, 1, 1,
-0.4841022, 1.135492, -1.390731, 1, 1, 1, 1, 1,
-0.4818611, 1.077719, -0.6435074, 1, 1, 1, 1, 1,
-0.4805404, -2.232001, -2.52362, 1, 1, 1, 1, 1,
-0.476955, 1.683005, 0.02424911, 1, 1, 1, 1, 1,
-0.474191, -1.076568, -4.470652, 1, 1, 1, 1, 1,
-0.4726496, 0.5949816, -1.919937, 1, 1, 1, 1, 1,
-0.4700432, -0.9450936, -4.455315, 1, 1, 1, 1, 1,
-0.4691547, 0.6077398, -1.537049, 1, 1, 1, 1, 1,
-0.4642001, -0.5194799, -2.65429, 1, 1, 1, 1, 1,
-0.4583364, 1.685153, -0.8037938, 1, 1, 1, 1, 1,
-0.4556912, 0.6454829, 1.583162, 1, 1, 1, 1, 1,
-0.4546978, -0.1411415, -1.125224, 1, 1, 1, 1, 1,
-0.45202, 1.190976, -0.2222619, 1, 1, 1, 1, 1,
-0.4519063, -0.6593097, -3.130666, 1, 1, 1, 1, 1,
-0.4429803, 0.9228032, 0.4784568, 0, 0, 1, 1, 1,
-0.4424895, -0.1157161, -0.6171234, 1, 0, 0, 1, 1,
-0.4418008, 1.490387, -0.8583974, 1, 0, 0, 1, 1,
-0.4305882, 0.467624, -0.7477517, 1, 0, 0, 1, 1,
-0.4263557, 0.3745216, -2.406631, 1, 0, 0, 1, 1,
-0.4258453, 0.7173195, -1.029887, 1, 0, 0, 1, 1,
-0.4255637, 0.1546893, 0.5584576, 0, 0, 0, 1, 1,
-0.4183256, -1.330456, -2.739768, 0, 0, 0, 1, 1,
-0.4172387, -0.007530147, -1.239275, 0, 0, 0, 1, 1,
-0.4127646, 1.218275, 0.1669756, 0, 0, 0, 1, 1,
-0.4097161, 0.2314298, 0.009396596, 0, 0, 0, 1, 1,
-0.4094095, 3.244178, -1.137647, 0, 0, 0, 1, 1,
-0.4088994, -0.778639, -4.447616, 0, 0, 0, 1, 1,
-0.4087856, 1.544203, 0.7028496, 1, 1, 1, 1, 1,
-0.407389, -1.097126, -3.085988, 1, 1, 1, 1, 1,
-0.4056151, 0.4226314, -1.233851, 1, 1, 1, 1, 1,
-0.4048729, -0.6358167, -0.3235571, 1, 1, 1, 1, 1,
-0.4029269, 0.4734468, -1.115421, 1, 1, 1, 1, 1,
-0.3957388, 0.8914595, 0.8436416, 1, 1, 1, 1, 1,
-0.3948939, -0.5732119, -2.024004, 1, 1, 1, 1, 1,
-0.3929093, -0.1272011, -1.82449, 1, 1, 1, 1, 1,
-0.3885404, 1.217447, 0.4327944, 1, 1, 1, 1, 1,
-0.3855662, -0.2382617, -1.435218, 1, 1, 1, 1, 1,
-0.3829812, -1.598157, -4.402407, 1, 1, 1, 1, 1,
-0.3799773, 0.5684358, -1.830408, 1, 1, 1, 1, 1,
-0.379346, 1.113064, -0.2090283, 1, 1, 1, 1, 1,
-0.3787286, -0.880473, -3.274016, 1, 1, 1, 1, 1,
-0.3774793, -0.432993, -2.611875, 1, 1, 1, 1, 1,
-0.3769015, -0.04550591, -1.776041, 0, 0, 1, 1, 1,
-0.3710892, -0.4033677, -2.55894, 1, 0, 0, 1, 1,
-0.3687464, 0.1350033, -0.2785708, 1, 0, 0, 1, 1,
-0.3678609, -0.001496183, -1.495702, 1, 0, 0, 1, 1,
-0.3674624, -0.5990392, -2.694707, 1, 0, 0, 1, 1,
-0.3655638, -1.554897, -2.604948, 1, 0, 0, 1, 1,
-0.3636487, 0.5773054, 0.1891845, 0, 0, 0, 1, 1,
-0.3617807, -0.4494584, -3.248229, 0, 0, 0, 1, 1,
-0.3614008, -0.1321619, -2.366221, 0, 0, 0, 1, 1,
-0.3559963, -0.1992193, -3.038675, 0, 0, 0, 1, 1,
-0.355599, -0.5228687, -3.856404, 0, 0, 0, 1, 1,
-0.3541747, 1.580795, 1.487706, 0, 0, 0, 1, 1,
-0.3541377, 0.1888939, -1.786171, 0, 0, 0, 1, 1,
-0.3502916, 3.828596, -2.502871, 1, 1, 1, 1, 1,
-0.3487445, 0.6201958, -1.146617, 1, 1, 1, 1, 1,
-0.33582, 0.1431961, -1.163216, 1, 1, 1, 1, 1,
-0.3340648, 1.29511, -1.268637, 1, 1, 1, 1, 1,
-0.3288625, 1.316017, 1.48265, 1, 1, 1, 1, 1,
-0.3267787, -1.678957, -3.715638, 1, 1, 1, 1, 1,
-0.3254794, 0.0297016, -1.476625, 1, 1, 1, 1, 1,
-0.322153, -2.071904, -3.486661, 1, 1, 1, 1, 1,
-0.3211134, 0.4849691, -0.5836573, 1, 1, 1, 1, 1,
-0.3192843, 0.640565, 0.6936312, 1, 1, 1, 1, 1,
-0.3192559, -0.199827, -0.7852883, 1, 1, 1, 1, 1,
-0.3085466, 1.263342, -1.791128, 1, 1, 1, 1, 1,
-0.3080186, -0.6352013, -3.500108, 1, 1, 1, 1, 1,
-0.2986003, 0.7922677, -1.604715, 1, 1, 1, 1, 1,
-0.2974193, 0.06775037, -1.554516, 1, 1, 1, 1, 1,
-0.2949416, -0.5804369, -1.576374, 0, 0, 1, 1, 1,
-0.2931626, -0.2245227, -0.3685938, 1, 0, 0, 1, 1,
-0.2898922, 0.4424144, -0.7837234, 1, 0, 0, 1, 1,
-0.2788376, -0.1737017, -1.498374, 1, 0, 0, 1, 1,
-0.2787209, 0.5387306, -0.01596449, 1, 0, 0, 1, 1,
-0.2769423, 1.182454, 0.5170707, 1, 0, 0, 1, 1,
-0.2768316, 0.9847317, 0.7942302, 0, 0, 0, 1, 1,
-0.2752226, 0.1681668, -1.31897, 0, 0, 0, 1, 1,
-0.2724769, -0.2035685, -4.167825, 0, 0, 0, 1, 1,
-0.272337, -0.9766088, -2.505507, 0, 0, 0, 1, 1,
-0.2718499, -1.320306, -2.910084, 0, 0, 0, 1, 1,
-0.2636114, -1.904281, -2.589043, 0, 0, 0, 1, 1,
-0.2589437, 0.9184238, 1.297264, 0, 0, 0, 1, 1,
-0.2540163, -0.1469296, -3.738259, 1, 1, 1, 1, 1,
-0.2516704, 0.1923573, -0.1170673, 1, 1, 1, 1, 1,
-0.2489381, -0.1951885, -1.993725, 1, 1, 1, 1, 1,
-0.2444259, -0.2717024, -2.06485, 1, 1, 1, 1, 1,
-0.2357279, 0.2803825, 1.13496, 1, 1, 1, 1, 1,
-0.2338842, -0.6249354, -1.976745, 1, 1, 1, 1, 1,
-0.2332025, -0.4206655, -2.504992, 1, 1, 1, 1, 1,
-0.2327453, 0.2555853, 0.6402916, 1, 1, 1, 1, 1,
-0.2283341, -0.2231955, -2.511433, 1, 1, 1, 1, 1,
-0.2255732, 0.2738841, -0.5412408, 1, 1, 1, 1, 1,
-0.2254471, 0.419291, -0.1471429, 1, 1, 1, 1, 1,
-0.2223565, -2.481233, -3.603096, 1, 1, 1, 1, 1,
-0.2207985, -0.3546183, -3.99559, 1, 1, 1, 1, 1,
-0.217484, -0.5180573, -1.367876, 1, 1, 1, 1, 1,
-0.215964, -1.519234, -1.560426, 1, 1, 1, 1, 1,
-0.2156595, -1.843026, -3.06656, 0, 0, 1, 1, 1,
-0.215502, -0.07112817, -1.792356, 1, 0, 0, 1, 1,
-0.2146794, 1.022581, 0.5809433, 1, 0, 0, 1, 1,
-0.2095968, 1.018753, 0.2155722, 1, 0, 0, 1, 1,
-0.2047256, 1.449323, 2.627997, 1, 0, 0, 1, 1,
-0.203474, 0.8217912, 0.08747868, 1, 0, 0, 1, 1,
-0.2006489, 0.7599207, 0.6762997, 0, 0, 0, 1, 1,
-0.1975071, -1.787665, -2.137954, 0, 0, 0, 1, 1,
-0.1971113, -0.7852068, -1.629141, 0, 0, 0, 1, 1,
-0.1953236, 0.04744725, -0.8087903, 0, 0, 0, 1, 1,
-0.1937382, -1.43888, -3.389052, 0, 0, 0, 1, 1,
-0.191389, 0.7416035, -0.6615318, 0, 0, 0, 1, 1,
-0.1850578, -1.16756, -2.119868, 0, 0, 0, 1, 1,
-0.1777647, -0.8793087, -4.532036, 1, 1, 1, 1, 1,
-0.1769477, -2.56705, -1.460989, 1, 1, 1, 1, 1,
-0.1766407, 0.7132379, -1.640931, 1, 1, 1, 1, 1,
-0.1732601, 0.6772277, -0.6248147, 1, 1, 1, 1, 1,
-0.1716604, -0.657507, -3.998106, 1, 1, 1, 1, 1,
-0.169136, 1.645195, -0.4220817, 1, 1, 1, 1, 1,
-0.1690597, -0.6695361, -1.652035, 1, 1, 1, 1, 1,
-0.1675571, 0.3952782, -2.175807, 1, 1, 1, 1, 1,
-0.1648764, -1.595547, -4.161914, 1, 1, 1, 1, 1,
-0.1648266, -0.7344164, -3.076508, 1, 1, 1, 1, 1,
-0.1624892, -0.4538856, -3.322637, 1, 1, 1, 1, 1,
-0.1574145, -0.4267711, -3.40701, 1, 1, 1, 1, 1,
-0.1479387, -0.6860789, -4.709773, 1, 1, 1, 1, 1,
-0.1455096, 0.7796657, 0.07765914, 1, 1, 1, 1, 1,
-0.1439429, -1.57595, -3.474727, 1, 1, 1, 1, 1,
-0.1425509, 0.7458761, 0.540522, 0, 0, 1, 1, 1,
-0.1410822, -0.7872533, -3.4852, 1, 0, 0, 1, 1,
-0.1371523, 0.6054969, -0.4501875, 1, 0, 0, 1, 1,
-0.1363266, -1.776114, -4.840741, 1, 0, 0, 1, 1,
-0.1357498, -0.5965165, -1.326795, 1, 0, 0, 1, 1,
-0.1348855, -1.311522, -2.467797, 1, 0, 0, 1, 1,
-0.1345126, 1.06829, -1.497178, 0, 0, 0, 1, 1,
-0.1326732, -0.2296453, -3.433653, 0, 0, 0, 1, 1,
-0.1320087, -0.5975925, -2.373881, 0, 0, 0, 1, 1,
-0.1303706, -1.172266, -2.220078, 0, 0, 0, 1, 1,
-0.1216852, -1.505701, -2.928834, 0, 0, 0, 1, 1,
-0.120109, -0.3490036, -2.19569, 0, 0, 0, 1, 1,
-0.1157475, -0.9110426, -3.187874, 0, 0, 0, 1, 1,
-0.1156136, 0.1533062, 0.8043903, 1, 1, 1, 1, 1,
-0.1110573, -0.8912629, -2.651124, 1, 1, 1, 1, 1,
-0.1077652, 0.8972584, 0.08222038, 1, 1, 1, 1, 1,
-0.1074549, -1.277585, -4.126823, 1, 1, 1, 1, 1,
-0.1063645, 0.06215894, -2.430306, 1, 1, 1, 1, 1,
-0.105248, -0.6148501, -4.727741, 1, 1, 1, 1, 1,
-0.1008602, 0.8221697, 1.28597, 1, 1, 1, 1, 1,
-0.1000927, -0.3648013, -1.63899, 1, 1, 1, 1, 1,
-0.09890994, 1.197614, 1.009039, 1, 1, 1, 1, 1,
-0.09833462, -1.308515, -5.645872, 1, 1, 1, 1, 1,
-0.09382347, 0.1906598, 0.5139053, 1, 1, 1, 1, 1,
-0.08966188, -1.360206, -2.678479, 1, 1, 1, 1, 1,
-0.08935806, 1.091919, -0.9928895, 1, 1, 1, 1, 1,
-0.08760667, -0.3863687, -3.497178, 1, 1, 1, 1, 1,
-0.08745411, -1.312418, -1.907521, 1, 1, 1, 1, 1,
-0.08272747, 0.1731897, -0.9236783, 0, 0, 1, 1, 1,
-0.07461222, 0.6113158, -1.557096, 1, 0, 0, 1, 1,
-0.07184941, 1.543925, -0.4068005, 1, 0, 0, 1, 1,
-0.07120901, -1.888618, -4.332623, 1, 0, 0, 1, 1,
-0.07009087, -0.08255719, -2.507307, 1, 0, 0, 1, 1,
-0.06960825, 0.6240819, -1.159019, 1, 0, 0, 1, 1,
-0.06579418, 1.85011, -1.974253, 0, 0, 0, 1, 1,
-0.06301059, -0.5405914, -3.140339, 0, 0, 0, 1, 1,
-0.06118481, 0.1329142, -1.373469, 0, 0, 0, 1, 1,
-0.06046781, -1.711398, -5.269755, 0, 0, 0, 1, 1,
-0.05984714, 1.474027, 0.3944844, 0, 0, 0, 1, 1,
-0.05813983, -0.9134041, -2.378556, 0, 0, 0, 1, 1,
-0.0575267, -0.6305801, -2.157243, 0, 0, 0, 1, 1,
-0.0535249, -0.7069334, -3.171663, 1, 1, 1, 1, 1,
-0.04727484, 0.7536926, -0.4869441, 1, 1, 1, 1, 1,
-0.03827186, 0.6520157, -0.3696976, 1, 1, 1, 1, 1,
-0.03819822, 0.5726497, -0.4491183, 1, 1, 1, 1, 1,
-0.03287238, -0.1209193, -3.272879, 1, 1, 1, 1, 1,
-0.03172053, -0.003510744, -2.510398, 1, 1, 1, 1, 1,
-0.02922522, -1.663244, -3.893365, 1, 1, 1, 1, 1,
-0.02822211, 0.6926393, -1.959084, 1, 1, 1, 1, 1,
-0.02206682, 0.6213627, 0.005221414, 1, 1, 1, 1, 1,
-0.01652737, -0.1724972, -3.1424, 1, 1, 1, 1, 1,
-0.01270142, 0.6216239, -0.2065614, 1, 1, 1, 1, 1,
-0.01255607, 1.31359, 0.6475525, 1, 1, 1, 1, 1,
-0.01127039, 0.03968047, 0.3530456, 1, 1, 1, 1, 1,
-0.009025841, 0.2406401, -2.532341, 1, 1, 1, 1, 1,
-0.006607066, -0.05582866, -5.035715, 1, 1, 1, 1, 1,
-0.003748876, -1.643476, -2.200817, 0, 0, 1, 1, 1,
0.0001160375, -0.7164344, 2.180604, 1, 0, 0, 1, 1,
0.001363802, 1.165434, -1.683342, 1, 0, 0, 1, 1,
0.005987539, 0.8153172, 1.995841, 1, 0, 0, 1, 1,
0.008817605, 0.9886567, 0.5590053, 1, 0, 0, 1, 1,
0.01137883, -0.8987875, 4.227079, 1, 0, 0, 1, 1,
0.01431089, -0.5680954, 2.667505, 0, 0, 0, 1, 1,
0.01457213, 0.8643329, -0.5942751, 0, 0, 0, 1, 1,
0.01467153, -0.123259, 3.144055, 0, 0, 0, 1, 1,
0.01626864, -0.3815973, 3.158516, 0, 0, 0, 1, 1,
0.01748359, -1.393039, 2.48076, 0, 0, 0, 1, 1,
0.01764571, 0.3349027, -0.3869188, 0, 0, 0, 1, 1,
0.01774032, 0.8218235, -0.6057858, 0, 0, 0, 1, 1,
0.02362637, 0.7831668, 0.5859591, 1, 1, 1, 1, 1,
0.02489129, 1.044642, -0.1538474, 1, 1, 1, 1, 1,
0.02492194, -0.8573459, 4.975705, 1, 1, 1, 1, 1,
0.02563062, 0.206704, 0.7465043, 1, 1, 1, 1, 1,
0.02842694, -0.5072384, 3.51547, 1, 1, 1, 1, 1,
0.03167032, 2.459917, 0.6689849, 1, 1, 1, 1, 1,
0.03363837, 0.4231713, 2.280971, 1, 1, 1, 1, 1,
0.0393851, 1.479998, -0.6460786, 1, 1, 1, 1, 1,
0.04066321, 0.2729373, 0.02101902, 1, 1, 1, 1, 1,
0.04098985, 0.5651789, 0.09019063, 1, 1, 1, 1, 1,
0.04290509, -1.778784, 3.994297, 1, 1, 1, 1, 1,
0.0490812, 0.3048813, -0.8717642, 1, 1, 1, 1, 1,
0.05016638, 0.331486, 1.635532, 1, 1, 1, 1, 1,
0.05182356, 1.978268, -1.463928, 1, 1, 1, 1, 1,
0.05213188, 0.6714661, -0.4907545, 1, 1, 1, 1, 1,
0.0548688, -0.09596916, 2.810658, 0, 0, 1, 1, 1,
0.05953865, 0.3969918, 0.5894384, 1, 0, 0, 1, 1,
0.06496138, 0.8742135, 0.928603, 1, 0, 0, 1, 1,
0.06826098, 0.8345836, -1.049156, 1, 0, 0, 1, 1,
0.06844635, 2.035788, 0.0804384, 1, 0, 0, 1, 1,
0.07188465, -0.5858437, 1.751806, 1, 0, 0, 1, 1,
0.07652173, 0.1702638, 0.9289175, 0, 0, 0, 1, 1,
0.07669277, -0.1327881, 4.039149, 0, 0, 0, 1, 1,
0.07865185, 0.5422564, 0.7380576, 0, 0, 0, 1, 1,
0.081073, 0.6300905, -1.33139, 0, 0, 0, 1, 1,
0.08108764, -1.085135, 2.289962, 0, 0, 0, 1, 1,
0.08293822, -0.2996356, 2.50755, 0, 0, 0, 1, 1,
0.08432743, 1.788478, 0.592829, 0, 0, 0, 1, 1,
0.08641985, 0.07225387, 2.556451, 1, 1, 1, 1, 1,
0.0933707, -0.4667498, 2.131494, 1, 1, 1, 1, 1,
0.09517273, 0.8894932, 0.6317665, 1, 1, 1, 1, 1,
0.09607855, 0.5412015, 1.328531, 1, 1, 1, 1, 1,
0.09750918, 0.07600857, 1.030257, 1, 1, 1, 1, 1,
0.1007238, 0.8174257, 0.779955, 1, 1, 1, 1, 1,
0.1025724, -0.8804001, 1.227015, 1, 1, 1, 1, 1,
0.1040551, -0.05375527, 2.084362, 1, 1, 1, 1, 1,
0.1078308, -0.4749205, 2.023304, 1, 1, 1, 1, 1,
0.1084154, -0.3531225, 2.827889, 1, 1, 1, 1, 1,
0.1130206, 0.4473454, -0.3742251, 1, 1, 1, 1, 1,
0.115312, -0.7408295, 4.019734, 1, 1, 1, 1, 1,
0.1154281, 0.2096837, 0.9050128, 1, 1, 1, 1, 1,
0.1165659, -1.497388, 3.069522, 1, 1, 1, 1, 1,
0.1178993, -1.572223, 2.766814, 1, 1, 1, 1, 1,
0.118055, 1.073573, -0.4319622, 0, 0, 1, 1, 1,
0.1186506, -0.196442, 2.083877, 1, 0, 0, 1, 1,
0.1267436, -0.487713, 2.77105, 1, 0, 0, 1, 1,
0.1304746, 0.1345972, 0.8787843, 1, 0, 0, 1, 1,
0.1309382, -1.042277, 4.110062, 1, 0, 0, 1, 1,
0.1328841, 0.8405408, 2.026021, 1, 0, 0, 1, 1,
0.1415314, -0.6475099, 4.136189, 0, 0, 0, 1, 1,
0.1434399, 0.8696895, 1.035389, 0, 0, 0, 1, 1,
0.1459006, 0.4474224, -0.6209008, 0, 0, 0, 1, 1,
0.1459553, -1.579975, 3.602431, 0, 0, 0, 1, 1,
0.1527506, 0.3571726, 0.1042777, 0, 0, 0, 1, 1,
0.16426, 1.842808, -0.08320619, 0, 0, 0, 1, 1,
0.164414, 0.5164506, -1.167582, 0, 0, 0, 1, 1,
0.1663708, 1.172715, 0.5624624, 1, 1, 1, 1, 1,
0.1695488, -0.2790706, 3.324032, 1, 1, 1, 1, 1,
0.1700458, 0.7137731, -1.451089, 1, 1, 1, 1, 1,
0.1714212, -2.023068, 3.245945, 1, 1, 1, 1, 1,
0.1795405, 0.7992433, 1.157351, 1, 1, 1, 1, 1,
0.1799214, -1.361746, 2.799518, 1, 1, 1, 1, 1,
0.1807866, -0.146554, 1.020335, 1, 1, 1, 1, 1,
0.1818223, -0.5356005, 2.732969, 1, 1, 1, 1, 1,
0.1833231, 0.06447347, 1.704806, 1, 1, 1, 1, 1,
0.185803, -0.4699591, 2.719115, 1, 1, 1, 1, 1,
0.1912921, 1.260008, -1.571405, 1, 1, 1, 1, 1,
0.1922888, -0.2636706, 2.150958, 1, 1, 1, 1, 1,
0.1978673, -1.013307, 3.072199, 1, 1, 1, 1, 1,
0.1993523, -0.1892037, 3.111331, 1, 1, 1, 1, 1,
0.2059994, 1.448275, 1.627739, 1, 1, 1, 1, 1,
0.2062799, 1.049004, 0.8484283, 0, 0, 1, 1, 1,
0.2110453, 0.6786888, 0.7715191, 1, 0, 0, 1, 1,
0.2116483, 0.008036192, 0.9293814, 1, 0, 0, 1, 1,
0.2190086, -0.6399611, 2.034533, 1, 0, 0, 1, 1,
0.2207503, -1.494376, 3.224744, 1, 0, 0, 1, 1,
0.2209566, -0.1439384, 1.314885, 1, 0, 0, 1, 1,
0.2212299, -1.332122, 2.132123, 0, 0, 0, 1, 1,
0.2220459, 2.272462, -0.4256636, 0, 0, 0, 1, 1,
0.2226824, 0.05726135, 1.207736, 0, 0, 0, 1, 1,
0.2239229, -0.9443457, 1.35508, 0, 0, 0, 1, 1,
0.2283274, -0.7066177, 3.188982, 0, 0, 0, 1, 1,
0.2313555, 1.815691, -0.785348, 0, 0, 0, 1, 1,
0.2401724, 0.08190193, 2.059875, 0, 0, 0, 1, 1,
0.2421873, -2.847548, 1.354825, 1, 1, 1, 1, 1,
0.2425895, 0.01510634, 0.9363929, 1, 1, 1, 1, 1,
0.2444587, 1.857036, -1.061127, 1, 1, 1, 1, 1,
0.245875, 1.11325, 1.150077, 1, 1, 1, 1, 1,
0.2468877, -0.1125496, 2.209185, 1, 1, 1, 1, 1,
0.2487268, 0.7043734, 0.1857908, 1, 1, 1, 1, 1,
0.2502108, 0.16866, 0.9646422, 1, 1, 1, 1, 1,
0.2548905, -0.5976063, 3.275292, 1, 1, 1, 1, 1,
0.2548941, 0.1070683, 1.019507, 1, 1, 1, 1, 1,
0.2564557, 1.604986, -1.685116, 1, 1, 1, 1, 1,
0.2580878, 0.37001, -1.07471, 1, 1, 1, 1, 1,
0.2592612, -1.363346, 1.608449, 1, 1, 1, 1, 1,
0.2594799, 0.3306592, 1.022345, 1, 1, 1, 1, 1,
0.263943, 0.1953114, 1.862942, 1, 1, 1, 1, 1,
0.2680346, 1.147604, -0.0571297, 1, 1, 1, 1, 1,
0.2702773, -1.592744, 3.809674, 0, 0, 1, 1, 1,
0.2772641, 0.1700033, 1.141919, 1, 0, 0, 1, 1,
0.2899767, 1.080545, -1.784291, 1, 0, 0, 1, 1,
0.2917726, 0.6382721, 0.0006013665, 1, 0, 0, 1, 1,
0.2933868, -1.153907, 2.698562, 1, 0, 0, 1, 1,
0.2941587, 0.2748471, 0.9117792, 1, 0, 0, 1, 1,
0.2968674, -0.7785087, 2.543812, 0, 0, 0, 1, 1,
0.3028545, 1.908738, 1.412129, 0, 0, 0, 1, 1,
0.3069099, -0.1336688, -1.289516, 0, 0, 0, 1, 1,
0.3128246, -1.214599, 2.371429, 0, 0, 0, 1, 1,
0.3129925, -1.584679, 1.996503, 0, 0, 0, 1, 1,
0.3129994, 0.006614981, 2.775423, 0, 0, 0, 1, 1,
0.32124, 0.04112054, 1.187626, 0, 0, 0, 1, 1,
0.3266498, -0.1086588, 1.766733, 1, 1, 1, 1, 1,
0.329257, -0.6219218, 2.256892, 1, 1, 1, 1, 1,
0.3324399, 0.927018, 0.9481235, 1, 1, 1, 1, 1,
0.3416476, -0.5831726, 4.933282, 1, 1, 1, 1, 1,
0.3433204, 1.109924, 0.5903755, 1, 1, 1, 1, 1,
0.3463186, -0.8318149, 4.354354, 1, 1, 1, 1, 1,
0.3470347, -0.3491856, 2.375969, 1, 1, 1, 1, 1,
0.3489152, 1.749523, -1.094875, 1, 1, 1, 1, 1,
0.3508191, -1.086621, 2.65584, 1, 1, 1, 1, 1,
0.3525381, -1.561378, 1.818469, 1, 1, 1, 1, 1,
0.3659468, 1.315654, 1.939296, 1, 1, 1, 1, 1,
0.3702357, 0.1243378, 1.820505, 1, 1, 1, 1, 1,
0.3727262, -0.4999411, 2.028019, 1, 1, 1, 1, 1,
0.3763441, 0.0828783, -0.6291776, 1, 1, 1, 1, 1,
0.3774866, -1.238005, 3.845434, 1, 1, 1, 1, 1,
0.3787512, 1.16879, 1.788994, 0, 0, 1, 1, 1,
0.3788279, -1.314048, 3.452341, 1, 0, 0, 1, 1,
0.3828472, 1.063247, 0.3568495, 1, 0, 0, 1, 1,
0.3912604, -0.4370182, 2.606562, 1, 0, 0, 1, 1,
0.3921541, -0.5905319, 2.546245, 1, 0, 0, 1, 1,
0.3939587, -1.248162, 2.899796, 1, 0, 0, 1, 1,
0.3971352, 0.6686047, 0.04882087, 0, 0, 0, 1, 1,
0.3973193, -0.06133109, 1.653885, 0, 0, 0, 1, 1,
0.4027048, 1.563331, 0.04920047, 0, 0, 0, 1, 1,
0.4034371, -1.175968, 2.239619, 0, 0, 0, 1, 1,
0.4048599, -1.979263, 3.307534, 0, 0, 0, 1, 1,
0.4136873, -0.3877841, 0.9050319, 0, 0, 0, 1, 1,
0.4147674, 0.04118795, 2.390938, 0, 0, 0, 1, 1,
0.4147863, 2.649876, 0.317834, 1, 1, 1, 1, 1,
0.4148925, -0.1657068, 1.470357, 1, 1, 1, 1, 1,
0.4153987, 1.55103, -0.1630176, 1, 1, 1, 1, 1,
0.4204782, 0.8748626, 0.6448029, 1, 1, 1, 1, 1,
0.4221105, 0.2275975, 1.10154, 1, 1, 1, 1, 1,
0.42215, 1.151633, 1.876001, 1, 1, 1, 1, 1,
0.4223604, 0.9511639, -0.9665093, 1, 1, 1, 1, 1,
0.4252909, 0.3509691, 1.087465, 1, 1, 1, 1, 1,
0.4280911, 1.969325, 0.7968919, 1, 1, 1, 1, 1,
0.4381963, 1.735527, 0.2475011, 1, 1, 1, 1, 1,
0.4402153, 0.09417465, 2.12799, 1, 1, 1, 1, 1,
0.4420501, 1.777546, 0.5260993, 1, 1, 1, 1, 1,
0.4474431, -1.8946, 4.121343, 1, 1, 1, 1, 1,
0.4518635, 0.1458762, 0.9917394, 1, 1, 1, 1, 1,
0.4613131, -1.041169, 0.2950954, 1, 1, 1, 1, 1,
0.4626901, 1.946513, -1.830924, 0, 0, 1, 1, 1,
0.4711651, 2.305073, 0.6815802, 1, 0, 0, 1, 1,
0.4726866, -0.7674432, 4.256289, 1, 0, 0, 1, 1,
0.4736378, 0.9790375, 0.2611643, 1, 0, 0, 1, 1,
0.478492, 0.5548645, 0.9567415, 1, 0, 0, 1, 1,
0.482393, -0.5785054, 3.95098, 1, 0, 0, 1, 1,
0.4889845, 1.617849, 0.2201971, 0, 0, 0, 1, 1,
0.4908762, 0.3095783, 0.3301817, 0, 0, 0, 1, 1,
0.4910217, 0.2470764, -1.636272, 0, 0, 0, 1, 1,
0.4920826, -0.9726678, 2.989226, 0, 0, 0, 1, 1,
0.4927883, -0.4821477, 1.94276, 0, 0, 0, 1, 1,
0.4952599, -0.7558981, 2.710456, 0, 0, 0, 1, 1,
0.4970528, 0.3536627, -0.125446, 0, 0, 0, 1, 1,
0.5035691, -0.7504041, 1.341009, 1, 1, 1, 1, 1,
0.5046697, 0.2356225, 0.5655705, 1, 1, 1, 1, 1,
0.5051223, -0.8117929, 1.511674, 1, 1, 1, 1, 1,
0.5072328, 1.462938, 2.241418, 1, 1, 1, 1, 1,
0.5113744, -0.2189483, 4.839777, 1, 1, 1, 1, 1,
0.5126362, 0.2954369, 0.2308666, 1, 1, 1, 1, 1,
0.5184507, -0.8161217, 2.96978, 1, 1, 1, 1, 1,
0.5185882, -0.8449788, 2.386793, 1, 1, 1, 1, 1,
0.5218313, 0.4223125, 0.6221726, 1, 1, 1, 1, 1,
0.5262579, -0.8718931, 3.277623, 1, 1, 1, 1, 1,
0.5264203, -0.1352735, 3.649199, 1, 1, 1, 1, 1,
0.5316501, -2.059401, 4.141084, 1, 1, 1, 1, 1,
0.5350343, -0.8858947, 2.512592, 1, 1, 1, 1, 1,
0.5371192, 0.8414167, 2.071513, 1, 1, 1, 1, 1,
0.5419245, -1.060118, 1.146217, 1, 1, 1, 1, 1,
0.5449527, 1.417619, -0.003253154, 0, 0, 1, 1, 1,
0.5457308, 0.06595323, 0.6995094, 1, 0, 0, 1, 1,
0.5522735, 1.626162, -3.151035, 1, 0, 0, 1, 1,
0.5564879, 0.9355215, -0.2358013, 1, 0, 0, 1, 1,
0.5667418, 0.5246662, 3.091733, 1, 0, 0, 1, 1,
0.5679763, 1.753712, 0.2048677, 1, 0, 0, 1, 1,
0.5726118, 1.190466, 1.125382, 0, 0, 0, 1, 1,
0.5776832, -0.718617, 1.145322, 0, 0, 0, 1, 1,
0.5930094, 1.300724, 1.43036, 0, 0, 0, 1, 1,
0.5963207, -0.01627038, 0.2819048, 0, 0, 0, 1, 1,
0.599002, -0.7481875, 2.489387, 0, 0, 0, 1, 1,
0.6021538, -0.3719659, -0.7758553, 0, 0, 0, 1, 1,
0.606815, -0.5519015, 2.935107, 0, 0, 0, 1, 1,
0.6069388, 1.56872, -0.9335515, 1, 1, 1, 1, 1,
0.6095818, 0.841173, 1.348049, 1, 1, 1, 1, 1,
0.6147989, 1.597202, 1.294866, 1, 1, 1, 1, 1,
0.6287255, 2.03147, 1.739265, 1, 1, 1, 1, 1,
0.6375825, -1.870508, 0.7585982, 1, 1, 1, 1, 1,
0.638535, 1.773785, -0.7884952, 1, 1, 1, 1, 1,
0.643239, 0.3176512, 2.256529, 1, 1, 1, 1, 1,
0.6437522, 0.07901599, 0.3510651, 1, 1, 1, 1, 1,
0.6450309, 0.5817437, 0.2328198, 1, 1, 1, 1, 1,
0.6488647, 0.503703, 1.113444, 1, 1, 1, 1, 1,
0.6505587, -1.305111, 0.9262115, 1, 1, 1, 1, 1,
0.6518305, -1.314288, 1.552476, 1, 1, 1, 1, 1,
0.6537906, -1.217711, 2.809577, 1, 1, 1, 1, 1,
0.6574908, -0.4953016, 1.438537, 1, 1, 1, 1, 1,
0.6584157, -0.5063662, 1.829455, 1, 1, 1, 1, 1,
0.6600145, 0.08591942, 3.186633, 0, 0, 1, 1, 1,
0.6602898, 0.7464359, 0.3777061, 1, 0, 0, 1, 1,
0.6693882, -1.589826, 2.705739, 1, 0, 0, 1, 1,
0.6763966, 1.925225, 0.7663046, 1, 0, 0, 1, 1,
0.6827639, 0.4492022, -0.3382749, 1, 0, 0, 1, 1,
0.6836363, 0.1474871, 1.680159, 1, 0, 0, 1, 1,
0.6841273, 1.441186, 0.9516115, 0, 0, 0, 1, 1,
0.6848966, -0.6435565, 2.980128, 0, 0, 0, 1, 1,
0.691424, -1.506617, 3.439945, 0, 0, 0, 1, 1,
0.6929616, -0.2067078, 0.8025165, 0, 0, 0, 1, 1,
0.6933001, -0.3271815, 1.295137, 0, 0, 0, 1, 1,
0.6935803, 0.1743704, 1.437803, 0, 0, 0, 1, 1,
0.7001216, 1.138384, 0.8090894, 0, 0, 0, 1, 1,
0.7038135, 0.3240496, 0.4850356, 1, 1, 1, 1, 1,
0.7078414, -0.3327144, 2.982961, 1, 1, 1, 1, 1,
0.7078763, 0.5807322, 1.519068, 1, 1, 1, 1, 1,
0.7105781, -0.02497241, 0.7991167, 1, 1, 1, 1, 1,
0.7108636, 1.459086, 1.443926, 1, 1, 1, 1, 1,
0.7127702, -0.2489984, 3.308706, 1, 1, 1, 1, 1,
0.7127862, -1.107195, 2.645304, 1, 1, 1, 1, 1,
0.7133242, -1.170026, 3.273669, 1, 1, 1, 1, 1,
0.7196426, -0.7436527, 4.768174, 1, 1, 1, 1, 1,
0.7196931, -1.303152, 3.322007, 1, 1, 1, 1, 1,
0.7215251, 0.6573932, -0.9687775, 1, 1, 1, 1, 1,
0.729856, -1.510846, 3.397341, 1, 1, 1, 1, 1,
0.7336562, -0.8463724, 1.439167, 1, 1, 1, 1, 1,
0.7374038, 0.8754762, 0.8998712, 1, 1, 1, 1, 1,
0.7377592, -1.709699, 3.051296, 1, 1, 1, 1, 1,
0.7390581, 0.4728406, -0.5204962, 0, 0, 1, 1, 1,
0.7401806, 0.8165941, 1.572966, 1, 0, 0, 1, 1,
0.7436116, 1.406695, 1.396698, 1, 0, 0, 1, 1,
0.7536997, 1.0544, 0.9304882, 1, 0, 0, 1, 1,
0.7559377, -0.8312065, 1.119994, 1, 0, 0, 1, 1,
0.7570134, 0.8663975, 2.49377, 1, 0, 0, 1, 1,
0.757027, 0.1343972, 0.9964142, 0, 0, 0, 1, 1,
0.7572218, -0.1400637, 2.520008, 0, 0, 0, 1, 1,
0.7673832, -0.3395486, 3.396815, 0, 0, 0, 1, 1,
0.7675584, -1.2592, 3.148798, 0, 0, 0, 1, 1,
0.7675614, -0.6268108, 3.245708, 0, 0, 0, 1, 1,
0.7820294, -1.033834, 3.422034, 0, 0, 0, 1, 1,
0.7829663, 0.438415, 0.5751265, 0, 0, 0, 1, 1,
0.7862931, -1.191655, 0.6138736, 1, 1, 1, 1, 1,
0.7973217, 1.850825, -1.138266, 1, 1, 1, 1, 1,
0.7995924, 0.6175265, 0.8175443, 1, 1, 1, 1, 1,
0.8016145, -0.211191, 3.170935, 1, 1, 1, 1, 1,
0.8018974, -0.07912615, -0.6659994, 1, 1, 1, 1, 1,
0.8043818, -0.3704908, 1.551944, 1, 1, 1, 1, 1,
0.8053252, -0.3524927, 1.498931, 1, 1, 1, 1, 1,
0.8074861, 0.2519136, 2.636752, 1, 1, 1, 1, 1,
0.8091679, 0.1046309, 1.051146, 1, 1, 1, 1, 1,
0.8114657, -1.852255, 5.24785, 1, 1, 1, 1, 1,
0.8144757, -0.3617977, 2.728469, 1, 1, 1, 1, 1,
0.8146926, -1.23692, 3.543229, 1, 1, 1, 1, 1,
0.8171556, -1.595342, 3.561766, 1, 1, 1, 1, 1,
0.8182411, 0.388864, 1.789873, 1, 1, 1, 1, 1,
0.8200887, -1.153137, 3.240894, 1, 1, 1, 1, 1,
0.8232454, -0.9006516, 1.21745, 0, 0, 1, 1, 1,
0.8239866, -0.9520493, 2.976266, 1, 0, 0, 1, 1,
0.8242514, -0.0026708, 2.495084, 1, 0, 0, 1, 1,
0.8301718, 0.6553146, 1.27701, 1, 0, 0, 1, 1,
0.8331485, -0.06332798, 2.685443, 1, 0, 0, 1, 1,
0.8333582, 0.0301568, 0.6307088, 1, 0, 0, 1, 1,
0.8430105, -2.209224, 2.520037, 0, 0, 0, 1, 1,
0.8468037, -1.430209, 3.139565, 0, 0, 0, 1, 1,
0.8485582, -1.011207, 2.462479, 0, 0, 0, 1, 1,
0.8493105, 0.6477904, 0.6124087, 0, 0, 0, 1, 1,
0.8537835, -1.101904, 1.98852, 0, 0, 0, 1, 1,
0.8538682, -0.8313081, 2.393347, 0, 0, 0, 1, 1,
0.8550531, -1.082107, 2.433564, 0, 0, 0, 1, 1,
0.8564036, 0.4579282, 0.3836326, 1, 1, 1, 1, 1,
0.8624046, 2.148279, 0.7917995, 1, 1, 1, 1, 1,
0.8667464, -1.744218, 3.91707, 1, 1, 1, 1, 1,
0.8696344, -0.1822852, 2.34478, 1, 1, 1, 1, 1,
0.8750374, -2.308026, 2.473394, 1, 1, 1, 1, 1,
0.8777705, 0.7766551, 3.129622, 1, 1, 1, 1, 1,
0.8797782, -0.4509687, 2.27934, 1, 1, 1, 1, 1,
0.8801708, 0.5969421, 1.27811, 1, 1, 1, 1, 1,
0.8879578, 0.4902432, 1.97468, 1, 1, 1, 1, 1,
0.8913218, -0.880064, 1.96231, 1, 1, 1, 1, 1,
0.8974413, 0.7562302, -0.6749752, 1, 1, 1, 1, 1,
0.9000496, 0.2946817, 2.114494, 1, 1, 1, 1, 1,
0.9021289, -0.9473727, 1.566469, 1, 1, 1, 1, 1,
0.9051606, 0.4396625, 1.27488, 1, 1, 1, 1, 1,
0.9055885, -0.3079956, 2.073124, 1, 1, 1, 1, 1,
0.9056149, 0.5006005, -0.1242908, 0, 0, 1, 1, 1,
0.9186624, -0.308075, 2.766517, 1, 0, 0, 1, 1,
0.9195535, 0.9866621, 0.5215694, 1, 0, 0, 1, 1,
0.9246392, 0.5731905, 0.7041349, 1, 0, 0, 1, 1,
0.9265326, 0.897397, -0.395748, 1, 0, 0, 1, 1,
0.9270324, -0.9197952, 4.112885, 1, 0, 0, 1, 1,
0.9275023, -0.852519, 0.8885068, 0, 0, 0, 1, 1,
0.937655, -0.07419621, 1.459369, 0, 0, 0, 1, 1,
0.9516589, -0.2374306, 0.7796865, 0, 0, 0, 1, 1,
0.9568575, -1.078352, 1.887539, 0, 0, 0, 1, 1,
0.9646541, 0.4738201, -0.7107729, 0, 0, 0, 1, 1,
0.9702029, -0.3394273, 1.293314, 0, 0, 0, 1, 1,
0.9705204, 0.1986279, 2.682695, 0, 0, 0, 1, 1,
0.9755914, 1.822586, 1.131021, 1, 1, 1, 1, 1,
0.9830058, -0.01151343, 1.167768, 1, 1, 1, 1, 1,
0.9908453, -0.1900933, 0.3682469, 1, 1, 1, 1, 1,
0.9940465, 0.2653218, -0.1419619, 1, 1, 1, 1, 1,
1.009831, -0.9114925, 2.026982, 1, 1, 1, 1, 1,
1.012654, 0.7999722, 1.742333, 1, 1, 1, 1, 1,
1.01276, 1.60896, -0.1061754, 1, 1, 1, 1, 1,
1.019711, 0.4985168, 0.9891291, 1, 1, 1, 1, 1,
1.022146, -0.9420471, 3.12434, 1, 1, 1, 1, 1,
1.024527, -0.6596316, 3.470788, 1, 1, 1, 1, 1,
1.025719, -0.55871, 2.695524, 1, 1, 1, 1, 1,
1.029498, 0.6202119, 1.32374, 1, 1, 1, 1, 1,
1.036979, 1.230383, -0.3933998, 1, 1, 1, 1, 1,
1.037253, -1.49152, 2.819664, 1, 1, 1, 1, 1,
1.044032, 0.6024875, 1.648291, 1, 1, 1, 1, 1,
1.046404, 0.1399644, 2.453787, 0, 0, 1, 1, 1,
1.053364, -1.537789, 1.634057, 1, 0, 0, 1, 1,
1.055097, 0.2877254, 0.5314763, 1, 0, 0, 1, 1,
1.061275, -1.552584, 3.698315, 1, 0, 0, 1, 1,
1.062009, 0.3624163, 2.323434, 1, 0, 0, 1, 1,
1.071047, 1.137138, 1.780151, 1, 0, 0, 1, 1,
1.072063, -0.09421781, 3.072767, 0, 0, 0, 1, 1,
1.072118, -0.5181856, 1.813781, 0, 0, 0, 1, 1,
1.077219, -0.9811468, 3.665687, 0, 0, 0, 1, 1,
1.081662, 0.7641882, -0.006355417, 0, 0, 0, 1, 1,
1.084794, -1.528555, 4.080925, 0, 0, 0, 1, 1,
1.094607, 0.71486, 1.327346, 0, 0, 0, 1, 1,
1.100147, 1.387195, 1.213818, 0, 0, 0, 1, 1,
1.102364, 0.3019456, 3.047639, 1, 1, 1, 1, 1,
1.10581, 2.256482, -0.08987956, 1, 1, 1, 1, 1,
1.106048, -0.438737, 1.34607, 1, 1, 1, 1, 1,
1.112931, -1.977144, 3.205446, 1, 1, 1, 1, 1,
1.113275, -1.707182, 3.05683, 1, 1, 1, 1, 1,
1.1227, -0.7605253, 1.167618, 1, 1, 1, 1, 1,
1.124811, -0.8174778, 1.27879, 1, 1, 1, 1, 1,
1.126117, -0.3115557, 3.014781, 1, 1, 1, 1, 1,
1.133779, 0.1456597, 1.064772, 1, 1, 1, 1, 1,
1.147575, 0.8779645, 0.8574241, 1, 1, 1, 1, 1,
1.151122, 1.165945, 1.774607, 1, 1, 1, 1, 1,
1.155415, 0.04177577, 1.720025, 1, 1, 1, 1, 1,
1.159551, 0.3810933, 2.267617, 1, 1, 1, 1, 1,
1.165663, -0.2436701, 3.262519, 1, 1, 1, 1, 1,
1.165892, 0.341607, 0.355906, 1, 1, 1, 1, 1,
1.167305, 0.4692187, 1.733335, 0, 0, 1, 1, 1,
1.168273, 1.547353, 2.338536, 1, 0, 0, 1, 1,
1.168559, 0.7927095, 0.3382894, 1, 0, 0, 1, 1,
1.181307, -0.4809942, 2.297281, 1, 0, 0, 1, 1,
1.18917, -0.7690368, 2.112782, 1, 0, 0, 1, 1,
1.19098, -0.01613532, 1.432903, 1, 0, 0, 1, 1,
1.19784, 1.205036, 0.6011665, 0, 0, 0, 1, 1,
1.202615, 1.091108, 1.456694, 0, 0, 0, 1, 1,
1.20389, 0.1271438, 2.256884, 0, 0, 0, 1, 1,
1.2341, 0.6934345, 1.999908, 0, 0, 0, 1, 1,
1.242494, -1.438428, 3.17906, 0, 0, 0, 1, 1,
1.243125, 0.5950036, 2.144051, 0, 0, 0, 1, 1,
1.257191, -0.7270194, 0.1380407, 0, 0, 0, 1, 1,
1.267141, 0.6025308, 0.3104608, 1, 1, 1, 1, 1,
1.267911, 0.4084889, 0.0847993, 1, 1, 1, 1, 1,
1.279046, -1.386002, 3.737858, 1, 1, 1, 1, 1,
1.282564, 0.2531525, 2.380186, 1, 1, 1, 1, 1,
1.297197, 1.012235, 2.853241, 1, 1, 1, 1, 1,
1.317268, 0.651782, -0.8042491, 1, 1, 1, 1, 1,
1.318763, 0.3362567, 0.9087613, 1, 1, 1, 1, 1,
1.321413, -0.8021905, 1.275133, 1, 1, 1, 1, 1,
1.330974, -0.4529324, 0.08136348, 1, 1, 1, 1, 1,
1.331942, -0.2868799, 2.41158, 1, 1, 1, 1, 1,
1.3584, -0.601734, 4.166396, 1, 1, 1, 1, 1,
1.362922, 0.3670511, 2.920991, 1, 1, 1, 1, 1,
1.367946, -2.164986, 2.0223, 1, 1, 1, 1, 1,
1.385582, -0.8029562, 3.716621, 1, 1, 1, 1, 1,
1.386165, -0.1796773, 0.2318245, 1, 1, 1, 1, 1,
1.389682, -0.4048669, 1.301536, 0, 0, 1, 1, 1,
1.393373, -1.265569, 3.346308, 1, 0, 0, 1, 1,
1.399074, 0.6325884, 1.653746, 1, 0, 0, 1, 1,
1.403666, 0.579986, 1.019343, 1, 0, 0, 1, 1,
1.412673, 0.4840234, 1.214362, 1, 0, 0, 1, 1,
1.418879, -1.447668, 0.5059126, 1, 0, 0, 1, 1,
1.424034, -0.5041631, 1.429043, 0, 0, 0, 1, 1,
1.430203, 0.7442481, -1.63877, 0, 0, 0, 1, 1,
1.433645, -2.314428, 2.065353, 0, 0, 0, 1, 1,
1.435129, 0.2634943, 1.130562, 0, 0, 0, 1, 1,
1.43755, 0.8153802, 2.25199, 0, 0, 0, 1, 1,
1.449198, -0.1390958, 0.1822916, 0, 0, 0, 1, 1,
1.450832, -0.02097816, 2.256562, 0, 0, 0, 1, 1,
1.451856, -1.558535, 3.280659, 1, 1, 1, 1, 1,
1.464932, -0.9642597, 1.538617, 1, 1, 1, 1, 1,
1.468066, -1.24183, 1.855664, 1, 1, 1, 1, 1,
1.468247, 0.7434348, 0.9482244, 1, 1, 1, 1, 1,
1.477275, 1.218276, 2.363141, 1, 1, 1, 1, 1,
1.481073, -0.4044989, 1.260731, 1, 1, 1, 1, 1,
1.491853, -1.606278, 2.645086, 1, 1, 1, 1, 1,
1.521951, 1.966313, 1.917392, 1, 1, 1, 1, 1,
1.523034, 1.084038, 1.060685, 1, 1, 1, 1, 1,
1.529885, -1.110759, 1.853099, 1, 1, 1, 1, 1,
1.540571, 0.001817163, -0.6505116, 1, 1, 1, 1, 1,
1.543932, -0.5629724, 2.646795, 1, 1, 1, 1, 1,
1.589804, 1.227293, 2.618326, 1, 1, 1, 1, 1,
1.591812, -0.9013401, 1.437332, 1, 1, 1, 1, 1,
1.594828, 0.8115271, 2.787999, 1, 1, 1, 1, 1,
1.595403, -0.3497533, -0.3391951, 0, 0, 1, 1, 1,
1.59751, -0.09584911, 2.117032, 1, 0, 0, 1, 1,
1.60697, -0.3269315, 1.135716, 1, 0, 0, 1, 1,
1.611866, 1.646046, 0.5167635, 1, 0, 0, 1, 1,
1.612504, -0.5819001, 0.1464197, 1, 0, 0, 1, 1,
1.627607, 1.922221, 0.9054747, 1, 0, 0, 1, 1,
1.631989, -0.9849808, 1.607825, 0, 0, 0, 1, 1,
1.634275, 0.4319799, 1.607649, 0, 0, 0, 1, 1,
1.64545, 2.685354, -0.3245085, 0, 0, 0, 1, 1,
1.654368, -1.367101, 3.392225, 0, 0, 0, 1, 1,
1.666026, -0.6841557, 2.623977, 0, 0, 0, 1, 1,
1.667382, 1.366145, 0.8237395, 0, 0, 0, 1, 1,
1.678886, -0.5183325, 2.87205, 0, 0, 0, 1, 1,
1.681503, -0.538156, 4.908137, 1, 1, 1, 1, 1,
1.681853, 0.538845, 1.710228, 1, 1, 1, 1, 1,
1.684605, -0.2207448, 1.777734, 1, 1, 1, 1, 1,
1.685509, -1.984151, 2.073881, 1, 1, 1, 1, 1,
1.714759, 1.490317, -0.3243472, 1, 1, 1, 1, 1,
1.717047, 0.3590854, 1.240143, 1, 1, 1, 1, 1,
1.718432, -0.6981599, 2.403206, 1, 1, 1, 1, 1,
1.736496, 1.226359, 0.8953785, 1, 1, 1, 1, 1,
1.737898, -0.1433387, 2.593082, 1, 1, 1, 1, 1,
1.754856, 0.6516654, 1.055073, 1, 1, 1, 1, 1,
1.756562, -1.914469, 3.486897, 1, 1, 1, 1, 1,
1.770403, 0.8018267, 0.4784373, 1, 1, 1, 1, 1,
1.77404, -0.9942329, 2.754652, 1, 1, 1, 1, 1,
1.785912, -0.8529663, 2.749454, 1, 1, 1, 1, 1,
1.797976, 0.509793, 0.2416811, 1, 1, 1, 1, 1,
1.799224, -0.5221377, 2.305034, 0, 0, 1, 1, 1,
1.804318, 1.348513, 1.197886, 1, 0, 0, 1, 1,
1.815193, -0.361517, 1.729921, 1, 0, 0, 1, 1,
1.822571, -1.070085, 1.028506, 1, 0, 0, 1, 1,
1.834483, 0.7376344, 0.6919649, 1, 0, 0, 1, 1,
1.836307, -1.218257, 1.228095, 1, 0, 0, 1, 1,
1.840266, 1.383162, 0.3870433, 0, 0, 0, 1, 1,
1.859168, 0.670462, 2.228397, 0, 0, 0, 1, 1,
1.893526, 0.1677045, 1.59042, 0, 0, 0, 1, 1,
1.923362, 0.524438, -1.185881, 0, 0, 0, 1, 1,
1.924011, 0.2845882, 1.364574, 0, 0, 0, 1, 1,
1.92407, -1.136261, 2.916128, 0, 0, 0, 1, 1,
1.932085, 0.1779582, 0.570239, 0, 0, 0, 1, 1,
1.957721, 2.427383, 2.36452, 1, 1, 1, 1, 1,
1.971273, -1.293728, 1.015111, 1, 1, 1, 1, 1,
2.021366, -1.250235, 1.655729, 1, 1, 1, 1, 1,
2.021828, 0.3791681, 1.705141, 1, 1, 1, 1, 1,
2.025227, 1.134027, 2.247788, 1, 1, 1, 1, 1,
2.028476, 0.8816252, -0.6371592, 1, 1, 1, 1, 1,
2.029768, 0.341828, 1.379938, 1, 1, 1, 1, 1,
2.03792, -1.394819, 1.444386, 1, 1, 1, 1, 1,
2.048909, 0.1663165, 0.2248064, 1, 1, 1, 1, 1,
2.061859, 0.2809539, 2.114128, 1, 1, 1, 1, 1,
2.077791, 1.583889, -0.3558539, 1, 1, 1, 1, 1,
2.093108, -0.1209369, 0.9434745, 1, 1, 1, 1, 1,
2.106804, -0.03648813, 2.768536, 1, 1, 1, 1, 1,
2.143574, 0.5040571, 1.56228, 1, 1, 1, 1, 1,
2.177711, 0.1089077, 3.3587, 1, 1, 1, 1, 1,
2.19958, 0.4450004, 1.116822, 0, 0, 1, 1, 1,
2.204533, 0.5511769, 0.1184656, 1, 0, 0, 1, 1,
2.215134, 1.220888, 1.158707, 1, 0, 0, 1, 1,
2.216113, 0.9209019, 1.706157, 1, 0, 0, 1, 1,
2.221035, -1.323671, 1.544529, 1, 0, 0, 1, 1,
2.226043, 0.3416386, 2.354942, 1, 0, 0, 1, 1,
2.273132, 1.007132, 1.89309, 0, 0, 0, 1, 1,
2.297129, -1.021606, 1.538039, 0, 0, 0, 1, 1,
2.306559, -0.3376002, 3.121923, 0, 0, 0, 1, 1,
2.420848, 0.1467047, 2.268807, 0, 0, 0, 1, 1,
2.440202, -0.7345546, 1.991136, 0, 0, 0, 1, 1,
2.464417, -0.4328446, -0.5142239, 0, 0, 0, 1, 1,
2.469743, -0.4176591, 1.190826, 0, 0, 0, 1, 1,
2.509083, -0.3787198, 1.728313, 1, 1, 1, 1, 1,
2.614666, -1.702934, 2.418548, 1, 1, 1, 1, 1,
3.003118, -0.7633522, 1.502063, 1, 1, 1, 1, 1,
3.070904, 1.412295, 0.5384755, 1, 1, 1, 1, 1,
3.096439, -1.313475, 1.181925, 1, 1, 1, 1, 1,
3.129142, 1.468749, 0.898235, 1, 1, 1, 1, 1,
3.72296, -0.8528877, 2.554627, 1, 1, 1, 1, 1
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
var radius = 9.860331;
var distance = 34.634;
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
mvMatrix.translate( -0.254035, -0.4905242, 0.1990108 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.634);
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