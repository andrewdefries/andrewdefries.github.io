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
-3.030139, 0.03545372, -2.641488, 1, 0, 0, 1,
-3.020055, 0.3993159, -3.177444, 1, 0.007843138, 0, 1,
-2.861154, 0.3968073, -0.7383881, 1, 0.01176471, 0, 1,
-2.823897, 2.594658, -0.07048956, 1, 0.01960784, 0, 1,
-2.664012, 1.365849, -0.5031067, 1, 0.02352941, 0, 1,
-2.582053, -0.5750616, -1.409088, 1, 0.03137255, 0, 1,
-2.536093, 0.9265215, -1.268471, 1, 0.03529412, 0, 1,
-2.527885, 0.6107596, -1.360263, 1, 0.04313726, 0, 1,
-2.446127, 0.2840871, -2.210731, 1, 0.04705882, 0, 1,
-2.431137, -0.2268805, -2.929366, 1, 0.05490196, 0, 1,
-2.372968, 0.5621988, -1.506388, 1, 0.05882353, 0, 1,
-2.346374, 0.492555, -2.047957, 1, 0.06666667, 0, 1,
-2.334002, -1.008228, -1.12039, 1, 0.07058824, 0, 1,
-2.31972, 0.3575388, -2.91564, 1, 0.07843138, 0, 1,
-2.290947, 1.170015, -1.67833, 1, 0.08235294, 0, 1,
-2.245165, -1.82475, -2.80035, 1, 0.09019608, 0, 1,
-2.229366, 0.1569113, -1.536318, 1, 0.09411765, 0, 1,
-2.192559, -0.357761, -0.4966891, 1, 0.1019608, 0, 1,
-2.17644, -1.139581, -1.611283, 1, 0.1098039, 0, 1,
-2.164621, -0.3148526, -3.012553, 1, 0.1137255, 0, 1,
-2.146135, -1.221666, -1.81054, 1, 0.1215686, 0, 1,
-2.094599, -0.7157421, -3.018183, 1, 0.1254902, 0, 1,
-2.08918, -0.1221152, -0.9873144, 1, 0.1333333, 0, 1,
-2.067895, 1.532615, -1.044033, 1, 0.1372549, 0, 1,
-2.04295, 0.4133798, -0.5941984, 1, 0.145098, 0, 1,
-2.039699, -0.04923261, -3.282995, 1, 0.1490196, 0, 1,
-2.024641, 0.8312861, -2.0891, 1, 0.1568628, 0, 1,
-2.023869, 1.109252, -0.9070647, 1, 0.1607843, 0, 1,
-1.997618, -0.2187021, -1.745176, 1, 0.1686275, 0, 1,
-1.987843, -0.1436357, -3.018594, 1, 0.172549, 0, 1,
-1.912189, 0.233848, -1.511129, 1, 0.1803922, 0, 1,
-1.910855, -2.240215, -3.371848, 1, 0.1843137, 0, 1,
-1.910742, 0.6810368, -0.8268514, 1, 0.1921569, 0, 1,
-1.847457, 2.115309, 0.1460442, 1, 0.1960784, 0, 1,
-1.842035, -1.310434, -1.870276, 1, 0.2039216, 0, 1,
-1.824294, -0.7328638, -2.510087, 1, 0.2117647, 0, 1,
-1.817889, 0.1559817, -0.9440143, 1, 0.2156863, 0, 1,
-1.802342, -1.155393, -1.975364, 1, 0.2235294, 0, 1,
-1.78016, 0.8211967, -1.843825, 1, 0.227451, 0, 1,
-1.765581, -0.2434024, -3.289589, 1, 0.2352941, 0, 1,
-1.761295, 0.4925427, -4.131003, 1, 0.2392157, 0, 1,
-1.757666, -0.4650582, -2.477628, 1, 0.2470588, 0, 1,
-1.73243, -0.8305364, -0.3859378, 1, 0.2509804, 0, 1,
-1.723057, -1.575677, -2.126742, 1, 0.2588235, 0, 1,
-1.722556, 0.733296, -1.65897, 1, 0.2627451, 0, 1,
-1.721055, -1.416706, -1.616458, 1, 0.2705882, 0, 1,
-1.711116, 0.6017176, -1.962809, 1, 0.2745098, 0, 1,
-1.709428, 0.7881895, -0.6707681, 1, 0.282353, 0, 1,
-1.700219, 0.5142505, -1.210716, 1, 0.2862745, 0, 1,
-1.698197, 0.5106757, -0.02157011, 1, 0.2941177, 0, 1,
-1.691018, 0.3198574, -1.698545, 1, 0.3019608, 0, 1,
-1.690148, 0.09579034, -0.2738046, 1, 0.3058824, 0, 1,
-1.682842, -0.04804519, -0.01524936, 1, 0.3137255, 0, 1,
-1.680616, -0.8835226, -1.243464, 1, 0.3176471, 0, 1,
-1.673477, 0.5820458, -2.592176, 1, 0.3254902, 0, 1,
-1.64742, 2.310966, -1.528245, 1, 0.3294118, 0, 1,
-1.643533, -1.06996, -0.8230703, 1, 0.3372549, 0, 1,
-1.633216, 0.9462873, -2.192806, 1, 0.3411765, 0, 1,
-1.633075, 0.9313285, 0.1170148, 1, 0.3490196, 0, 1,
-1.631385, 0.6750998, -1.324683, 1, 0.3529412, 0, 1,
-1.628833, 0.03015103, -2.262078, 1, 0.3607843, 0, 1,
-1.62534, -0.5498118, -1.269322, 1, 0.3647059, 0, 1,
-1.612226, -0.4352787, -0.1293644, 1, 0.372549, 0, 1,
-1.596606, 0.7922568, -0.7171011, 1, 0.3764706, 0, 1,
-1.595738, 0.2908879, -1.857526, 1, 0.3843137, 0, 1,
-1.592013, 2.905444, -0.6950644, 1, 0.3882353, 0, 1,
-1.591643, 0.02130699, -1.406605, 1, 0.3960784, 0, 1,
-1.573483, -0.1491875, -1.327252, 1, 0.4039216, 0, 1,
-1.571142, -0.81146, -1.932167, 1, 0.4078431, 0, 1,
-1.567585, 0.4212184, 0.6245015, 1, 0.4156863, 0, 1,
-1.562198, -1.237993, -3.707674, 1, 0.4196078, 0, 1,
-1.557754, 0.36305, -1.673954, 1, 0.427451, 0, 1,
-1.546513, -0.2849945, 0.2226101, 1, 0.4313726, 0, 1,
-1.546286, -1.101571, -1.678515, 1, 0.4392157, 0, 1,
-1.543571, -0.05176732, -0.2138653, 1, 0.4431373, 0, 1,
-1.522409, 0.452596, -3.129804, 1, 0.4509804, 0, 1,
-1.519058, -1.146444, -2.120216, 1, 0.454902, 0, 1,
-1.513046, -0.6136661, -3.122081, 1, 0.4627451, 0, 1,
-1.497369, 0.3063078, -1.044273, 1, 0.4666667, 0, 1,
-1.480725, 0.488123, -2.337485, 1, 0.4745098, 0, 1,
-1.471143, 0.8758444, -4.378992, 1, 0.4784314, 0, 1,
-1.459421, -0.000192872, -0.9044635, 1, 0.4862745, 0, 1,
-1.45929, 0.05995044, -2.556981, 1, 0.4901961, 0, 1,
-1.457844, -0.2293912, -3.418479, 1, 0.4980392, 0, 1,
-1.444068, -1.647241, -2.913867, 1, 0.5058824, 0, 1,
-1.443189, -0.8249921, -2.807191, 1, 0.509804, 0, 1,
-1.410033, 1.879872, -0.7505992, 1, 0.5176471, 0, 1,
-1.402579, -0.6480101, -2.087651, 1, 0.5215687, 0, 1,
-1.386849, 0.5875744, -1.513703, 1, 0.5294118, 0, 1,
-1.383379, 1.321797, -0.7168453, 1, 0.5333334, 0, 1,
-1.374949, 1.570694, -1.048259, 1, 0.5411765, 0, 1,
-1.360112, -0.2580045, -4.310683, 1, 0.5450981, 0, 1,
-1.354238, -0.09541953, -1.636033, 1, 0.5529412, 0, 1,
-1.344082, 0.0473199, -2.568069, 1, 0.5568628, 0, 1,
-1.343665, -0.1274138, -2.982234, 1, 0.5647059, 0, 1,
-1.336198, -0.5779528, -3.828992, 1, 0.5686275, 0, 1,
-1.334299, 0.8030009, -1.623751, 1, 0.5764706, 0, 1,
-1.331058, -0.2108812, -1.147589, 1, 0.5803922, 0, 1,
-1.330235, 2.218407, -2.161431, 1, 0.5882353, 0, 1,
-1.32702, 0.7332218, -3.092736, 1, 0.5921569, 0, 1,
-1.319012, 0.03535631, -3.260584, 1, 0.6, 0, 1,
-1.318652, 1.015886, -1.44479, 1, 0.6078432, 0, 1,
-1.315419, -0.6199793, -1.791721, 1, 0.6117647, 0, 1,
-1.312974, -1.160875, -0.5533642, 1, 0.6196079, 0, 1,
-1.30291, -0.3119801, -1.423686, 1, 0.6235294, 0, 1,
-1.300863, -1.588897, -4.148884, 1, 0.6313726, 0, 1,
-1.299775, 0.0474124, -2.150542, 1, 0.6352941, 0, 1,
-1.296603, 0.5664184, -3.361285, 1, 0.6431373, 0, 1,
-1.269883, 0.8948749, -1.57876, 1, 0.6470588, 0, 1,
-1.269114, 0.1440593, -1.521665, 1, 0.654902, 0, 1,
-1.265508, 1.12119, -1.987022, 1, 0.6588235, 0, 1,
-1.262336, 0.3585775, -2.488298, 1, 0.6666667, 0, 1,
-1.251206, 0.1137612, -0.6587175, 1, 0.6705883, 0, 1,
-1.250395, 0.01688896, -2.691263, 1, 0.6784314, 0, 1,
-1.245872, 0.1594644, -0.4513626, 1, 0.682353, 0, 1,
-1.243193, 0.02412831, -1.896952, 1, 0.6901961, 0, 1,
-1.24286, 0.3053868, -2.813594, 1, 0.6941177, 0, 1,
-1.241454, -0.2152762, -0.4582479, 1, 0.7019608, 0, 1,
-1.236864, -0.8690283, -1.845426, 1, 0.7098039, 0, 1,
-1.22567, -0.07036285, -1.656167, 1, 0.7137255, 0, 1,
-1.211818, 0.6218088, -1.100869, 1, 0.7215686, 0, 1,
-1.202469, 0.2520525, -0.3852754, 1, 0.7254902, 0, 1,
-1.200524, -1.931979, -1.058849, 1, 0.7333333, 0, 1,
-1.196648, -0.6053864, -0.3133406, 1, 0.7372549, 0, 1,
-1.193371, 0.135867, -2.056463, 1, 0.7450981, 0, 1,
-1.19194, -0.05138709, -0.805031, 1, 0.7490196, 0, 1,
-1.190354, -0.3302781, -3.723571, 1, 0.7568628, 0, 1,
-1.189927, 0.2927645, -2.276313, 1, 0.7607843, 0, 1,
-1.188835, -0.5043761, -1.728473, 1, 0.7686275, 0, 1,
-1.18776, 0.7002464, -0.4382681, 1, 0.772549, 0, 1,
-1.185319, 0.8629618, -1.244488, 1, 0.7803922, 0, 1,
-1.184055, -1.123169, -2.906978, 1, 0.7843137, 0, 1,
-1.182606, -0.5081173, -1.06943, 1, 0.7921569, 0, 1,
-1.171921, -0.4327657, -2.46327, 1, 0.7960784, 0, 1,
-1.164479, -0.006564682, -1.583807, 1, 0.8039216, 0, 1,
-1.158983, 0.600862, -1.551887, 1, 0.8117647, 0, 1,
-1.157949, 0.3698797, -2.256622, 1, 0.8156863, 0, 1,
-1.147925, -1.103746, -2.634343, 1, 0.8235294, 0, 1,
-1.147305, -0.7543826, -2.022497, 1, 0.827451, 0, 1,
-1.139637, 0.7738997, -2.553265, 1, 0.8352941, 0, 1,
-1.136548, 0.4103036, -0.3088751, 1, 0.8392157, 0, 1,
-1.131952, -0.8229676, -0.9878253, 1, 0.8470588, 0, 1,
-1.127537, -0.8839919, -3.699896, 1, 0.8509804, 0, 1,
-1.121751, 0.2511995, -0.567087, 1, 0.8588235, 0, 1,
-1.106182, -0.3835133, -2.858472, 1, 0.8627451, 0, 1,
-1.103505, 0.4031119, -2.525574, 1, 0.8705882, 0, 1,
-1.093341, -1.500367, -1.611912, 1, 0.8745098, 0, 1,
-1.092765, -1.092951, -3.850486, 1, 0.8823529, 0, 1,
-1.089703, 1.213775, -0.5239713, 1, 0.8862745, 0, 1,
-1.08714, -0.74658, -2.15011, 1, 0.8941177, 0, 1,
-1.085009, -0.4045824, -2.377277, 1, 0.8980392, 0, 1,
-1.082152, 0.5756185, -2.540252, 1, 0.9058824, 0, 1,
-1.079054, -1.638676, -4.525936, 1, 0.9137255, 0, 1,
-1.077849, -1.721776, -2.540828, 1, 0.9176471, 0, 1,
-1.076038, -0.2182484, -1.970256, 1, 0.9254902, 0, 1,
-1.072643, 1.216512, -1.600968, 1, 0.9294118, 0, 1,
-1.061417, -1.811224, -4.044702, 1, 0.9372549, 0, 1,
-1.059856, 1.756763, 1.396424, 1, 0.9411765, 0, 1,
-1.059366, -1.108229, -2.187546, 1, 0.9490196, 0, 1,
-1.050977, -0.7840718, -1.603509, 1, 0.9529412, 0, 1,
-1.048757, 0.2417008, -2.298673, 1, 0.9607843, 0, 1,
-1.0475, -0.6115472, -2.081449, 1, 0.9647059, 0, 1,
-1.045049, -0.0827816, -0.7566278, 1, 0.972549, 0, 1,
-1.037583, -0.6603274, -1.10173, 1, 0.9764706, 0, 1,
-1.035861, 1.749586, -1.915797, 1, 0.9843137, 0, 1,
-1.035164, 0.2338578, -0.9011185, 1, 0.9882353, 0, 1,
-1.034078, 0.4340167, -1.752062, 1, 0.9960784, 0, 1,
-1.03323, -0.5829582, -2.694754, 0.9960784, 1, 0, 1,
-1.031707, -1.299432, -3.42855, 0.9921569, 1, 0, 1,
-1.03162, 1.299163, -0.8782302, 0.9843137, 1, 0, 1,
-1.031282, -2.176447, -3.921236, 0.9803922, 1, 0, 1,
-1.024378, -0.6615205, -2.610738, 0.972549, 1, 0, 1,
-1.023921, -0.1855617, -0.8466146, 0.9686275, 1, 0, 1,
-1.020661, 0.6403418, -1.77587, 0.9607843, 1, 0, 1,
-1.019181, 2.588195, -0.3890811, 0.9568627, 1, 0, 1,
-1.018127, -0.7317596, -0.8844881, 0.9490196, 1, 0, 1,
-1.012203, -1.452382, -1.520124, 0.945098, 1, 0, 1,
-1.005971, 0.1501356, -2.152447, 0.9372549, 1, 0, 1,
-1.002653, 1.754725, 0.2543042, 0.9333333, 1, 0, 1,
-0.9989623, 0.2020198, -2.014846, 0.9254902, 1, 0, 1,
-0.98702, 0.8834387, -0.5622932, 0.9215686, 1, 0, 1,
-0.9752611, 0.869276, -0.9793583, 0.9137255, 1, 0, 1,
-0.9695253, 1.021598, -1.237151, 0.9098039, 1, 0, 1,
-0.9574167, 1.16005, -1.991037, 0.9019608, 1, 0, 1,
-0.9513706, 1.157594, -2.661674, 0.8941177, 1, 0, 1,
-0.9499801, 0.09346439, -0.8297427, 0.8901961, 1, 0, 1,
-0.9496035, 0.2993874, -2.845302, 0.8823529, 1, 0, 1,
-0.9441769, 0.2631902, -1.499169, 0.8784314, 1, 0, 1,
-0.9418367, 1.4292, -0.819083, 0.8705882, 1, 0, 1,
-0.9411141, -0.1000544, -2.250395, 0.8666667, 1, 0, 1,
-0.9382723, 0.05308878, -0.9879355, 0.8588235, 1, 0, 1,
-0.936988, 1.116004, -0.8776649, 0.854902, 1, 0, 1,
-0.9347374, 0.5198578, -1.598597, 0.8470588, 1, 0, 1,
-0.9345492, 1.05979, -1.419354, 0.8431373, 1, 0, 1,
-0.932489, 1.519874, -0.7078317, 0.8352941, 1, 0, 1,
-0.9289227, 0.3667971, -1.583029, 0.8313726, 1, 0, 1,
-0.9239479, -0.1296944, -0.6224357, 0.8235294, 1, 0, 1,
-0.9230016, 0.3811571, -2.610707, 0.8196079, 1, 0, 1,
-0.922771, -0.03075299, -0.5854408, 0.8117647, 1, 0, 1,
-0.9160131, -0.9332749, -2.031805, 0.8078431, 1, 0, 1,
-0.9071091, -1.00318, -1.950187, 0.8, 1, 0, 1,
-0.9060568, 0.344763, -1.790088, 0.7921569, 1, 0, 1,
-0.9058518, -1.546071, -0.2809508, 0.7882353, 1, 0, 1,
-0.9028774, 0.7171569, -0.4553427, 0.7803922, 1, 0, 1,
-0.9023153, -0.6626214, -1.255661, 0.7764706, 1, 0, 1,
-0.9006458, 0.4945584, -1.133301, 0.7686275, 1, 0, 1,
-0.8997331, -1.209787, -1.834242, 0.7647059, 1, 0, 1,
-0.892453, -0.04544555, -1.007477, 0.7568628, 1, 0, 1,
-0.8861035, -0.7378178, -1.545846, 0.7529412, 1, 0, 1,
-0.8859911, 1.947059, -0.2836328, 0.7450981, 1, 0, 1,
-0.8816953, -0.1715637, -2.249029, 0.7411765, 1, 0, 1,
-0.8811554, 0.4120267, -1.108306, 0.7333333, 1, 0, 1,
-0.8780314, -0.2350785, -2.443249, 0.7294118, 1, 0, 1,
-0.8777826, 0.06464804, -1.322105, 0.7215686, 1, 0, 1,
-0.8658679, -0.9058426, -0.7888344, 0.7176471, 1, 0, 1,
-0.8650222, -0.9758359, -2.637293, 0.7098039, 1, 0, 1,
-0.8570445, 0.110592, -0.2816767, 0.7058824, 1, 0, 1,
-0.8550618, 0.4255471, 0.8072067, 0.6980392, 1, 0, 1,
-0.8531569, 0.3399219, -0.9175733, 0.6901961, 1, 0, 1,
-0.8510433, 0.3210377, -0.4737442, 0.6862745, 1, 0, 1,
-0.8412335, -1.969572, -4.481702, 0.6784314, 1, 0, 1,
-0.8394961, -0.197947, -1.743764, 0.6745098, 1, 0, 1,
-0.831048, -0.9190003, -3.773647, 0.6666667, 1, 0, 1,
-0.8306358, -0.8599132, -2.050643, 0.6627451, 1, 0, 1,
-0.8306245, 0.1688665, -1.043753, 0.654902, 1, 0, 1,
-0.8301899, -0.4308016, -3.304583, 0.6509804, 1, 0, 1,
-0.8296986, 0.08241871, -1.070127, 0.6431373, 1, 0, 1,
-0.8288609, 0.7251961, -1.675271, 0.6392157, 1, 0, 1,
-0.8236263, -0.05172563, -0.6189016, 0.6313726, 1, 0, 1,
-0.8193291, 1.958279, -3.22981, 0.627451, 1, 0, 1,
-0.8184505, 1.804531, 0.4716165, 0.6196079, 1, 0, 1,
-0.816895, 0.7905329, -1.231909, 0.6156863, 1, 0, 1,
-0.8166724, 0.8408389, -0.08791362, 0.6078432, 1, 0, 1,
-0.8165178, 1.368977, -0.01772798, 0.6039216, 1, 0, 1,
-0.8138335, -1.466025, -2.349329, 0.5960785, 1, 0, 1,
-0.803295, 0.3712126, -1.57896, 0.5882353, 1, 0, 1,
-0.8013711, -0.1217851, -2.756096, 0.5843138, 1, 0, 1,
-0.799786, -0.04237923, -1.85619, 0.5764706, 1, 0, 1,
-0.7996194, -0.8599029, -1.098589, 0.572549, 1, 0, 1,
-0.799088, -0.2145652, -0.4451985, 0.5647059, 1, 0, 1,
-0.7978992, 0.4970305, -0.5875895, 0.5607843, 1, 0, 1,
-0.7965717, -0.7178675, -1.239613, 0.5529412, 1, 0, 1,
-0.795792, 1.411611, -1.260999, 0.5490196, 1, 0, 1,
-0.7909571, -1.521772, -4.17683, 0.5411765, 1, 0, 1,
-0.7744956, -0.4941725, -0.3565215, 0.5372549, 1, 0, 1,
-0.7715339, -0.6270553, -2.637598, 0.5294118, 1, 0, 1,
-0.7713616, -1.276849, -2.700469, 0.5254902, 1, 0, 1,
-0.7673793, 0.1165996, -3.011422, 0.5176471, 1, 0, 1,
-0.767179, 0.6214488, -1.125074, 0.5137255, 1, 0, 1,
-0.7620328, -1.594235, -2.943646, 0.5058824, 1, 0, 1,
-0.7547972, -0.5463777, -2.743, 0.5019608, 1, 0, 1,
-0.7546583, 0.7408015, -0.1807349, 0.4941176, 1, 0, 1,
-0.7524332, -1.820166, -2.757059, 0.4862745, 1, 0, 1,
-0.7467135, -0.6549621, -0.8466614, 0.4823529, 1, 0, 1,
-0.7399113, -0.2608387, -2.812459, 0.4745098, 1, 0, 1,
-0.7356198, 0.6502866, -0.2343061, 0.4705882, 1, 0, 1,
-0.7344919, -0.4181178, -2.230287, 0.4627451, 1, 0, 1,
-0.7301369, -0.6886395, -1.76923, 0.4588235, 1, 0, 1,
-0.7297148, -0.2829846, -2.5709, 0.4509804, 1, 0, 1,
-0.7243553, 0.5172893, -1.074273, 0.4470588, 1, 0, 1,
-0.7219639, 0.2688793, -0.9543361, 0.4392157, 1, 0, 1,
-0.717618, -0.4258221, -5.395196, 0.4352941, 1, 0, 1,
-0.7164128, -0.4286902, -0.1710419, 0.427451, 1, 0, 1,
-0.7014158, -2.245324, -1.970145, 0.4235294, 1, 0, 1,
-0.6992571, 0.06248579, -2.950202, 0.4156863, 1, 0, 1,
-0.6983463, 0.9777625, 0.4615181, 0.4117647, 1, 0, 1,
-0.6945611, -0.9668428, -3.485782, 0.4039216, 1, 0, 1,
-0.6916382, -0.3778999, -3.891807, 0.3960784, 1, 0, 1,
-0.6773888, -0.5663341, -1.84284, 0.3921569, 1, 0, 1,
-0.6758683, -0.72434, -3.623605, 0.3843137, 1, 0, 1,
-0.6747506, -0.03767843, 0.3610163, 0.3803922, 1, 0, 1,
-0.6686207, -0.4422805, -3.104163, 0.372549, 1, 0, 1,
-0.6681802, 0.8350065, -2.003223, 0.3686275, 1, 0, 1,
-0.6566094, 1.699841, -1.585577, 0.3607843, 1, 0, 1,
-0.6561657, 0.1691466, -0.7182147, 0.3568628, 1, 0, 1,
-0.6535627, -1.101967, -1.919591, 0.3490196, 1, 0, 1,
-0.6528296, -0.2346193, -2.275203, 0.345098, 1, 0, 1,
-0.6512723, -0.590279, -4.035951, 0.3372549, 1, 0, 1,
-0.6511201, -0.4280391, -1.811069, 0.3333333, 1, 0, 1,
-0.6509631, -0.3009136, -3.548657, 0.3254902, 1, 0, 1,
-0.6501273, -0.6671484, -2.275407, 0.3215686, 1, 0, 1,
-0.6470225, 0.6093062, -1.548505, 0.3137255, 1, 0, 1,
-0.6464472, -1.661983, -2.674687, 0.3098039, 1, 0, 1,
-0.6415, 0.1488411, -0.6495824, 0.3019608, 1, 0, 1,
-0.6404631, -1.140592, -2.478186, 0.2941177, 1, 0, 1,
-0.6369888, -0.9600743, -1.313878, 0.2901961, 1, 0, 1,
-0.630483, -1.774907, -2.010086, 0.282353, 1, 0, 1,
-0.6260042, 1.658325, -1.668259, 0.2784314, 1, 0, 1,
-0.6221044, -1.1077, -4.259781, 0.2705882, 1, 0, 1,
-0.6220051, -0.4779292, -2.635639, 0.2666667, 1, 0, 1,
-0.6203979, 0.2091046, -1.123316, 0.2588235, 1, 0, 1,
-0.6098956, 1.933014, 0.03385546, 0.254902, 1, 0, 1,
-0.6089347, -0.02557648, 0.1713261, 0.2470588, 1, 0, 1,
-0.6073452, -0.5825605, -2.252924, 0.2431373, 1, 0, 1,
-0.6073295, 0.08487535, 0.5587362, 0.2352941, 1, 0, 1,
-0.6007054, 2.449604, -1.554918, 0.2313726, 1, 0, 1,
-0.59625, -0.8827484, -3.317454, 0.2235294, 1, 0, 1,
-0.5919923, -0.341683, -2.602099, 0.2196078, 1, 0, 1,
-0.5915715, -0.6982642, -3.983741, 0.2117647, 1, 0, 1,
-0.587391, -0.3292487, -1.312343, 0.2078431, 1, 0, 1,
-0.5853416, 0.7488768, 0.7342893, 0.2, 1, 0, 1,
-0.5837989, -0.2969747, -1.357878, 0.1921569, 1, 0, 1,
-0.5834992, -0.2587293, -3.353352, 0.1882353, 1, 0, 1,
-0.5778547, 1.141038, -1.917035, 0.1803922, 1, 0, 1,
-0.5738924, 0.09360612, -0.888876, 0.1764706, 1, 0, 1,
-0.5712564, 1.489814, 0.3144165, 0.1686275, 1, 0, 1,
-0.5701396, 1.81957, -2.132666, 0.1647059, 1, 0, 1,
-0.5680332, 1.26462, -0.2140967, 0.1568628, 1, 0, 1,
-0.5667854, 0.1636601, -2.096926, 0.1529412, 1, 0, 1,
-0.5571495, -0.3030334, 0.2900165, 0.145098, 1, 0, 1,
-0.5551335, -0.1189642, -1.584534, 0.1411765, 1, 0, 1,
-0.5535792, -0.04262432, -0.9639595, 0.1333333, 1, 0, 1,
-0.5477546, -0.04499, -2.333972, 0.1294118, 1, 0, 1,
-0.5472685, 0.1291105, -0.9403225, 0.1215686, 1, 0, 1,
-0.5451166, -0.8352032, -2.831918, 0.1176471, 1, 0, 1,
-0.5440719, -0.1080123, -1.641833, 0.1098039, 1, 0, 1,
-0.5361493, 0.3724623, 0.7810651, 0.1058824, 1, 0, 1,
-0.5356953, 1.294161, -1.881448, 0.09803922, 1, 0, 1,
-0.531072, 0.6181881, 0.6739888, 0.09019608, 1, 0, 1,
-0.5290113, -0.8232478, -1.065344, 0.08627451, 1, 0, 1,
-0.5233289, -0.5824668, -2.589187, 0.07843138, 1, 0, 1,
-0.5204782, 0.6939492, 0.7926582, 0.07450981, 1, 0, 1,
-0.5196005, 0.6233578, -0.6405665, 0.06666667, 1, 0, 1,
-0.5179111, 0.1230784, -0.9429022, 0.0627451, 1, 0, 1,
-0.5153997, 0.1886185, -2.287542, 0.05490196, 1, 0, 1,
-0.514069, -0.8308515, -2.000635, 0.05098039, 1, 0, 1,
-0.5114226, -0.5932484, -2.951499, 0.04313726, 1, 0, 1,
-0.511116, -0.8872786, -3.712033, 0.03921569, 1, 0, 1,
-0.5068949, 0.6885512, 0.5492157, 0.03137255, 1, 0, 1,
-0.5048723, -0.1317756, -0.4940138, 0.02745098, 1, 0, 1,
-0.5016531, 0.4656675, -0.1209154, 0.01960784, 1, 0, 1,
-0.4991818, 0.6579043, -0.1368392, 0.01568628, 1, 0, 1,
-0.4942985, -0.3803573, -2.107866, 0.007843138, 1, 0, 1,
-0.4898477, 0.3285162, -0.6951476, 0.003921569, 1, 0, 1,
-0.4796189, -0.3755825, -1.795197, 0, 1, 0.003921569, 1,
-0.4746563, -1.368616, -0.8727484, 0, 1, 0.01176471, 1,
-0.4723843, 0.2829286, 0.1965168, 0, 1, 0.01568628, 1,
-0.4686584, 0.08887246, -0.5907449, 0, 1, 0.02352941, 1,
-0.4669528, 1.971558, -0.5318303, 0, 1, 0.02745098, 1,
-0.4658338, -0.6418328, -1.197263, 0, 1, 0.03529412, 1,
-0.4641297, -1.056615, -1.554277, 0, 1, 0.03921569, 1,
-0.4608124, -0.05055205, -2.49758, 0, 1, 0.04705882, 1,
-0.4574853, 1.081093, 1.320253, 0, 1, 0.05098039, 1,
-0.4557623, -0.1761414, -1.114582, 0, 1, 0.05882353, 1,
-0.4528831, 0.6035666, -0.2358235, 0, 1, 0.0627451, 1,
-0.4507538, 1.308177, -0.3516374, 0, 1, 0.07058824, 1,
-0.4459905, -0.6534771, -1.476342, 0, 1, 0.07450981, 1,
-0.4401026, -1.447974, -2.872014, 0, 1, 0.08235294, 1,
-0.4371725, -0.9332975, -2.251649, 0, 1, 0.08627451, 1,
-0.4349238, -0.9731318, -1.91406, 0, 1, 0.09411765, 1,
-0.4321331, 0.0694889, -1.417179, 0, 1, 0.1019608, 1,
-0.4315265, -0.09053303, -0.5136765, 0, 1, 0.1058824, 1,
-0.4310971, -1.084794, -2.536307, 0, 1, 0.1137255, 1,
-0.4309153, -0.4886429, -3.845749, 0, 1, 0.1176471, 1,
-0.4299702, -0.1469985, -1.66135, 0, 1, 0.1254902, 1,
-0.4291754, 0.159458, -1.109816, 0, 1, 0.1294118, 1,
-0.4270169, -1.625748, -1.800646, 0, 1, 0.1372549, 1,
-0.4250519, 0.9994735, 0.5879002, 0, 1, 0.1411765, 1,
-0.4210598, 0.959864, -0.8374349, 0, 1, 0.1490196, 1,
-0.4204173, 0.5207989, -1.411025, 0, 1, 0.1529412, 1,
-0.41466, 0.4727374, -1.614906, 0, 1, 0.1607843, 1,
-0.4145416, -0.7430555, -3.065189, 0, 1, 0.1647059, 1,
-0.4100273, -0.5373583, -3.107341, 0, 1, 0.172549, 1,
-0.4097681, 0.1475223, 0.2241021, 0, 1, 0.1764706, 1,
-0.4073676, -1.18356, -2.500247, 0, 1, 0.1843137, 1,
-0.4038994, -0.3023582, -2.166785, 0, 1, 0.1882353, 1,
-0.4013308, 2.541257, 0.3441924, 0, 1, 0.1960784, 1,
-0.4012216, -0.2878605, -3.180821, 0, 1, 0.2039216, 1,
-0.3991718, -0.7727951, -3.139942, 0, 1, 0.2078431, 1,
-0.3964938, -1.644354, -3.287732, 0, 1, 0.2156863, 1,
-0.3953971, -0.3508091, -0.6117588, 0, 1, 0.2196078, 1,
-0.3920251, 0.3381293, -0.933427, 0, 1, 0.227451, 1,
-0.3915279, 0.3886026, 0.1278609, 0, 1, 0.2313726, 1,
-0.3874467, 0.8705876, -0.1317817, 0, 1, 0.2392157, 1,
-0.3852386, 0.8637975, 1.011517, 0, 1, 0.2431373, 1,
-0.3820243, -1.043927, -1.317114, 0, 1, 0.2509804, 1,
-0.3805591, -0.1240778, -2.122005, 0, 1, 0.254902, 1,
-0.3797675, -0.04839975, -1.09382, 0, 1, 0.2627451, 1,
-0.3780709, -1.16406, -2.751511, 0, 1, 0.2666667, 1,
-0.3740534, 0.7237062, 1.288873, 0, 1, 0.2745098, 1,
-0.3702365, 0.4102885, -2.553148, 0, 1, 0.2784314, 1,
-0.367596, -0.06757855, -2.529564, 0, 1, 0.2862745, 1,
-0.3660225, -0.05819961, -2.30787, 0, 1, 0.2901961, 1,
-0.3656484, -0.5914134, -4.570724, 0, 1, 0.2980392, 1,
-0.3475343, -0.7964322, -0.9130822, 0, 1, 0.3058824, 1,
-0.3433219, 0.901448, 0.805821, 0, 1, 0.3098039, 1,
-0.3389286, -0.3360034, -2.742134, 0, 1, 0.3176471, 1,
-0.338045, 1.450831, 1.950538, 0, 1, 0.3215686, 1,
-0.3328519, 0.2660319, -2.68008, 0, 1, 0.3294118, 1,
-0.3280149, -0.6631774, -2.297626, 0, 1, 0.3333333, 1,
-0.3205094, 1.814812, 0.6456222, 0, 1, 0.3411765, 1,
-0.3152453, -0.1635098, -3.159355, 0, 1, 0.345098, 1,
-0.313119, 0.8653863, 0.0008432514, 0, 1, 0.3529412, 1,
-0.3117443, 0.2920546, -1.519691, 0, 1, 0.3568628, 1,
-0.2965469, -0.08883545, -2.204321, 0, 1, 0.3647059, 1,
-0.2929267, -0.1065586, -3.421443, 0, 1, 0.3686275, 1,
-0.291839, -0.06765931, -2.052873, 0, 1, 0.3764706, 1,
-0.290826, -1.032187, -3.561682, 0, 1, 0.3803922, 1,
-0.2876524, -1.200391, -3.567661, 0, 1, 0.3882353, 1,
-0.2801912, -1.240621, -3.356888, 0, 1, 0.3921569, 1,
-0.2792562, -0.4657181, -2.588614, 0, 1, 0.4, 1,
-0.2754254, 1.095687, -0.9436568, 0, 1, 0.4078431, 1,
-0.273371, 1.075524, 0.4247063, 0, 1, 0.4117647, 1,
-0.2646686, 0.4424841, 0.3143707, 0, 1, 0.4196078, 1,
-0.2629153, -0.5515215, -3.830328, 0, 1, 0.4235294, 1,
-0.2615999, -1.488099, -1.789678, 0, 1, 0.4313726, 1,
-0.2606797, 0.68719, 0.02229807, 0, 1, 0.4352941, 1,
-0.2583239, 0.1719283, -0.8333843, 0, 1, 0.4431373, 1,
-0.257486, 1.169047, -1.313341, 0, 1, 0.4470588, 1,
-0.2556551, 1.214402, -1.151353, 0, 1, 0.454902, 1,
-0.2476491, 1.722795, -1.007968, 0, 1, 0.4588235, 1,
-0.2473114, -0.2916396, -3.97834, 0, 1, 0.4666667, 1,
-0.2453437, 1.247908, -0.2611726, 0, 1, 0.4705882, 1,
-0.2451774, -0.1388492, -2.896568, 0, 1, 0.4784314, 1,
-0.243881, -0.0627917, -2.258877, 0, 1, 0.4823529, 1,
-0.2432664, -0.3714756, -2.922102, 0, 1, 0.4901961, 1,
-0.238708, -1.02874, -5.130439, 0, 1, 0.4941176, 1,
-0.2383984, 0.4355013, -0.3278574, 0, 1, 0.5019608, 1,
-0.2352581, 0.084108, -1.767406, 0, 1, 0.509804, 1,
-0.2313596, -0.7633073, -2.528486, 0, 1, 0.5137255, 1,
-0.2310597, 1.151251, 1.256061, 0, 1, 0.5215687, 1,
-0.229425, 2.585904, -0.6666532, 0, 1, 0.5254902, 1,
-0.2244767, 1.514244, 1.285296, 0, 1, 0.5333334, 1,
-0.2195998, 0.7016751, -0.3976135, 0, 1, 0.5372549, 1,
-0.215095, -0.2037691, -1.816411, 0, 1, 0.5450981, 1,
-0.2051836, 0.01065571, -0.6706889, 0, 1, 0.5490196, 1,
-0.2039525, 1.499974, 1.712445, 0, 1, 0.5568628, 1,
-0.2036702, 0.6914794, 1.044242, 0, 1, 0.5607843, 1,
-0.203096, -0.1464744, -1.974758, 0, 1, 0.5686275, 1,
-0.2009132, 1.27196, 0.7068818, 0, 1, 0.572549, 1,
-0.198838, 0.8541375, -0.6606785, 0, 1, 0.5803922, 1,
-0.1979583, 1.186554, 0.8728836, 0, 1, 0.5843138, 1,
-0.1942924, -1.377569, -2.642468, 0, 1, 0.5921569, 1,
-0.1933319, -1.265011, -2.752358, 0, 1, 0.5960785, 1,
-0.1930295, -1.320128, -4.558547, 0, 1, 0.6039216, 1,
-0.1900131, -0.2901418, -2.033475, 0, 1, 0.6117647, 1,
-0.1894282, 0.1630143, -0.917986, 0, 1, 0.6156863, 1,
-0.1882404, -1.261242, -2.302704, 0, 1, 0.6235294, 1,
-0.1879429, 0.2164132, -1.486487, 0, 1, 0.627451, 1,
-0.1857298, 0.2631699, -0.7401927, 0, 1, 0.6352941, 1,
-0.1855397, -1.108591, -1.222208, 0, 1, 0.6392157, 1,
-0.1851364, -0.888773, -1.944171, 0, 1, 0.6470588, 1,
-0.1824381, 1.571478, -0.06968744, 0, 1, 0.6509804, 1,
-0.1824189, -1.080913, -3.709618, 0, 1, 0.6588235, 1,
-0.1794122, 0.091308, -0.9247197, 0, 1, 0.6627451, 1,
-0.1792398, 0.04219854, -3.491422, 0, 1, 0.6705883, 1,
-0.1741897, -0.1570021, 0.3921783, 0, 1, 0.6745098, 1,
-0.1668303, 0.5895284, 0.1446545, 0, 1, 0.682353, 1,
-0.1634391, 0.917994, -0.6585839, 0, 1, 0.6862745, 1,
-0.1558583, 1.490825, -2.37981, 0, 1, 0.6941177, 1,
-0.1541379, 0.03099765, 0.3254081, 0, 1, 0.7019608, 1,
-0.1527445, -0.3139252, -3.243504, 0, 1, 0.7058824, 1,
-0.1520313, -0.02914969, -2.208067, 0, 1, 0.7137255, 1,
-0.1498376, 1.460892, 0.4034928, 0, 1, 0.7176471, 1,
-0.1491136, -0.1303016, -3.474764, 0, 1, 0.7254902, 1,
-0.1455505, -0.03434404, -1.191269, 0, 1, 0.7294118, 1,
-0.1439092, -0.8079956, -3.633157, 0, 1, 0.7372549, 1,
-0.1391149, -0.7540284, -3.712379, 0, 1, 0.7411765, 1,
-0.1388488, 0.3155289, 0.5036276, 0, 1, 0.7490196, 1,
-0.1383425, -1.856034, -1.992357, 0, 1, 0.7529412, 1,
-0.1354248, -0.3192762, -3.101963, 0, 1, 0.7607843, 1,
-0.1329961, -0.6459867, -1.946438, 0, 1, 0.7647059, 1,
-0.1255366, 0.6800035, 0.9232516, 0, 1, 0.772549, 1,
-0.1236697, -0.7737283, -1.996963, 0, 1, 0.7764706, 1,
-0.1226956, -1.28511, -1.277941, 0, 1, 0.7843137, 1,
-0.1223035, 0.4517812, 0.5724848, 0, 1, 0.7882353, 1,
-0.1221423, 1.479646, 0.4486754, 0, 1, 0.7960784, 1,
-0.118031, -1.775673, -3.771592, 0, 1, 0.8039216, 1,
-0.1169131, -0.9258182, -1.384369, 0, 1, 0.8078431, 1,
-0.107333, -0.2062926, -3.439542, 0, 1, 0.8156863, 1,
-0.1061931, -0.1363622, -1.155892, 0, 1, 0.8196079, 1,
-0.1017429, -0.6251388, -2.349159, 0, 1, 0.827451, 1,
-0.09644602, -1.094764, -4.579674, 0, 1, 0.8313726, 1,
-0.09499356, -0.53685, -4.771482, 0, 1, 0.8392157, 1,
-0.08861391, 0.5129559, -0.7400869, 0, 1, 0.8431373, 1,
-0.08267108, -0.8481775, -4.09509, 0, 1, 0.8509804, 1,
-0.0808888, -1.760257, -4.291421, 0, 1, 0.854902, 1,
-0.07242891, 0.6906566, 0.4336734, 0, 1, 0.8627451, 1,
-0.07079997, -0.4229005, -1.745475, 0, 1, 0.8666667, 1,
-0.06979868, -0.8435736, -3.409386, 0, 1, 0.8745098, 1,
-0.06825358, -1.380123, -2.565366, 0, 1, 0.8784314, 1,
-0.0663014, -0.8759118, -4.65117, 0, 1, 0.8862745, 1,
-0.0656017, -1.71555, -3.693663, 0, 1, 0.8901961, 1,
-0.0621289, -0.2659836, -2.398366, 0, 1, 0.8980392, 1,
-0.05796944, -0.3922614, -4.543113, 0, 1, 0.9058824, 1,
-0.0546358, -1.103518, -4.259212, 0, 1, 0.9098039, 1,
-0.0545204, 0.166712, 0.6072422, 0, 1, 0.9176471, 1,
-0.05261346, -0.7271445, -4.283745, 0, 1, 0.9215686, 1,
-0.0514172, -0.527433, -1.588118, 0, 1, 0.9294118, 1,
-0.0499676, 0.1353202, -0.5404414, 0, 1, 0.9333333, 1,
-0.04570623, -0.8838463, -3.928127, 0, 1, 0.9411765, 1,
-0.04562165, 0.7332572, -0.5915273, 0, 1, 0.945098, 1,
-0.03914637, -0.895398, -2.991766, 0, 1, 0.9529412, 1,
-0.03821934, -0.551195, -2.446735, 0, 1, 0.9568627, 1,
-0.03532719, -0.3928785, -4.387846, 0, 1, 0.9647059, 1,
-0.02961581, 0.7361398, -1.222022, 0, 1, 0.9686275, 1,
-0.02958875, 0.6529845, 0.09157845, 0, 1, 0.9764706, 1,
-0.02304599, -1.004377, -3.562021, 0, 1, 0.9803922, 1,
-0.01762439, -0.6882798, -2.100941, 0, 1, 0.9882353, 1,
-0.01696411, -1.331133, -3.671322, 0, 1, 0.9921569, 1,
-0.0149585, -0.226354, -3.247205, 0, 1, 1, 1,
-0.01467991, -1.704994, -4.422987, 0, 0.9921569, 1, 1,
-0.01449714, 0.2007782, 0.08728527, 0, 0.9882353, 1, 1,
-0.01127784, 0.2405546, 1.133832, 0, 0.9803922, 1, 1,
-0.008413031, -0.5182611, -1.901134, 0, 0.9764706, 1, 1,
-0.001246043, 0.2116544, 0.7754452, 0, 0.9686275, 1, 1,
0.0006939301, 0.1176965, -1.149741, 0, 0.9647059, 1, 1,
0.00357161, -0.8843775, 3.286016, 0, 0.9568627, 1, 1,
0.003844052, -0.7259442, 0.8004271, 0, 0.9529412, 1, 1,
0.005725672, -0.01577969, 3.501501, 0, 0.945098, 1, 1,
0.0156756, 0.4816249, -0.1086276, 0, 0.9411765, 1, 1,
0.0158292, 0.1459783, 0.496659, 0, 0.9333333, 1, 1,
0.01752936, -2.287509, 1.358543, 0, 0.9294118, 1, 1,
0.01816906, 1.238467, -0.567214, 0, 0.9215686, 1, 1,
0.02081845, 2.152983, 0.5702932, 0, 0.9176471, 1, 1,
0.02167452, -0.2281097, 3.859756, 0, 0.9098039, 1, 1,
0.02188001, -0.7036299, 3.112478, 0, 0.9058824, 1, 1,
0.02424878, -1.454332, 3.270599, 0, 0.8980392, 1, 1,
0.02521542, -1.206407, 1.651841, 0, 0.8901961, 1, 1,
0.02656441, 1.114635, -0.8934593, 0, 0.8862745, 1, 1,
0.02704657, 0.9705281, 0.3477494, 0, 0.8784314, 1, 1,
0.02841202, 0.1892753, 0.6384407, 0, 0.8745098, 1, 1,
0.02896895, 1.38266, -1.319649, 0, 0.8666667, 1, 1,
0.03576568, 0.9432852, -0.350825, 0, 0.8627451, 1, 1,
0.03615616, -1.474151, 2.718094, 0, 0.854902, 1, 1,
0.03815174, 0.08028476, 0.6474046, 0, 0.8509804, 1, 1,
0.03827978, 1.000826, 0.3419262, 0, 0.8431373, 1, 1,
0.03960185, -0.6051118, 4.837014, 0, 0.8392157, 1, 1,
0.0411339, -1.145229, 2.172322, 0, 0.8313726, 1, 1,
0.04249093, -0.7943305, 1.637878, 0, 0.827451, 1, 1,
0.04753558, 0.2724678, 0.3708737, 0, 0.8196079, 1, 1,
0.0501088, 0.5803843, -0.1082884, 0, 0.8156863, 1, 1,
0.05318667, 0.6989578, -0.3645157, 0, 0.8078431, 1, 1,
0.05759311, 0.4758821, -0.570435, 0, 0.8039216, 1, 1,
0.05817382, 1.387147, 0.9865797, 0, 0.7960784, 1, 1,
0.05869005, -0.8373779, 3.064243, 0, 0.7882353, 1, 1,
0.06263506, 0.9217958, 0.4952974, 0, 0.7843137, 1, 1,
0.06375706, 1.314744, 0.5890731, 0, 0.7764706, 1, 1,
0.06604473, -0.2405634, 2.940097, 0, 0.772549, 1, 1,
0.06828022, -1.230347, 3.54787, 0, 0.7647059, 1, 1,
0.07119936, -1.926138, 3.15066, 0, 0.7607843, 1, 1,
0.0717639, 1.231891, -0.3048134, 0, 0.7529412, 1, 1,
0.07589679, -1.253404, 1.949147, 0, 0.7490196, 1, 1,
0.07684515, 1.333654, -0.0191227, 0, 0.7411765, 1, 1,
0.08075358, -0.401778, 2.063171, 0, 0.7372549, 1, 1,
0.08232329, -0.4559212, 3.419264, 0, 0.7294118, 1, 1,
0.08996281, 0.5711727, 0.7078546, 0, 0.7254902, 1, 1,
0.09228412, -0.9881226, 2.077462, 0, 0.7176471, 1, 1,
0.092817, -0.5741258, 3.246551, 0, 0.7137255, 1, 1,
0.09357028, -0.4424108, 3.031234, 0, 0.7058824, 1, 1,
0.09422626, 1.456816, -0.09674343, 0, 0.6980392, 1, 1,
0.09521563, 0.8681501, 0.3526064, 0, 0.6941177, 1, 1,
0.09786667, -0.2152182, 2.841369, 0, 0.6862745, 1, 1,
0.09929853, 1.467498, -0.7674172, 0, 0.682353, 1, 1,
0.103915, 0.6263941, 1.488781, 0, 0.6745098, 1, 1,
0.1050914, -1.689566, 2.514715, 0, 0.6705883, 1, 1,
0.1105084, 0.6751793, 0.02526564, 0, 0.6627451, 1, 1,
0.1112763, 0.1223877, -1.294693, 0, 0.6588235, 1, 1,
0.1139318, 0.6116956, 1.775793, 0, 0.6509804, 1, 1,
0.1182456, -0.6101665, 1.055711, 0, 0.6470588, 1, 1,
0.118478, -0.6687151, 2.068105, 0, 0.6392157, 1, 1,
0.1204281, -0.4777925, 1.471414, 0, 0.6352941, 1, 1,
0.1231555, 0.5370449, 0.432945, 0, 0.627451, 1, 1,
0.1246888, -0.06559366, 2.958991, 0, 0.6235294, 1, 1,
0.1285932, 0.6070304, 1.585636, 0, 0.6156863, 1, 1,
0.1299407, 0.4055001, 1.512711, 0, 0.6117647, 1, 1,
0.1317505, 1.267349, 0.9886856, 0, 0.6039216, 1, 1,
0.1320965, -1.121142, 2.476013, 0, 0.5960785, 1, 1,
0.132753, 0.273073, 1.497331, 0, 0.5921569, 1, 1,
0.1331067, 0.1940386, 3.111115, 0, 0.5843138, 1, 1,
0.1347023, -1.346847, 2.790403, 0, 0.5803922, 1, 1,
0.1348284, -0.4443307, 1.785781, 0, 0.572549, 1, 1,
0.1357095, -0.6252031, 2.628903, 0, 0.5686275, 1, 1,
0.1374743, 1.123589, -0.7196525, 0, 0.5607843, 1, 1,
0.1447223, 0.4899498, 0.09549322, 0, 0.5568628, 1, 1,
0.1450705, -0.6534572, 3.148689, 0, 0.5490196, 1, 1,
0.1482766, -1.04196, 1.715814, 0, 0.5450981, 1, 1,
0.1484133, -0.7521799, 3.369426, 0, 0.5372549, 1, 1,
0.1510806, -1.05473, 2.319902, 0, 0.5333334, 1, 1,
0.1521795, -0.1744893, 2.220047, 0, 0.5254902, 1, 1,
0.1521872, -1.520625, 2.165609, 0, 0.5215687, 1, 1,
0.1583509, 0.8947042, 0.115103, 0, 0.5137255, 1, 1,
0.1606585, -1.950119, 3.655245, 0, 0.509804, 1, 1,
0.1640643, 0.1275853, 1.565544, 0, 0.5019608, 1, 1,
0.1691936, -0.5251235, 1.960092, 0, 0.4941176, 1, 1,
0.1720138, -0.4346953, 0.7651928, 0, 0.4901961, 1, 1,
0.1735191, 0.4499806, -0.4623511, 0, 0.4823529, 1, 1,
0.1792127, 0.8523513, 1.184315, 0, 0.4784314, 1, 1,
0.1793451, -0.2241972, 3.565952, 0, 0.4705882, 1, 1,
0.1820675, 1.244519, 0.9007789, 0, 0.4666667, 1, 1,
0.1854725, 0.8509853, 0.2625385, 0, 0.4588235, 1, 1,
0.1864282, 1.419171, 0.4707474, 0, 0.454902, 1, 1,
0.1954619, -0.3957085, 2.826272, 0, 0.4470588, 1, 1,
0.2005892, -0.9451059, 3.301753, 0, 0.4431373, 1, 1,
0.2017117, -0.5786809, 1.764578, 0, 0.4352941, 1, 1,
0.203063, -1.368765, 3.147336, 0, 0.4313726, 1, 1,
0.2042859, -0.9994678, 3.535384, 0, 0.4235294, 1, 1,
0.2080307, -0.1348774, 2.270265, 0, 0.4196078, 1, 1,
0.2103127, 0.7147103, 0.03067234, 0, 0.4117647, 1, 1,
0.2107063, -1.480039, 3.156483, 0, 0.4078431, 1, 1,
0.2152967, -0.2152457, 3.765588, 0, 0.4, 1, 1,
0.2378769, -0.4284721, 0.9901385, 0, 0.3921569, 1, 1,
0.238871, -2.708769, 4.27976, 0, 0.3882353, 1, 1,
0.2410582, 0.4929103, -0.2630826, 0, 0.3803922, 1, 1,
0.2454474, 1.87157, 0.2703746, 0, 0.3764706, 1, 1,
0.2474765, -0.6676695, 3.199484, 0, 0.3686275, 1, 1,
0.2566388, 0.6749399, 1.952636, 0, 0.3647059, 1, 1,
0.2603967, -0.9207824, 3.275341, 0, 0.3568628, 1, 1,
0.2646251, 1.918283, 0.2813134, 0, 0.3529412, 1, 1,
0.2669455, 1.902024, 0.6931772, 0, 0.345098, 1, 1,
0.2671767, 1.60087, 0.853443, 0, 0.3411765, 1, 1,
0.2735835, -2.371527, 4.206589, 0, 0.3333333, 1, 1,
0.2760978, -0.3676707, 3.471659, 0, 0.3294118, 1, 1,
0.2789614, 0.7756488, 0.5167302, 0, 0.3215686, 1, 1,
0.2846182, -0.7780425, 1.797417, 0, 0.3176471, 1, 1,
0.2860045, -0.08145955, 3.261792, 0, 0.3098039, 1, 1,
0.2866853, 0.8810107, 1.746178, 0, 0.3058824, 1, 1,
0.295983, 0.8310636, 0.8532717, 0, 0.2980392, 1, 1,
0.2961792, -1.534266, -0.2334779, 0, 0.2901961, 1, 1,
0.2994583, -0.7583316, 3.225795, 0, 0.2862745, 1, 1,
0.3007187, -0.08503687, 3.169038, 0, 0.2784314, 1, 1,
0.3009612, -0.6185986, 1.035321, 0, 0.2745098, 1, 1,
0.3022152, -1.708679, 1.454849, 0, 0.2666667, 1, 1,
0.303538, -1.212243, 0.07196139, 0, 0.2627451, 1, 1,
0.3058811, 0.7882278, 1.679865, 0, 0.254902, 1, 1,
0.307541, -0.7747275, 3.721477, 0, 0.2509804, 1, 1,
0.3182882, 0.1035637, 1.459375, 0, 0.2431373, 1, 1,
0.3215206, 0.5141307, 1.83602, 0, 0.2392157, 1, 1,
0.3239777, 0.396794, 2.264563, 0, 0.2313726, 1, 1,
0.3245271, -0.5190687, 2.606376, 0, 0.227451, 1, 1,
0.3275757, 0.1950494, 0.2005939, 0, 0.2196078, 1, 1,
0.3298517, -0.7916638, 2.588687, 0, 0.2156863, 1, 1,
0.331156, -0.417526, 2.072762, 0, 0.2078431, 1, 1,
0.3352984, -0.8374934, 2.510225, 0, 0.2039216, 1, 1,
0.338962, -1.09657, 1.453907, 0, 0.1960784, 1, 1,
0.3402107, -0.7028024, 2.606244, 0, 0.1882353, 1, 1,
0.3429783, 0.08267745, 1.714606, 0, 0.1843137, 1, 1,
0.3439367, -1.292144, 1.458265, 0, 0.1764706, 1, 1,
0.3447211, 0.2111054, 0.4001896, 0, 0.172549, 1, 1,
0.34754, 0.9442948, 0.1854046, 0, 0.1647059, 1, 1,
0.3493595, 1.382242, -0.4898341, 0, 0.1607843, 1, 1,
0.3511898, -1.037448, 3.198123, 0, 0.1529412, 1, 1,
0.3527426, 0.3541137, -1.320566, 0, 0.1490196, 1, 1,
0.352968, -0.6659214, 2.888251, 0, 0.1411765, 1, 1,
0.3530389, -1.302799, 0.5623025, 0, 0.1372549, 1, 1,
0.3610899, -0.3792103, 2.479453, 0, 0.1294118, 1, 1,
0.3612493, -1.056661, 2.114627, 0, 0.1254902, 1, 1,
0.3653645, 0.3712942, 0.7770396, 0, 0.1176471, 1, 1,
0.3682514, 0.7808998, 0.5645734, 0, 0.1137255, 1, 1,
0.3711714, -0.9341398, 2.288526, 0, 0.1058824, 1, 1,
0.3728958, 0.5885203, 1.933795, 0, 0.09803922, 1, 1,
0.3739833, -1.582263, 2.770668, 0, 0.09411765, 1, 1,
0.3758208, 1.592921, 1.225449, 0, 0.08627451, 1, 1,
0.3767498, -0.561838, 2.763227, 0, 0.08235294, 1, 1,
0.3771073, -0.452198, 2.313241, 0, 0.07450981, 1, 1,
0.3777606, 1.839535, -0.7371048, 0, 0.07058824, 1, 1,
0.3817457, -0.8524663, 3.881565, 0, 0.0627451, 1, 1,
0.3827676, -0.7508364, 3.95698, 0, 0.05882353, 1, 1,
0.3858153, 0.8926573, 0.0669491, 0, 0.05098039, 1, 1,
0.3890672, -2.260165, 3.313762, 0, 0.04705882, 1, 1,
0.392237, 2.011833, -0.8284467, 0, 0.03921569, 1, 1,
0.3945243, -0.5154848, 2.419517, 0, 0.03529412, 1, 1,
0.3963361, 0.199538, 1.030729, 0, 0.02745098, 1, 1,
0.3984229, -1.735901, 1.475728, 0, 0.02352941, 1, 1,
0.4000369, 1.253384, 1.688929, 0, 0.01568628, 1, 1,
0.4050585, -0.9676226, 3.61202, 0, 0.01176471, 1, 1,
0.4057271, 0.4097824, 1.669149, 0, 0.003921569, 1, 1,
0.4088127, 0.7505093, 1.565593, 0.003921569, 0, 1, 1,
0.4089314, 0.3257862, 0.9393233, 0.007843138, 0, 1, 1,
0.4142139, -0.7130299, 3.373448, 0.01568628, 0, 1, 1,
0.4170158, -0.03826634, 0.02406225, 0.01960784, 0, 1, 1,
0.4173472, 2.08142, -0.4495202, 0.02745098, 0, 1, 1,
0.4182467, -1.411648, 3.097442, 0.03137255, 0, 1, 1,
0.4191492, 1.398959, 1.162919, 0.03921569, 0, 1, 1,
0.4206012, -0.6428716, 2.442949, 0.04313726, 0, 1, 1,
0.4228014, -0.286525, 2.832718, 0.05098039, 0, 1, 1,
0.4298059, 0.3223166, 1.774734, 0.05490196, 0, 1, 1,
0.4361264, -0.452439, 3.259395, 0.0627451, 0, 1, 1,
0.4361607, -1.096331, 3.187039, 0.06666667, 0, 1, 1,
0.4380982, -0.1332022, 1.002514, 0.07450981, 0, 1, 1,
0.4438322, 0.4022028, 0.6153388, 0.07843138, 0, 1, 1,
0.4468755, -0.5285933, 5.487212, 0.08627451, 0, 1, 1,
0.4488573, -0.6210337, 3.483109, 0.09019608, 0, 1, 1,
0.4516518, 0.1875989, 2.54116, 0.09803922, 0, 1, 1,
0.4529285, 0.002621316, 1.067872, 0.1058824, 0, 1, 1,
0.4567083, -0.1926269, 1.321904, 0.1098039, 0, 1, 1,
0.4619957, 0.02370371, 0.6479958, 0.1176471, 0, 1, 1,
0.4643477, -1.476537, 2.876497, 0.1215686, 0, 1, 1,
0.464517, 0.32124, 1.565433, 0.1294118, 0, 1, 1,
0.4658499, -0.500994, 2.595875, 0.1333333, 0, 1, 1,
0.4679211, 1.311672, -0.423443, 0.1411765, 0, 1, 1,
0.4729044, -0.6101156, 2.234171, 0.145098, 0, 1, 1,
0.479572, -1.520065, 1.977015, 0.1529412, 0, 1, 1,
0.4863484, -0.3308131, 0.9714575, 0.1568628, 0, 1, 1,
0.4963939, -0.1728833, 1.971025, 0.1647059, 0, 1, 1,
0.5010893, 1.65391, 1.501168, 0.1686275, 0, 1, 1,
0.5028557, -1.972754, 2.629227, 0.1764706, 0, 1, 1,
0.504239, 0.3614424, -0.8630726, 0.1803922, 0, 1, 1,
0.5061484, 0.7405213, 1.271429, 0.1882353, 0, 1, 1,
0.5064713, 0.108164, 1.546345, 0.1921569, 0, 1, 1,
0.5070418, 0.008677755, 1.64261, 0.2, 0, 1, 1,
0.5180171, -0.0679179, 1.680194, 0.2078431, 0, 1, 1,
0.5204607, -2.311468, 2.323009, 0.2117647, 0, 1, 1,
0.5247527, 2.00008, 0.1691163, 0.2196078, 0, 1, 1,
0.5259514, -0.5928694, 2.701399, 0.2235294, 0, 1, 1,
0.526236, 0.2588796, 2.481345, 0.2313726, 0, 1, 1,
0.5279257, -0.2958396, 3.271648, 0.2352941, 0, 1, 1,
0.5346647, 2.034877, -0.9034892, 0.2431373, 0, 1, 1,
0.5349814, 0.1757751, 0.6160981, 0.2470588, 0, 1, 1,
0.536539, 0.7879956, -1.15024, 0.254902, 0, 1, 1,
0.5386323, 1.451795, -0.8259616, 0.2588235, 0, 1, 1,
0.5401834, -0.02539512, 1.92235, 0.2666667, 0, 1, 1,
0.5461466, -0.712806, 2.552713, 0.2705882, 0, 1, 1,
0.5542877, 0.0003236637, -0.3440701, 0.2784314, 0, 1, 1,
0.5549991, -0.7557478, 1.126854, 0.282353, 0, 1, 1,
0.5616031, 0.9607739, 0.2137534, 0.2901961, 0, 1, 1,
0.566388, -2.120517, 3.258086, 0.2941177, 0, 1, 1,
0.5673887, 0.09672974, 0.753172, 0.3019608, 0, 1, 1,
0.5688346, 1.230534, 0.6656105, 0.3098039, 0, 1, 1,
0.5692964, -0.4411921, 0.4945966, 0.3137255, 0, 1, 1,
0.5730075, 0.1588488, -1.040375, 0.3215686, 0, 1, 1,
0.5731179, 0.5539608, -0.7469616, 0.3254902, 0, 1, 1,
0.5768175, 0.548273, 0.01796835, 0.3333333, 0, 1, 1,
0.5846905, -0.9663869, 3.095609, 0.3372549, 0, 1, 1,
0.5867427, -0.1624682, 2.539123, 0.345098, 0, 1, 1,
0.5875074, 1.050249, -0.7788411, 0.3490196, 0, 1, 1,
0.5875735, -1.965411, 2.642823, 0.3568628, 0, 1, 1,
0.59215, -1.659094, 0.3667214, 0.3607843, 0, 1, 1,
0.5922244, 2.037593, -2.587492, 0.3686275, 0, 1, 1,
0.5928985, 0.2054068, 2.394193, 0.372549, 0, 1, 1,
0.5933831, -0.5514595, 1.703341, 0.3803922, 0, 1, 1,
0.5944827, 0.262317, 1.593878, 0.3843137, 0, 1, 1,
0.6011158, -0.9989148, 3.6888, 0.3921569, 0, 1, 1,
0.6029246, -0.1569816, 0.5417774, 0.3960784, 0, 1, 1,
0.6030164, 0.2898237, 1.39494, 0.4039216, 0, 1, 1,
0.61343, -0.613371, 4.754258, 0.4117647, 0, 1, 1,
0.6164464, 0.8978242, 2.498376, 0.4156863, 0, 1, 1,
0.6164865, 1.793796, 0.4129559, 0.4235294, 0, 1, 1,
0.6171347, 0.1443678, 2.170529, 0.427451, 0, 1, 1,
0.6190915, 0.5986481, 0.6997855, 0.4352941, 0, 1, 1,
0.6270207, -0.5797071, 1.709663, 0.4392157, 0, 1, 1,
0.6272475, -0.02150545, 1.535416, 0.4470588, 0, 1, 1,
0.628998, -0.6740627, 3.016104, 0.4509804, 0, 1, 1,
0.6311136, -1.18502, 2.610481, 0.4588235, 0, 1, 1,
0.6360466, 0.3471544, 0.9855907, 0.4627451, 0, 1, 1,
0.6360723, -1.847385, 1.865377, 0.4705882, 0, 1, 1,
0.6366674, 0.5678843, -0.08132065, 0.4745098, 0, 1, 1,
0.6396404, -1.48709, 4.128206, 0.4823529, 0, 1, 1,
0.6509776, -0.6425343, 4.276306, 0.4862745, 0, 1, 1,
0.6523364, 1.474035, 0.3868977, 0.4941176, 0, 1, 1,
0.6602973, 0.5595345, -0.2452649, 0.5019608, 0, 1, 1,
0.6626498, -1.213407, 4.469017, 0.5058824, 0, 1, 1,
0.6647757, 0.6374428, 0.3269792, 0.5137255, 0, 1, 1,
0.6649693, 0.1505124, 1.837362, 0.5176471, 0, 1, 1,
0.6689418, -0.8678288, 3.59132, 0.5254902, 0, 1, 1,
0.6733933, 0.2530636, 3.366968, 0.5294118, 0, 1, 1,
0.6772981, -0.02996661, 1.601802, 0.5372549, 0, 1, 1,
0.6775659, -0.8936492, 2.386256, 0.5411765, 0, 1, 1,
0.6809991, -1.656157, 1.880487, 0.5490196, 0, 1, 1,
0.6869239, -0.5087365, 0.547765, 0.5529412, 0, 1, 1,
0.6891677, -0.9888529, 1.574261, 0.5607843, 0, 1, 1,
0.6922735, -0.9391418, 1.95199, 0.5647059, 0, 1, 1,
0.6965307, -0.4011148, 3.996396, 0.572549, 0, 1, 1,
0.7045938, 1.22989, 0.03097166, 0.5764706, 0, 1, 1,
0.7076494, 0.6529317, 0.83029, 0.5843138, 0, 1, 1,
0.7111569, -1.442884, 4.012945, 0.5882353, 0, 1, 1,
0.7131613, -0.7267031, 1.40619, 0.5960785, 0, 1, 1,
0.7133365, -0.8834245, 3.390922, 0.6039216, 0, 1, 1,
0.7138392, -0.5185471, 2.615685, 0.6078432, 0, 1, 1,
0.7188262, -0.03391716, 1.389998, 0.6156863, 0, 1, 1,
0.7197312, -1.332044, 2.394874, 0.6196079, 0, 1, 1,
0.7217044, -0.7125921, 1.758517, 0.627451, 0, 1, 1,
0.7227303, -0.6756326, 2.534095, 0.6313726, 0, 1, 1,
0.7248706, 0.8984075, 2.146271, 0.6392157, 0, 1, 1,
0.7282443, 0.729205, 0.5985584, 0.6431373, 0, 1, 1,
0.7325641, -0.8256781, 0.7713367, 0.6509804, 0, 1, 1,
0.7363404, -1.18827, 2.414501, 0.654902, 0, 1, 1,
0.7393793, 0.8808172, -0.2401869, 0.6627451, 0, 1, 1,
0.7397778, -0.9533132, 1.06568, 0.6666667, 0, 1, 1,
0.7407358, 2.175213, 0.2473088, 0.6745098, 0, 1, 1,
0.7412358, -1.185074, 1.894305, 0.6784314, 0, 1, 1,
0.7439517, 0.1911081, 0.8242172, 0.6862745, 0, 1, 1,
0.7532288, -1.365415, 1.977639, 0.6901961, 0, 1, 1,
0.7577661, -0.0989588, 3.058348, 0.6980392, 0, 1, 1,
0.7614455, -0.277287, 2.566779, 0.7058824, 0, 1, 1,
0.7618684, 0.6094509, -0.05948109, 0.7098039, 0, 1, 1,
0.7619606, -0.8953769, 3.908135, 0.7176471, 0, 1, 1,
0.7627667, 0.8247481, 0.6659315, 0.7215686, 0, 1, 1,
0.7640209, 0.408004, 1.40257, 0.7294118, 0, 1, 1,
0.7652847, 0.243146, 1.329545, 0.7333333, 0, 1, 1,
0.7722561, 0.5274715, 1.520599, 0.7411765, 0, 1, 1,
0.7752457, 0.7953597, 2.445747, 0.7450981, 0, 1, 1,
0.7767727, -1.905115, 0.8773258, 0.7529412, 0, 1, 1,
0.7926469, -0.3213714, 2.141965, 0.7568628, 0, 1, 1,
0.793404, 0.04010747, 0.4706727, 0.7647059, 0, 1, 1,
0.7953284, -0.4691349, 1.946632, 0.7686275, 0, 1, 1,
0.8003569, 0.01527238, 2.503901, 0.7764706, 0, 1, 1,
0.8018173, 0.2922583, 0.5435903, 0.7803922, 0, 1, 1,
0.8080311, -1.157513, 1.947867, 0.7882353, 0, 1, 1,
0.8092989, 1.733047, 3.632041, 0.7921569, 0, 1, 1,
0.8127165, -0.4735151, 2.020952, 0.8, 0, 1, 1,
0.8144497, 1.513288, 0.4744969, 0.8078431, 0, 1, 1,
0.8267605, 0.1057614, 0.957531, 0.8117647, 0, 1, 1,
0.8270019, 0.08502334, 1.187072, 0.8196079, 0, 1, 1,
0.8275537, -1.588584, 1.932898, 0.8235294, 0, 1, 1,
0.8296564, -0.164365, 3.032034, 0.8313726, 0, 1, 1,
0.8300338, -1.390296, 3.109584, 0.8352941, 0, 1, 1,
0.8338277, -1.573878, 1.755781, 0.8431373, 0, 1, 1,
0.8382792, -0.2146993, 2.673613, 0.8470588, 0, 1, 1,
0.8402095, 1.433971, 0.6445802, 0.854902, 0, 1, 1,
0.8416275, -1.085478, 3.651006, 0.8588235, 0, 1, 1,
0.8423258, -0.8051097, 1.316195, 0.8666667, 0, 1, 1,
0.8438748, 0.4363484, 1.034922, 0.8705882, 0, 1, 1,
0.8469503, -0.5211524, 1.670228, 0.8784314, 0, 1, 1,
0.8492126, -1.386906, 4.097364, 0.8823529, 0, 1, 1,
0.8702129, -0.4464177, 3.596562, 0.8901961, 0, 1, 1,
0.8717684, -0.225448, 1.379665, 0.8941177, 0, 1, 1,
0.875509, -0.9938048, 1.385915, 0.9019608, 0, 1, 1,
0.8811679, 0.7326023, 1.710205, 0.9098039, 0, 1, 1,
0.8847123, -0.4506136, 1.089124, 0.9137255, 0, 1, 1,
0.8865224, 0.3353088, -0.9032189, 0.9215686, 0, 1, 1,
0.8936879, 1.042122, -0.2908348, 0.9254902, 0, 1, 1,
0.8952926, 2.095977, -0.777534, 0.9333333, 0, 1, 1,
0.8997521, 0.8476391, 0.0579042, 0.9372549, 0, 1, 1,
0.9006658, -1.12954, 3.692559, 0.945098, 0, 1, 1,
0.9009773, 0.8587213, 0.5138234, 0.9490196, 0, 1, 1,
0.9022241, 0.5490324, 0.08666093, 0.9568627, 0, 1, 1,
0.9029824, -0.3586698, 2.036579, 0.9607843, 0, 1, 1,
0.9036304, 1.120929, 0.3611635, 0.9686275, 0, 1, 1,
0.9070747, 0.2705707, 0.787825, 0.972549, 0, 1, 1,
0.9097173, -0.2786851, 2.284372, 0.9803922, 0, 1, 1,
0.9297924, 0.4831538, 1.112902, 0.9843137, 0, 1, 1,
0.9395076, 1.523975, 0.7538874, 0.9921569, 0, 1, 1,
0.9395615, -0.9067203, 3.880936, 0.9960784, 0, 1, 1,
0.9396809, -0.4329933, 1.597259, 1, 0, 0.9960784, 1,
0.9460267, 2.32224, 0.7973372, 1, 0, 0.9882353, 1,
0.9464668, -2.19768, 3.124346, 1, 0, 0.9843137, 1,
0.9582583, -0.1260945, 0.7487005, 1, 0, 0.9764706, 1,
0.9595344, -0.1392423, 3.222283, 1, 0, 0.972549, 1,
0.9695877, 0.1564263, 1.365953, 1, 0, 0.9647059, 1,
0.97516, -1.501488, 2.511018, 1, 0, 0.9607843, 1,
0.9761233, -0.4820337, 2.695284, 1, 0, 0.9529412, 1,
0.9770299, 1.356889, 0.6572172, 1, 0, 0.9490196, 1,
0.9771882, -0.5765132, 1.925925, 1, 0, 0.9411765, 1,
0.9790423, -2.160394, 3.325886, 1, 0, 0.9372549, 1,
0.9822531, -0.4482822, 2.376348, 1, 0, 0.9294118, 1,
0.9832171, -0.3277539, 2.110281, 1, 0, 0.9254902, 1,
0.9991611, -1.462934, 2.234775, 1, 0, 0.9176471, 1,
1.003732, 1.156156, 0.8091943, 1, 0, 0.9137255, 1,
1.005532, -1.160431, 1.423021, 1, 0, 0.9058824, 1,
1.009433, 0.6095192, 2.340067, 1, 0, 0.9019608, 1,
1.010394, 0.7718973, -0.6625336, 1, 0, 0.8941177, 1,
1.01674, -1.160392, 2.004639, 1, 0, 0.8862745, 1,
1.022627, -0.2712518, 0.8469644, 1, 0, 0.8823529, 1,
1.023605, 0.3800926, 1.756783, 1, 0, 0.8745098, 1,
1.033099, -0.6384198, 3.565678, 1, 0, 0.8705882, 1,
1.033534, -1.479332, 3.5818, 1, 0, 0.8627451, 1,
1.037309, -0.5454262, 3.50926, 1, 0, 0.8588235, 1,
1.049403, 1.917615, 2.949183, 1, 0, 0.8509804, 1,
1.064549, -0.3815996, 1.063402, 1, 0, 0.8470588, 1,
1.065603, -0.643796, 1.575519, 1, 0, 0.8392157, 1,
1.068776, -0.1942039, 2.150064, 1, 0, 0.8352941, 1,
1.076666, 0.5613379, 0.3118417, 1, 0, 0.827451, 1,
1.07838, 0.4113045, 1.58458, 1, 0, 0.8235294, 1,
1.080737, 0.5377274, -0.4623162, 1, 0, 0.8156863, 1,
1.087163, 1.841797, 0.06221801, 1, 0, 0.8117647, 1,
1.091669, 0.9716375, 0.07800413, 1, 0, 0.8039216, 1,
1.093202, -0.7164422, 1.932839, 1, 0, 0.7960784, 1,
1.093272, -1.964471, 2.287613, 1, 0, 0.7921569, 1,
1.096708, -0.6226259, 2.52204, 1, 0, 0.7843137, 1,
1.097783, 1.527782, 2.601592, 1, 0, 0.7803922, 1,
1.097961, 0.7650252, -1.417107, 1, 0, 0.772549, 1,
1.1043, -0.5745118, 3.10433, 1, 0, 0.7686275, 1,
1.104379, 2.707823, 0.4185608, 1, 0, 0.7607843, 1,
1.105101, 1.695643, 0.6141257, 1, 0, 0.7568628, 1,
1.105153, 1.628972, -0.1172192, 1, 0, 0.7490196, 1,
1.10973, -1.610356, 2.200816, 1, 0, 0.7450981, 1,
1.122496, 1.498563, 1.453538, 1, 0, 0.7372549, 1,
1.12598, -1.165384, 2.863966, 1, 0, 0.7333333, 1,
1.128238, -1.413922, 2.993486, 1, 0, 0.7254902, 1,
1.128992, -1.145126, 1.978476, 1, 0, 0.7215686, 1,
1.129781, -0.837079, 2.088727, 1, 0, 0.7137255, 1,
1.130576, 1.543122, 1.000114, 1, 0, 0.7098039, 1,
1.130871, 0.420443, 3.288049, 1, 0, 0.7019608, 1,
1.137762, 0.6389256, 0.9733844, 1, 0, 0.6941177, 1,
1.138573, 1.606733, -1.276654, 1, 0, 0.6901961, 1,
1.142243, 0.06148371, 2.066898, 1, 0, 0.682353, 1,
1.149822, 0.7458685, 2.378173, 1, 0, 0.6784314, 1,
1.164635, -0.696754, 0.1501997, 1, 0, 0.6705883, 1,
1.173814, 1.703495, 1.290997, 1, 0, 0.6666667, 1,
1.175068, 0.3342638, 1.089824, 1, 0, 0.6588235, 1,
1.175202, -0.5345423, 2.71305, 1, 0, 0.654902, 1,
1.183241, -0.585775, 0.7763413, 1, 0, 0.6470588, 1,
1.190146, 0.5488351, 0.7890007, 1, 0, 0.6431373, 1,
1.191864, 0.8687025, 0.8456963, 1, 0, 0.6352941, 1,
1.194117, 0.7549437, 0.8227746, 1, 0, 0.6313726, 1,
1.199019, -0.2967264, 2.271125, 1, 0, 0.6235294, 1,
1.201091, -0.6109851, 0.118717, 1, 0, 0.6196079, 1,
1.206773, -0.1022723, 2.884183, 1, 0, 0.6117647, 1,
1.215764, 0.3187926, 2.564778, 1, 0, 0.6078432, 1,
1.220732, -0.6803374, 4.134474, 1, 0, 0.6, 1,
1.233434, 0.6803735, 0.7968348, 1, 0, 0.5921569, 1,
1.233804, 1.173552, 2.043362, 1, 0, 0.5882353, 1,
1.236415, -0.3568699, 1.715846, 1, 0, 0.5803922, 1,
1.238031, -0.6984082, 1.977576, 1, 0, 0.5764706, 1,
1.249328, -1.805129, 2.14739, 1, 0, 0.5686275, 1,
1.250653, -0.2251923, 1.377966, 1, 0, 0.5647059, 1,
1.251333, -0.794727, 0.6169916, 1, 0, 0.5568628, 1,
1.253417, 0.863452, -0.4250134, 1, 0, 0.5529412, 1,
1.264169, 0.5237668, 2.586571, 1, 0, 0.5450981, 1,
1.274629, -1.617444, 2.279794, 1, 0, 0.5411765, 1,
1.277546, 0.1343262, 2.090603, 1, 0, 0.5333334, 1,
1.278591, -0.08796095, 2.048017, 1, 0, 0.5294118, 1,
1.305694, 0.4635823, 1.550785, 1, 0, 0.5215687, 1,
1.308925, -0.5316457, 1.705383, 1, 0, 0.5176471, 1,
1.325113, -0.6798795, 2.13618, 1, 0, 0.509804, 1,
1.328665, -0.8409978, 3.400656, 1, 0, 0.5058824, 1,
1.329963, -0.3137898, 1.019488, 1, 0, 0.4980392, 1,
1.330788, 0.05423611, 1.73008, 1, 0, 0.4901961, 1,
1.345119, 2.264525, 0.1769142, 1, 0, 0.4862745, 1,
1.351377, -1.021587, 1.067109, 1, 0, 0.4784314, 1,
1.355037, -0.6573641, 2.152247, 1, 0, 0.4745098, 1,
1.359239, -0.8524351, 1.994831, 1, 0, 0.4666667, 1,
1.361632, -0.02039729, 1.430995, 1, 0, 0.4627451, 1,
1.369468, -1.136316, 1.919791, 1, 0, 0.454902, 1,
1.372786, -0.5712399, 0.2747531, 1, 0, 0.4509804, 1,
1.375734, 0.8925604, 0.3617876, 1, 0, 0.4431373, 1,
1.379332, -1.35072, 3.169963, 1, 0, 0.4392157, 1,
1.384334, 0.6356637, 1.291175, 1, 0, 0.4313726, 1,
1.40495, -0.5383679, 1.558517, 1, 0, 0.427451, 1,
1.410143, -1.66708, 2.785151, 1, 0, 0.4196078, 1,
1.413866, -1.258268, 1.996436, 1, 0, 0.4156863, 1,
1.414721, -0.04207209, 0.9625885, 1, 0, 0.4078431, 1,
1.415709, -1.873488, 2.499725, 1, 0, 0.4039216, 1,
1.415866, -0.1444903, 2.528965, 1, 0, 0.3960784, 1,
1.418991, -2.128425, 1.86799, 1, 0, 0.3882353, 1,
1.420415, -0.7586695, 2.655878, 1, 0, 0.3843137, 1,
1.426138, -1.221127, 3.491471, 1, 0, 0.3764706, 1,
1.429652, 1.411009, -0.2096529, 1, 0, 0.372549, 1,
1.435216, 0.7093883, 1.000695, 1, 0, 0.3647059, 1,
1.439396, -0.4589902, 2.278669, 1, 0, 0.3607843, 1,
1.442868, 1.247845, -0.7562066, 1, 0, 0.3529412, 1,
1.446806, 1.063158, 1.425828, 1, 0, 0.3490196, 1,
1.448435, -1.361364, 1.822791, 1, 0, 0.3411765, 1,
1.454052, 0.7541059, 1.542214, 1, 0, 0.3372549, 1,
1.464633, 0.4277771, 2.039279, 1, 0, 0.3294118, 1,
1.478274, -1.069138, 2.032563, 1, 0, 0.3254902, 1,
1.4785, -0.8287839, 2.380765, 1, 0, 0.3176471, 1,
1.485931, 0.1109366, 1.123981, 1, 0, 0.3137255, 1,
1.492234, 0.1971857, 1.155435, 1, 0, 0.3058824, 1,
1.499869, -0.8786893, 1.825887, 1, 0, 0.2980392, 1,
1.507279, -2.030928, 2.273736, 1, 0, 0.2941177, 1,
1.507817, 1.107729, 3.908122, 1, 0, 0.2862745, 1,
1.542429, 0.4663645, 1.076917, 1, 0, 0.282353, 1,
1.546748, -0.3411636, 0.5215818, 1, 0, 0.2745098, 1,
1.578489, -0.226836, 2.801513, 1, 0, 0.2705882, 1,
1.617964, -1.365581, 3.337082, 1, 0, 0.2627451, 1,
1.619432, -1.665185, 0.4593534, 1, 0, 0.2588235, 1,
1.619514, -0.1189303, -0.02837074, 1, 0, 0.2509804, 1,
1.639293, -0.08461281, 2.692935, 1, 0, 0.2470588, 1,
1.652983, 0.06868606, 1.736157, 1, 0, 0.2392157, 1,
1.707109, 2.991746, -0.4668283, 1, 0, 0.2352941, 1,
1.719786, 0.300692, 0.6777695, 1, 0, 0.227451, 1,
1.720764, -1.03249, 2.232014, 1, 0, 0.2235294, 1,
1.745469, 1.600672, 2.067783, 1, 0, 0.2156863, 1,
1.747849, -1.824273, 1.579782, 1, 0, 0.2117647, 1,
1.761293, -0.9081528, 2.124577, 1, 0, 0.2039216, 1,
1.780615, 0.641035, 0.4224905, 1, 0, 0.1960784, 1,
1.793238, -0.3776906, 0.6399215, 1, 0, 0.1921569, 1,
1.794314, 0.1862679, 1.798342, 1, 0, 0.1843137, 1,
1.807521, -0.1946705, -0.8790821, 1, 0, 0.1803922, 1,
1.824479, -1.283359, 1.91999, 1, 0, 0.172549, 1,
1.826613, -0.2122611, 2.518973, 1, 0, 0.1686275, 1,
1.839361, -1.076526, 1.650157, 1, 0, 0.1607843, 1,
1.850386, 0.1941479, 2.146962, 1, 0, 0.1568628, 1,
1.856218, 1.466799, 1.291445, 1, 0, 0.1490196, 1,
1.876322, 0.5095284, 2.517814, 1, 0, 0.145098, 1,
1.881611, -1.021164, 1.524415, 1, 0, 0.1372549, 1,
1.884602, -0.8379911, 0.1602781, 1, 0, 0.1333333, 1,
1.897378, -0.4626847, 1.763612, 1, 0, 0.1254902, 1,
1.899377, 0.5139026, 0.169052, 1, 0, 0.1215686, 1,
1.900939, -0.5259842, 1.041787, 1, 0, 0.1137255, 1,
1.919145, 1.025395, 0.5477764, 1, 0, 0.1098039, 1,
1.942345, -0.1681659, 3.048169, 1, 0, 0.1019608, 1,
1.943995, 0.3776509, 2.178061, 1, 0, 0.09411765, 1,
1.950287, -0.5683554, 2.295504, 1, 0, 0.09019608, 1,
1.961787, -0.1910703, 0.3884465, 1, 0, 0.08235294, 1,
1.977721, 0.9258441, 3.409442, 1, 0, 0.07843138, 1,
2.033517, 1.06138, 1.794969, 1, 0, 0.07058824, 1,
2.052302, -1.522848, 2.096119, 1, 0, 0.06666667, 1,
2.080837, -0.9871673, 1.817136, 1, 0, 0.05882353, 1,
2.225566, 0.6579338, 1.19946, 1, 0, 0.05490196, 1,
2.305521, 2.037929, 1.532463, 1, 0, 0.04705882, 1,
2.319956, 0.9879026, 0.9945509, 1, 0, 0.04313726, 1,
2.41366, -0.9815908, 1.237776, 1, 0, 0.03529412, 1,
2.517894, 0.2254273, -0.494968, 1, 0, 0.03137255, 1,
2.519252, 0.6896172, 1.484297, 1, 0, 0.02352941, 1,
2.63347, -1.051142, -0.0805934, 1, 0, 0.01960784, 1,
2.670467, -0.5429653, 2.271355, 1, 0, 0.01176471, 1,
3.013496, 0.400149, 0.36213, 1, 0, 0.007843138, 1
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
-0.008321643, -3.675006, -7.239764, 0, -0.5, 0.5, 0.5,
-0.008321643, -3.675006, -7.239764, 1, -0.5, 0.5, 0.5,
-0.008321643, -3.675006, -7.239764, 1, 1.5, 0.5, 0.5,
-0.008321643, -3.675006, -7.239764, 0, 1.5, 0.5, 0.5
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
-4.054536, 0.1414886, -7.239764, 0, -0.5, 0.5, 0.5,
-4.054536, 0.1414886, -7.239764, 1, -0.5, 0.5, 0.5,
-4.054536, 0.1414886, -7.239764, 1, 1.5, 0.5, 0.5,
-4.054536, 0.1414886, -7.239764, 0, 1.5, 0.5, 0.5
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
-4.054536, -3.675006, 0.04600787, 0, -0.5, 0.5, 0.5,
-4.054536, -3.675006, 0.04600787, 1, -0.5, 0.5, 0.5,
-4.054536, -3.675006, 0.04600787, 1, 1.5, 0.5, 0.5,
-4.054536, -3.675006, 0.04600787, 0, 1.5, 0.5, 0.5
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
-3, -2.794276, -5.558432,
3, -2.794276, -5.558432,
-3, -2.794276, -5.558432,
-3, -2.941065, -5.838654,
-2, -2.794276, -5.558432,
-2, -2.941065, -5.838654,
-1, -2.794276, -5.558432,
-1, -2.941065, -5.838654,
0, -2.794276, -5.558432,
0, -2.941065, -5.838654,
1, -2.794276, -5.558432,
1, -2.941065, -5.838654,
2, -2.794276, -5.558432,
2, -2.941065, -5.838654,
3, -2.794276, -5.558432,
3, -2.941065, -5.838654
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
-3, -3.234641, -6.399098, 0, -0.5, 0.5, 0.5,
-3, -3.234641, -6.399098, 1, -0.5, 0.5, 0.5,
-3, -3.234641, -6.399098, 1, 1.5, 0.5, 0.5,
-3, -3.234641, -6.399098, 0, 1.5, 0.5, 0.5,
-2, -3.234641, -6.399098, 0, -0.5, 0.5, 0.5,
-2, -3.234641, -6.399098, 1, -0.5, 0.5, 0.5,
-2, -3.234641, -6.399098, 1, 1.5, 0.5, 0.5,
-2, -3.234641, -6.399098, 0, 1.5, 0.5, 0.5,
-1, -3.234641, -6.399098, 0, -0.5, 0.5, 0.5,
-1, -3.234641, -6.399098, 1, -0.5, 0.5, 0.5,
-1, -3.234641, -6.399098, 1, 1.5, 0.5, 0.5,
-1, -3.234641, -6.399098, 0, 1.5, 0.5, 0.5,
0, -3.234641, -6.399098, 0, -0.5, 0.5, 0.5,
0, -3.234641, -6.399098, 1, -0.5, 0.5, 0.5,
0, -3.234641, -6.399098, 1, 1.5, 0.5, 0.5,
0, -3.234641, -6.399098, 0, 1.5, 0.5, 0.5,
1, -3.234641, -6.399098, 0, -0.5, 0.5, 0.5,
1, -3.234641, -6.399098, 1, -0.5, 0.5, 0.5,
1, -3.234641, -6.399098, 1, 1.5, 0.5, 0.5,
1, -3.234641, -6.399098, 0, 1.5, 0.5, 0.5,
2, -3.234641, -6.399098, 0, -0.5, 0.5, 0.5,
2, -3.234641, -6.399098, 1, -0.5, 0.5, 0.5,
2, -3.234641, -6.399098, 1, 1.5, 0.5, 0.5,
2, -3.234641, -6.399098, 0, 1.5, 0.5, 0.5,
3, -3.234641, -6.399098, 0, -0.5, 0.5, 0.5,
3, -3.234641, -6.399098, 1, -0.5, 0.5, 0.5,
3, -3.234641, -6.399098, 1, 1.5, 0.5, 0.5,
3, -3.234641, -6.399098, 0, 1.5, 0.5, 0.5
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
-3.120794, -2, -5.558432,
-3.120794, 2, -5.558432,
-3.120794, -2, -5.558432,
-3.276417, -2, -5.838654,
-3.120794, -1, -5.558432,
-3.276417, -1, -5.838654,
-3.120794, 0, -5.558432,
-3.276417, 0, -5.838654,
-3.120794, 1, -5.558432,
-3.276417, 1, -5.838654,
-3.120794, 2, -5.558432,
-3.276417, 2, -5.838654
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
-3.587665, -2, -6.399098, 0, -0.5, 0.5, 0.5,
-3.587665, -2, -6.399098, 1, -0.5, 0.5, 0.5,
-3.587665, -2, -6.399098, 1, 1.5, 0.5, 0.5,
-3.587665, -2, -6.399098, 0, 1.5, 0.5, 0.5,
-3.587665, -1, -6.399098, 0, -0.5, 0.5, 0.5,
-3.587665, -1, -6.399098, 1, -0.5, 0.5, 0.5,
-3.587665, -1, -6.399098, 1, 1.5, 0.5, 0.5,
-3.587665, -1, -6.399098, 0, 1.5, 0.5, 0.5,
-3.587665, 0, -6.399098, 0, -0.5, 0.5, 0.5,
-3.587665, 0, -6.399098, 1, -0.5, 0.5, 0.5,
-3.587665, 0, -6.399098, 1, 1.5, 0.5, 0.5,
-3.587665, 0, -6.399098, 0, 1.5, 0.5, 0.5,
-3.587665, 1, -6.399098, 0, -0.5, 0.5, 0.5,
-3.587665, 1, -6.399098, 1, -0.5, 0.5, 0.5,
-3.587665, 1, -6.399098, 1, 1.5, 0.5, 0.5,
-3.587665, 1, -6.399098, 0, 1.5, 0.5, 0.5,
-3.587665, 2, -6.399098, 0, -0.5, 0.5, 0.5,
-3.587665, 2, -6.399098, 1, -0.5, 0.5, 0.5,
-3.587665, 2, -6.399098, 1, 1.5, 0.5, 0.5,
-3.587665, 2, -6.399098, 0, 1.5, 0.5, 0.5
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
-3.120794, -2.794276, -4,
-3.120794, -2.794276, 4,
-3.120794, -2.794276, -4,
-3.276417, -2.941065, -4,
-3.120794, -2.794276, -2,
-3.276417, -2.941065, -2,
-3.120794, -2.794276, 0,
-3.276417, -2.941065, 0,
-3.120794, -2.794276, 2,
-3.276417, -2.941065, 2,
-3.120794, -2.794276, 4,
-3.276417, -2.941065, 4
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
-3.587665, -3.234641, -4, 0, -0.5, 0.5, 0.5,
-3.587665, -3.234641, -4, 1, -0.5, 0.5, 0.5,
-3.587665, -3.234641, -4, 1, 1.5, 0.5, 0.5,
-3.587665, -3.234641, -4, 0, 1.5, 0.5, 0.5,
-3.587665, -3.234641, -2, 0, -0.5, 0.5, 0.5,
-3.587665, -3.234641, -2, 1, -0.5, 0.5, 0.5,
-3.587665, -3.234641, -2, 1, 1.5, 0.5, 0.5,
-3.587665, -3.234641, -2, 0, 1.5, 0.5, 0.5,
-3.587665, -3.234641, 0, 0, -0.5, 0.5, 0.5,
-3.587665, -3.234641, 0, 1, -0.5, 0.5, 0.5,
-3.587665, -3.234641, 0, 1, 1.5, 0.5, 0.5,
-3.587665, -3.234641, 0, 0, 1.5, 0.5, 0.5,
-3.587665, -3.234641, 2, 0, -0.5, 0.5, 0.5,
-3.587665, -3.234641, 2, 1, -0.5, 0.5, 0.5,
-3.587665, -3.234641, 2, 1, 1.5, 0.5, 0.5,
-3.587665, -3.234641, 2, 0, 1.5, 0.5, 0.5,
-3.587665, -3.234641, 4, 0, -0.5, 0.5, 0.5,
-3.587665, -3.234641, 4, 1, -0.5, 0.5, 0.5,
-3.587665, -3.234641, 4, 1, 1.5, 0.5, 0.5,
-3.587665, -3.234641, 4, 0, 1.5, 0.5, 0.5
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
-3.120794, -2.794276, -5.558432,
-3.120794, 3.077254, -5.558432,
-3.120794, -2.794276, 5.650448,
-3.120794, 3.077254, 5.650448,
-3.120794, -2.794276, -5.558432,
-3.120794, -2.794276, 5.650448,
-3.120794, 3.077254, -5.558432,
-3.120794, 3.077254, 5.650448,
-3.120794, -2.794276, -5.558432,
3.104151, -2.794276, -5.558432,
-3.120794, -2.794276, 5.650448,
3.104151, -2.794276, 5.650448,
-3.120794, 3.077254, -5.558432,
3.104151, 3.077254, -5.558432,
-3.120794, 3.077254, 5.650448,
3.104151, 3.077254, 5.650448,
3.104151, -2.794276, -5.558432,
3.104151, 3.077254, -5.558432,
3.104151, -2.794276, 5.650448,
3.104151, 3.077254, 5.650448,
3.104151, -2.794276, -5.558432,
3.104151, -2.794276, 5.650448,
3.104151, 3.077254, -5.558432,
3.104151, 3.077254, 5.650448
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
var radius = 7.530144;
var distance = 33.50246;
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
mvMatrix.translate( 0.008321643, -0.1414886, -0.04600787 );
mvMatrix.scale( 1.307922, 1.386647, 0.7263651 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.50246);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
valine<-read.table("valine.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-valine$V2
```

```
## Error in eval(expr, envir, enclos): object 'valine' not found
```

```r
y<-valine$V3
```

```
## Error in eval(expr, envir, enclos): object 'valine' not found
```

```r
z<-valine$V4
```

```
## Error in eval(expr, envir, enclos): object 'valine' not found
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
-3.030139, 0.03545372, -2.641488, 0, 0, 1, 1, 1,
-3.020055, 0.3993159, -3.177444, 1, 0, 0, 1, 1,
-2.861154, 0.3968073, -0.7383881, 1, 0, 0, 1, 1,
-2.823897, 2.594658, -0.07048956, 1, 0, 0, 1, 1,
-2.664012, 1.365849, -0.5031067, 1, 0, 0, 1, 1,
-2.582053, -0.5750616, -1.409088, 1, 0, 0, 1, 1,
-2.536093, 0.9265215, -1.268471, 0, 0, 0, 1, 1,
-2.527885, 0.6107596, -1.360263, 0, 0, 0, 1, 1,
-2.446127, 0.2840871, -2.210731, 0, 0, 0, 1, 1,
-2.431137, -0.2268805, -2.929366, 0, 0, 0, 1, 1,
-2.372968, 0.5621988, -1.506388, 0, 0, 0, 1, 1,
-2.346374, 0.492555, -2.047957, 0, 0, 0, 1, 1,
-2.334002, -1.008228, -1.12039, 0, 0, 0, 1, 1,
-2.31972, 0.3575388, -2.91564, 1, 1, 1, 1, 1,
-2.290947, 1.170015, -1.67833, 1, 1, 1, 1, 1,
-2.245165, -1.82475, -2.80035, 1, 1, 1, 1, 1,
-2.229366, 0.1569113, -1.536318, 1, 1, 1, 1, 1,
-2.192559, -0.357761, -0.4966891, 1, 1, 1, 1, 1,
-2.17644, -1.139581, -1.611283, 1, 1, 1, 1, 1,
-2.164621, -0.3148526, -3.012553, 1, 1, 1, 1, 1,
-2.146135, -1.221666, -1.81054, 1, 1, 1, 1, 1,
-2.094599, -0.7157421, -3.018183, 1, 1, 1, 1, 1,
-2.08918, -0.1221152, -0.9873144, 1, 1, 1, 1, 1,
-2.067895, 1.532615, -1.044033, 1, 1, 1, 1, 1,
-2.04295, 0.4133798, -0.5941984, 1, 1, 1, 1, 1,
-2.039699, -0.04923261, -3.282995, 1, 1, 1, 1, 1,
-2.024641, 0.8312861, -2.0891, 1, 1, 1, 1, 1,
-2.023869, 1.109252, -0.9070647, 1, 1, 1, 1, 1,
-1.997618, -0.2187021, -1.745176, 0, 0, 1, 1, 1,
-1.987843, -0.1436357, -3.018594, 1, 0, 0, 1, 1,
-1.912189, 0.233848, -1.511129, 1, 0, 0, 1, 1,
-1.910855, -2.240215, -3.371848, 1, 0, 0, 1, 1,
-1.910742, 0.6810368, -0.8268514, 1, 0, 0, 1, 1,
-1.847457, 2.115309, 0.1460442, 1, 0, 0, 1, 1,
-1.842035, -1.310434, -1.870276, 0, 0, 0, 1, 1,
-1.824294, -0.7328638, -2.510087, 0, 0, 0, 1, 1,
-1.817889, 0.1559817, -0.9440143, 0, 0, 0, 1, 1,
-1.802342, -1.155393, -1.975364, 0, 0, 0, 1, 1,
-1.78016, 0.8211967, -1.843825, 0, 0, 0, 1, 1,
-1.765581, -0.2434024, -3.289589, 0, 0, 0, 1, 1,
-1.761295, 0.4925427, -4.131003, 0, 0, 0, 1, 1,
-1.757666, -0.4650582, -2.477628, 1, 1, 1, 1, 1,
-1.73243, -0.8305364, -0.3859378, 1, 1, 1, 1, 1,
-1.723057, -1.575677, -2.126742, 1, 1, 1, 1, 1,
-1.722556, 0.733296, -1.65897, 1, 1, 1, 1, 1,
-1.721055, -1.416706, -1.616458, 1, 1, 1, 1, 1,
-1.711116, 0.6017176, -1.962809, 1, 1, 1, 1, 1,
-1.709428, 0.7881895, -0.6707681, 1, 1, 1, 1, 1,
-1.700219, 0.5142505, -1.210716, 1, 1, 1, 1, 1,
-1.698197, 0.5106757, -0.02157011, 1, 1, 1, 1, 1,
-1.691018, 0.3198574, -1.698545, 1, 1, 1, 1, 1,
-1.690148, 0.09579034, -0.2738046, 1, 1, 1, 1, 1,
-1.682842, -0.04804519, -0.01524936, 1, 1, 1, 1, 1,
-1.680616, -0.8835226, -1.243464, 1, 1, 1, 1, 1,
-1.673477, 0.5820458, -2.592176, 1, 1, 1, 1, 1,
-1.64742, 2.310966, -1.528245, 1, 1, 1, 1, 1,
-1.643533, -1.06996, -0.8230703, 0, 0, 1, 1, 1,
-1.633216, 0.9462873, -2.192806, 1, 0, 0, 1, 1,
-1.633075, 0.9313285, 0.1170148, 1, 0, 0, 1, 1,
-1.631385, 0.6750998, -1.324683, 1, 0, 0, 1, 1,
-1.628833, 0.03015103, -2.262078, 1, 0, 0, 1, 1,
-1.62534, -0.5498118, -1.269322, 1, 0, 0, 1, 1,
-1.612226, -0.4352787, -0.1293644, 0, 0, 0, 1, 1,
-1.596606, 0.7922568, -0.7171011, 0, 0, 0, 1, 1,
-1.595738, 0.2908879, -1.857526, 0, 0, 0, 1, 1,
-1.592013, 2.905444, -0.6950644, 0, 0, 0, 1, 1,
-1.591643, 0.02130699, -1.406605, 0, 0, 0, 1, 1,
-1.573483, -0.1491875, -1.327252, 0, 0, 0, 1, 1,
-1.571142, -0.81146, -1.932167, 0, 0, 0, 1, 1,
-1.567585, 0.4212184, 0.6245015, 1, 1, 1, 1, 1,
-1.562198, -1.237993, -3.707674, 1, 1, 1, 1, 1,
-1.557754, 0.36305, -1.673954, 1, 1, 1, 1, 1,
-1.546513, -0.2849945, 0.2226101, 1, 1, 1, 1, 1,
-1.546286, -1.101571, -1.678515, 1, 1, 1, 1, 1,
-1.543571, -0.05176732, -0.2138653, 1, 1, 1, 1, 1,
-1.522409, 0.452596, -3.129804, 1, 1, 1, 1, 1,
-1.519058, -1.146444, -2.120216, 1, 1, 1, 1, 1,
-1.513046, -0.6136661, -3.122081, 1, 1, 1, 1, 1,
-1.497369, 0.3063078, -1.044273, 1, 1, 1, 1, 1,
-1.480725, 0.488123, -2.337485, 1, 1, 1, 1, 1,
-1.471143, 0.8758444, -4.378992, 1, 1, 1, 1, 1,
-1.459421, -0.000192872, -0.9044635, 1, 1, 1, 1, 1,
-1.45929, 0.05995044, -2.556981, 1, 1, 1, 1, 1,
-1.457844, -0.2293912, -3.418479, 1, 1, 1, 1, 1,
-1.444068, -1.647241, -2.913867, 0, 0, 1, 1, 1,
-1.443189, -0.8249921, -2.807191, 1, 0, 0, 1, 1,
-1.410033, 1.879872, -0.7505992, 1, 0, 0, 1, 1,
-1.402579, -0.6480101, -2.087651, 1, 0, 0, 1, 1,
-1.386849, 0.5875744, -1.513703, 1, 0, 0, 1, 1,
-1.383379, 1.321797, -0.7168453, 1, 0, 0, 1, 1,
-1.374949, 1.570694, -1.048259, 0, 0, 0, 1, 1,
-1.360112, -0.2580045, -4.310683, 0, 0, 0, 1, 1,
-1.354238, -0.09541953, -1.636033, 0, 0, 0, 1, 1,
-1.344082, 0.0473199, -2.568069, 0, 0, 0, 1, 1,
-1.343665, -0.1274138, -2.982234, 0, 0, 0, 1, 1,
-1.336198, -0.5779528, -3.828992, 0, 0, 0, 1, 1,
-1.334299, 0.8030009, -1.623751, 0, 0, 0, 1, 1,
-1.331058, -0.2108812, -1.147589, 1, 1, 1, 1, 1,
-1.330235, 2.218407, -2.161431, 1, 1, 1, 1, 1,
-1.32702, 0.7332218, -3.092736, 1, 1, 1, 1, 1,
-1.319012, 0.03535631, -3.260584, 1, 1, 1, 1, 1,
-1.318652, 1.015886, -1.44479, 1, 1, 1, 1, 1,
-1.315419, -0.6199793, -1.791721, 1, 1, 1, 1, 1,
-1.312974, -1.160875, -0.5533642, 1, 1, 1, 1, 1,
-1.30291, -0.3119801, -1.423686, 1, 1, 1, 1, 1,
-1.300863, -1.588897, -4.148884, 1, 1, 1, 1, 1,
-1.299775, 0.0474124, -2.150542, 1, 1, 1, 1, 1,
-1.296603, 0.5664184, -3.361285, 1, 1, 1, 1, 1,
-1.269883, 0.8948749, -1.57876, 1, 1, 1, 1, 1,
-1.269114, 0.1440593, -1.521665, 1, 1, 1, 1, 1,
-1.265508, 1.12119, -1.987022, 1, 1, 1, 1, 1,
-1.262336, 0.3585775, -2.488298, 1, 1, 1, 1, 1,
-1.251206, 0.1137612, -0.6587175, 0, 0, 1, 1, 1,
-1.250395, 0.01688896, -2.691263, 1, 0, 0, 1, 1,
-1.245872, 0.1594644, -0.4513626, 1, 0, 0, 1, 1,
-1.243193, 0.02412831, -1.896952, 1, 0, 0, 1, 1,
-1.24286, 0.3053868, -2.813594, 1, 0, 0, 1, 1,
-1.241454, -0.2152762, -0.4582479, 1, 0, 0, 1, 1,
-1.236864, -0.8690283, -1.845426, 0, 0, 0, 1, 1,
-1.22567, -0.07036285, -1.656167, 0, 0, 0, 1, 1,
-1.211818, 0.6218088, -1.100869, 0, 0, 0, 1, 1,
-1.202469, 0.2520525, -0.3852754, 0, 0, 0, 1, 1,
-1.200524, -1.931979, -1.058849, 0, 0, 0, 1, 1,
-1.196648, -0.6053864, -0.3133406, 0, 0, 0, 1, 1,
-1.193371, 0.135867, -2.056463, 0, 0, 0, 1, 1,
-1.19194, -0.05138709, -0.805031, 1, 1, 1, 1, 1,
-1.190354, -0.3302781, -3.723571, 1, 1, 1, 1, 1,
-1.189927, 0.2927645, -2.276313, 1, 1, 1, 1, 1,
-1.188835, -0.5043761, -1.728473, 1, 1, 1, 1, 1,
-1.18776, 0.7002464, -0.4382681, 1, 1, 1, 1, 1,
-1.185319, 0.8629618, -1.244488, 1, 1, 1, 1, 1,
-1.184055, -1.123169, -2.906978, 1, 1, 1, 1, 1,
-1.182606, -0.5081173, -1.06943, 1, 1, 1, 1, 1,
-1.171921, -0.4327657, -2.46327, 1, 1, 1, 1, 1,
-1.164479, -0.006564682, -1.583807, 1, 1, 1, 1, 1,
-1.158983, 0.600862, -1.551887, 1, 1, 1, 1, 1,
-1.157949, 0.3698797, -2.256622, 1, 1, 1, 1, 1,
-1.147925, -1.103746, -2.634343, 1, 1, 1, 1, 1,
-1.147305, -0.7543826, -2.022497, 1, 1, 1, 1, 1,
-1.139637, 0.7738997, -2.553265, 1, 1, 1, 1, 1,
-1.136548, 0.4103036, -0.3088751, 0, 0, 1, 1, 1,
-1.131952, -0.8229676, -0.9878253, 1, 0, 0, 1, 1,
-1.127537, -0.8839919, -3.699896, 1, 0, 0, 1, 1,
-1.121751, 0.2511995, -0.567087, 1, 0, 0, 1, 1,
-1.106182, -0.3835133, -2.858472, 1, 0, 0, 1, 1,
-1.103505, 0.4031119, -2.525574, 1, 0, 0, 1, 1,
-1.093341, -1.500367, -1.611912, 0, 0, 0, 1, 1,
-1.092765, -1.092951, -3.850486, 0, 0, 0, 1, 1,
-1.089703, 1.213775, -0.5239713, 0, 0, 0, 1, 1,
-1.08714, -0.74658, -2.15011, 0, 0, 0, 1, 1,
-1.085009, -0.4045824, -2.377277, 0, 0, 0, 1, 1,
-1.082152, 0.5756185, -2.540252, 0, 0, 0, 1, 1,
-1.079054, -1.638676, -4.525936, 0, 0, 0, 1, 1,
-1.077849, -1.721776, -2.540828, 1, 1, 1, 1, 1,
-1.076038, -0.2182484, -1.970256, 1, 1, 1, 1, 1,
-1.072643, 1.216512, -1.600968, 1, 1, 1, 1, 1,
-1.061417, -1.811224, -4.044702, 1, 1, 1, 1, 1,
-1.059856, 1.756763, 1.396424, 1, 1, 1, 1, 1,
-1.059366, -1.108229, -2.187546, 1, 1, 1, 1, 1,
-1.050977, -0.7840718, -1.603509, 1, 1, 1, 1, 1,
-1.048757, 0.2417008, -2.298673, 1, 1, 1, 1, 1,
-1.0475, -0.6115472, -2.081449, 1, 1, 1, 1, 1,
-1.045049, -0.0827816, -0.7566278, 1, 1, 1, 1, 1,
-1.037583, -0.6603274, -1.10173, 1, 1, 1, 1, 1,
-1.035861, 1.749586, -1.915797, 1, 1, 1, 1, 1,
-1.035164, 0.2338578, -0.9011185, 1, 1, 1, 1, 1,
-1.034078, 0.4340167, -1.752062, 1, 1, 1, 1, 1,
-1.03323, -0.5829582, -2.694754, 1, 1, 1, 1, 1,
-1.031707, -1.299432, -3.42855, 0, 0, 1, 1, 1,
-1.03162, 1.299163, -0.8782302, 1, 0, 0, 1, 1,
-1.031282, -2.176447, -3.921236, 1, 0, 0, 1, 1,
-1.024378, -0.6615205, -2.610738, 1, 0, 0, 1, 1,
-1.023921, -0.1855617, -0.8466146, 1, 0, 0, 1, 1,
-1.020661, 0.6403418, -1.77587, 1, 0, 0, 1, 1,
-1.019181, 2.588195, -0.3890811, 0, 0, 0, 1, 1,
-1.018127, -0.7317596, -0.8844881, 0, 0, 0, 1, 1,
-1.012203, -1.452382, -1.520124, 0, 0, 0, 1, 1,
-1.005971, 0.1501356, -2.152447, 0, 0, 0, 1, 1,
-1.002653, 1.754725, 0.2543042, 0, 0, 0, 1, 1,
-0.9989623, 0.2020198, -2.014846, 0, 0, 0, 1, 1,
-0.98702, 0.8834387, -0.5622932, 0, 0, 0, 1, 1,
-0.9752611, 0.869276, -0.9793583, 1, 1, 1, 1, 1,
-0.9695253, 1.021598, -1.237151, 1, 1, 1, 1, 1,
-0.9574167, 1.16005, -1.991037, 1, 1, 1, 1, 1,
-0.9513706, 1.157594, -2.661674, 1, 1, 1, 1, 1,
-0.9499801, 0.09346439, -0.8297427, 1, 1, 1, 1, 1,
-0.9496035, 0.2993874, -2.845302, 1, 1, 1, 1, 1,
-0.9441769, 0.2631902, -1.499169, 1, 1, 1, 1, 1,
-0.9418367, 1.4292, -0.819083, 1, 1, 1, 1, 1,
-0.9411141, -0.1000544, -2.250395, 1, 1, 1, 1, 1,
-0.9382723, 0.05308878, -0.9879355, 1, 1, 1, 1, 1,
-0.936988, 1.116004, -0.8776649, 1, 1, 1, 1, 1,
-0.9347374, 0.5198578, -1.598597, 1, 1, 1, 1, 1,
-0.9345492, 1.05979, -1.419354, 1, 1, 1, 1, 1,
-0.932489, 1.519874, -0.7078317, 1, 1, 1, 1, 1,
-0.9289227, 0.3667971, -1.583029, 1, 1, 1, 1, 1,
-0.9239479, -0.1296944, -0.6224357, 0, 0, 1, 1, 1,
-0.9230016, 0.3811571, -2.610707, 1, 0, 0, 1, 1,
-0.922771, -0.03075299, -0.5854408, 1, 0, 0, 1, 1,
-0.9160131, -0.9332749, -2.031805, 1, 0, 0, 1, 1,
-0.9071091, -1.00318, -1.950187, 1, 0, 0, 1, 1,
-0.9060568, 0.344763, -1.790088, 1, 0, 0, 1, 1,
-0.9058518, -1.546071, -0.2809508, 0, 0, 0, 1, 1,
-0.9028774, 0.7171569, -0.4553427, 0, 0, 0, 1, 1,
-0.9023153, -0.6626214, -1.255661, 0, 0, 0, 1, 1,
-0.9006458, 0.4945584, -1.133301, 0, 0, 0, 1, 1,
-0.8997331, -1.209787, -1.834242, 0, 0, 0, 1, 1,
-0.892453, -0.04544555, -1.007477, 0, 0, 0, 1, 1,
-0.8861035, -0.7378178, -1.545846, 0, 0, 0, 1, 1,
-0.8859911, 1.947059, -0.2836328, 1, 1, 1, 1, 1,
-0.8816953, -0.1715637, -2.249029, 1, 1, 1, 1, 1,
-0.8811554, 0.4120267, -1.108306, 1, 1, 1, 1, 1,
-0.8780314, -0.2350785, -2.443249, 1, 1, 1, 1, 1,
-0.8777826, 0.06464804, -1.322105, 1, 1, 1, 1, 1,
-0.8658679, -0.9058426, -0.7888344, 1, 1, 1, 1, 1,
-0.8650222, -0.9758359, -2.637293, 1, 1, 1, 1, 1,
-0.8570445, 0.110592, -0.2816767, 1, 1, 1, 1, 1,
-0.8550618, 0.4255471, 0.8072067, 1, 1, 1, 1, 1,
-0.8531569, 0.3399219, -0.9175733, 1, 1, 1, 1, 1,
-0.8510433, 0.3210377, -0.4737442, 1, 1, 1, 1, 1,
-0.8412335, -1.969572, -4.481702, 1, 1, 1, 1, 1,
-0.8394961, -0.197947, -1.743764, 1, 1, 1, 1, 1,
-0.831048, -0.9190003, -3.773647, 1, 1, 1, 1, 1,
-0.8306358, -0.8599132, -2.050643, 1, 1, 1, 1, 1,
-0.8306245, 0.1688665, -1.043753, 0, 0, 1, 1, 1,
-0.8301899, -0.4308016, -3.304583, 1, 0, 0, 1, 1,
-0.8296986, 0.08241871, -1.070127, 1, 0, 0, 1, 1,
-0.8288609, 0.7251961, -1.675271, 1, 0, 0, 1, 1,
-0.8236263, -0.05172563, -0.6189016, 1, 0, 0, 1, 1,
-0.8193291, 1.958279, -3.22981, 1, 0, 0, 1, 1,
-0.8184505, 1.804531, 0.4716165, 0, 0, 0, 1, 1,
-0.816895, 0.7905329, -1.231909, 0, 0, 0, 1, 1,
-0.8166724, 0.8408389, -0.08791362, 0, 0, 0, 1, 1,
-0.8165178, 1.368977, -0.01772798, 0, 0, 0, 1, 1,
-0.8138335, -1.466025, -2.349329, 0, 0, 0, 1, 1,
-0.803295, 0.3712126, -1.57896, 0, 0, 0, 1, 1,
-0.8013711, -0.1217851, -2.756096, 0, 0, 0, 1, 1,
-0.799786, -0.04237923, -1.85619, 1, 1, 1, 1, 1,
-0.7996194, -0.8599029, -1.098589, 1, 1, 1, 1, 1,
-0.799088, -0.2145652, -0.4451985, 1, 1, 1, 1, 1,
-0.7978992, 0.4970305, -0.5875895, 1, 1, 1, 1, 1,
-0.7965717, -0.7178675, -1.239613, 1, 1, 1, 1, 1,
-0.795792, 1.411611, -1.260999, 1, 1, 1, 1, 1,
-0.7909571, -1.521772, -4.17683, 1, 1, 1, 1, 1,
-0.7744956, -0.4941725, -0.3565215, 1, 1, 1, 1, 1,
-0.7715339, -0.6270553, -2.637598, 1, 1, 1, 1, 1,
-0.7713616, -1.276849, -2.700469, 1, 1, 1, 1, 1,
-0.7673793, 0.1165996, -3.011422, 1, 1, 1, 1, 1,
-0.767179, 0.6214488, -1.125074, 1, 1, 1, 1, 1,
-0.7620328, -1.594235, -2.943646, 1, 1, 1, 1, 1,
-0.7547972, -0.5463777, -2.743, 1, 1, 1, 1, 1,
-0.7546583, 0.7408015, -0.1807349, 1, 1, 1, 1, 1,
-0.7524332, -1.820166, -2.757059, 0, 0, 1, 1, 1,
-0.7467135, -0.6549621, -0.8466614, 1, 0, 0, 1, 1,
-0.7399113, -0.2608387, -2.812459, 1, 0, 0, 1, 1,
-0.7356198, 0.6502866, -0.2343061, 1, 0, 0, 1, 1,
-0.7344919, -0.4181178, -2.230287, 1, 0, 0, 1, 1,
-0.7301369, -0.6886395, -1.76923, 1, 0, 0, 1, 1,
-0.7297148, -0.2829846, -2.5709, 0, 0, 0, 1, 1,
-0.7243553, 0.5172893, -1.074273, 0, 0, 0, 1, 1,
-0.7219639, 0.2688793, -0.9543361, 0, 0, 0, 1, 1,
-0.717618, -0.4258221, -5.395196, 0, 0, 0, 1, 1,
-0.7164128, -0.4286902, -0.1710419, 0, 0, 0, 1, 1,
-0.7014158, -2.245324, -1.970145, 0, 0, 0, 1, 1,
-0.6992571, 0.06248579, -2.950202, 0, 0, 0, 1, 1,
-0.6983463, 0.9777625, 0.4615181, 1, 1, 1, 1, 1,
-0.6945611, -0.9668428, -3.485782, 1, 1, 1, 1, 1,
-0.6916382, -0.3778999, -3.891807, 1, 1, 1, 1, 1,
-0.6773888, -0.5663341, -1.84284, 1, 1, 1, 1, 1,
-0.6758683, -0.72434, -3.623605, 1, 1, 1, 1, 1,
-0.6747506, -0.03767843, 0.3610163, 1, 1, 1, 1, 1,
-0.6686207, -0.4422805, -3.104163, 1, 1, 1, 1, 1,
-0.6681802, 0.8350065, -2.003223, 1, 1, 1, 1, 1,
-0.6566094, 1.699841, -1.585577, 1, 1, 1, 1, 1,
-0.6561657, 0.1691466, -0.7182147, 1, 1, 1, 1, 1,
-0.6535627, -1.101967, -1.919591, 1, 1, 1, 1, 1,
-0.6528296, -0.2346193, -2.275203, 1, 1, 1, 1, 1,
-0.6512723, -0.590279, -4.035951, 1, 1, 1, 1, 1,
-0.6511201, -0.4280391, -1.811069, 1, 1, 1, 1, 1,
-0.6509631, -0.3009136, -3.548657, 1, 1, 1, 1, 1,
-0.6501273, -0.6671484, -2.275407, 0, 0, 1, 1, 1,
-0.6470225, 0.6093062, -1.548505, 1, 0, 0, 1, 1,
-0.6464472, -1.661983, -2.674687, 1, 0, 0, 1, 1,
-0.6415, 0.1488411, -0.6495824, 1, 0, 0, 1, 1,
-0.6404631, -1.140592, -2.478186, 1, 0, 0, 1, 1,
-0.6369888, -0.9600743, -1.313878, 1, 0, 0, 1, 1,
-0.630483, -1.774907, -2.010086, 0, 0, 0, 1, 1,
-0.6260042, 1.658325, -1.668259, 0, 0, 0, 1, 1,
-0.6221044, -1.1077, -4.259781, 0, 0, 0, 1, 1,
-0.6220051, -0.4779292, -2.635639, 0, 0, 0, 1, 1,
-0.6203979, 0.2091046, -1.123316, 0, 0, 0, 1, 1,
-0.6098956, 1.933014, 0.03385546, 0, 0, 0, 1, 1,
-0.6089347, -0.02557648, 0.1713261, 0, 0, 0, 1, 1,
-0.6073452, -0.5825605, -2.252924, 1, 1, 1, 1, 1,
-0.6073295, 0.08487535, 0.5587362, 1, 1, 1, 1, 1,
-0.6007054, 2.449604, -1.554918, 1, 1, 1, 1, 1,
-0.59625, -0.8827484, -3.317454, 1, 1, 1, 1, 1,
-0.5919923, -0.341683, -2.602099, 1, 1, 1, 1, 1,
-0.5915715, -0.6982642, -3.983741, 1, 1, 1, 1, 1,
-0.587391, -0.3292487, -1.312343, 1, 1, 1, 1, 1,
-0.5853416, 0.7488768, 0.7342893, 1, 1, 1, 1, 1,
-0.5837989, -0.2969747, -1.357878, 1, 1, 1, 1, 1,
-0.5834992, -0.2587293, -3.353352, 1, 1, 1, 1, 1,
-0.5778547, 1.141038, -1.917035, 1, 1, 1, 1, 1,
-0.5738924, 0.09360612, -0.888876, 1, 1, 1, 1, 1,
-0.5712564, 1.489814, 0.3144165, 1, 1, 1, 1, 1,
-0.5701396, 1.81957, -2.132666, 1, 1, 1, 1, 1,
-0.5680332, 1.26462, -0.2140967, 1, 1, 1, 1, 1,
-0.5667854, 0.1636601, -2.096926, 0, 0, 1, 1, 1,
-0.5571495, -0.3030334, 0.2900165, 1, 0, 0, 1, 1,
-0.5551335, -0.1189642, -1.584534, 1, 0, 0, 1, 1,
-0.5535792, -0.04262432, -0.9639595, 1, 0, 0, 1, 1,
-0.5477546, -0.04499, -2.333972, 1, 0, 0, 1, 1,
-0.5472685, 0.1291105, -0.9403225, 1, 0, 0, 1, 1,
-0.5451166, -0.8352032, -2.831918, 0, 0, 0, 1, 1,
-0.5440719, -0.1080123, -1.641833, 0, 0, 0, 1, 1,
-0.5361493, 0.3724623, 0.7810651, 0, 0, 0, 1, 1,
-0.5356953, 1.294161, -1.881448, 0, 0, 0, 1, 1,
-0.531072, 0.6181881, 0.6739888, 0, 0, 0, 1, 1,
-0.5290113, -0.8232478, -1.065344, 0, 0, 0, 1, 1,
-0.5233289, -0.5824668, -2.589187, 0, 0, 0, 1, 1,
-0.5204782, 0.6939492, 0.7926582, 1, 1, 1, 1, 1,
-0.5196005, 0.6233578, -0.6405665, 1, 1, 1, 1, 1,
-0.5179111, 0.1230784, -0.9429022, 1, 1, 1, 1, 1,
-0.5153997, 0.1886185, -2.287542, 1, 1, 1, 1, 1,
-0.514069, -0.8308515, -2.000635, 1, 1, 1, 1, 1,
-0.5114226, -0.5932484, -2.951499, 1, 1, 1, 1, 1,
-0.511116, -0.8872786, -3.712033, 1, 1, 1, 1, 1,
-0.5068949, 0.6885512, 0.5492157, 1, 1, 1, 1, 1,
-0.5048723, -0.1317756, -0.4940138, 1, 1, 1, 1, 1,
-0.5016531, 0.4656675, -0.1209154, 1, 1, 1, 1, 1,
-0.4991818, 0.6579043, -0.1368392, 1, 1, 1, 1, 1,
-0.4942985, -0.3803573, -2.107866, 1, 1, 1, 1, 1,
-0.4898477, 0.3285162, -0.6951476, 1, 1, 1, 1, 1,
-0.4796189, -0.3755825, -1.795197, 1, 1, 1, 1, 1,
-0.4746563, -1.368616, -0.8727484, 1, 1, 1, 1, 1,
-0.4723843, 0.2829286, 0.1965168, 0, 0, 1, 1, 1,
-0.4686584, 0.08887246, -0.5907449, 1, 0, 0, 1, 1,
-0.4669528, 1.971558, -0.5318303, 1, 0, 0, 1, 1,
-0.4658338, -0.6418328, -1.197263, 1, 0, 0, 1, 1,
-0.4641297, -1.056615, -1.554277, 1, 0, 0, 1, 1,
-0.4608124, -0.05055205, -2.49758, 1, 0, 0, 1, 1,
-0.4574853, 1.081093, 1.320253, 0, 0, 0, 1, 1,
-0.4557623, -0.1761414, -1.114582, 0, 0, 0, 1, 1,
-0.4528831, 0.6035666, -0.2358235, 0, 0, 0, 1, 1,
-0.4507538, 1.308177, -0.3516374, 0, 0, 0, 1, 1,
-0.4459905, -0.6534771, -1.476342, 0, 0, 0, 1, 1,
-0.4401026, -1.447974, -2.872014, 0, 0, 0, 1, 1,
-0.4371725, -0.9332975, -2.251649, 0, 0, 0, 1, 1,
-0.4349238, -0.9731318, -1.91406, 1, 1, 1, 1, 1,
-0.4321331, 0.0694889, -1.417179, 1, 1, 1, 1, 1,
-0.4315265, -0.09053303, -0.5136765, 1, 1, 1, 1, 1,
-0.4310971, -1.084794, -2.536307, 1, 1, 1, 1, 1,
-0.4309153, -0.4886429, -3.845749, 1, 1, 1, 1, 1,
-0.4299702, -0.1469985, -1.66135, 1, 1, 1, 1, 1,
-0.4291754, 0.159458, -1.109816, 1, 1, 1, 1, 1,
-0.4270169, -1.625748, -1.800646, 1, 1, 1, 1, 1,
-0.4250519, 0.9994735, 0.5879002, 1, 1, 1, 1, 1,
-0.4210598, 0.959864, -0.8374349, 1, 1, 1, 1, 1,
-0.4204173, 0.5207989, -1.411025, 1, 1, 1, 1, 1,
-0.41466, 0.4727374, -1.614906, 1, 1, 1, 1, 1,
-0.4145416, -0.7430555, -3.065189, 1, 1, 1, 1, 1,
-0.4100273, -0.5373583, -3.107341, 1, 1, 1, 1, 1,
-0.4097681, 0.1475223, 0.2241021, 1, 1, 1, 1, 1,
-0.4073676, -1.18356, -2.500247, 0, 0, 1, 1, 1,
-0.4038994, -0.3023582, -2.166785, 1, 0, 0, 1, 1,
-0.4013308, 2.541257, 0.3441924, 1, 0, 0, 1, 1,
-0.4012216, -0.2878605, -3.180821, 1, 0, 0, 1, 1,
-0.3991718, -0.7727951, -3.139942, 1, 0, 0, 1, 1,
-0.3964938, -1.644354, -3.287732, 1, 0, 0, 1, 1,
-0.3953971, -0.3508091, -0.6117588, 0, 0, 0, 1, 1,
-0.3920251, 0.3381293, -0.933427, 0, 0, 0, 1, 1,
-0.3915279, 0.3886026, 0.1278609, 0, 0, 0, 1, 1,
-0.3874467, 0.8705876, -0.1317817, 0, 0, 0, 1, 1,
-0.3852386, 0.8637975, 1.011517, 0, 0, 0, 1, 1,
-0.3820243, -1.043927, -1.317114, 0, 0, 0, 1, 1,
-0.3805591, -0.1240778, -2.122005, 0, 0, 0, 1, 1,
-0.3797675, -0.04839975, -1.09382, 1, 1, 1, 1, 1,
-0.3780709, -1.16406, -2.751511, 1, 1, 1, 1, 1,
-0.3740534, 0.7237062, 1.288873, 1, 1, 1, 1, 1,
-0.3702365, 0.4102885, -2.553148, 1, 1, 1, 1, 1,
-0.367596, -0.06757855, -2.529564, 1, 1, 1, 1, 1,
-0.3660225, -0.05819961, -2.30787, 1, 1, 1, 1, 1,
-0.3656484, -0.5914134, -4.570724, 1, 1, 1, 1, 1,
-0.3475343, -0.7964322, -0.9130822, 1, 1, 1, 1, 1,
-0.3433219, 0.901448, 0.805821, 1, 1, 1, 1, 1,
-0.3389286, -0.3360034, -2.742134, 1, 1, 1, 1, 1,
-0.338045, 1.450831, 1.950538, 1, 1, 1, 1, 1,
-0.3328519, 0.2660319, -2.68008, 1, 1, 1, 1, 1,
-0.3280149, -0.6631774, -2.297626, 1, 1, 1, 1, 1,
-0.3205094, 1.814812, 0.6456222, 1, 1, 1, 1, 1,
-0.3152453, -0.1635098, -3.159355, 1, 1, 1, 1, 1,
-0.313119, 0.8653863, 0.0008432514, 0, 0, 1, 1, 1,
-0.3117443, 0.2920546, -1.519691, 1, 0, 0, 1, 1,
-0.2965469, -0.08883545, -2.204321, 1, 0, 0, 1, 1,
-0.2929267, -0.1065586, -3.421443, 1, 0, 0, 1, 1,
-0.291839, -0.06765931, -2.052873, 1, 0, 0, 1, 1,
-0.290826, -1.032187, -3.561682, 1, 0, 0, 1, 1,
-0.2876524, -1.200391, -3.567661, 0, 0, 0, 1, 1,
-0.2801912, -1.240621, -3.356888, 0, 0, 0, 1, 1,
-0.2792562, -0.4657181, -2.588614, 0, 0, 0, 1, 1,
-0.2754254, 1.095687, -0.9436568, 0, 0, 0, 1, 1,
-0.273371, 1.075524, 0.4247063, 0, 0, 0, 1, 1,
-0.2646686, 0.4424841, 0.3143707, 0, 0, 0, 1, 1,
-0.2629153, -0.5515215, -3.830328, 0, 0, 0, 1, 1,
-0.2615999, -1.488099, -1.789678, 1, 1, 1, 1, 1,
-0.2606797, 0.68719, 0.02229807, 1, 1, 1, 1, 1,
-0.2583239, 0.1719283, -0.8333843, 1, 1, 1, 1, 1,
-0.257486, 1.169047, -1.313341, 1, 1, 1, 1, 1,
-0.2556551, 1.214402, -1.151353, 1, 1, 1, 1, 1,
-0.2476491, 1.722795, -1.007968, 1, 1, 1, 1, 1,
-0.2473114, -0.2916396, -3.97834, 1, 1, 1, 1, 1,
-0.2453437, 1.247908, -0.2611726, 1, 1, 1, 1, 1,
-0.2451774, -0.1388492, -2.896568, 1, 1, 1, 1, 1,
-0.243881, -0.0627917, -2.258877, 1, 1, 1, 1, 1,
-0.2432664, -0.3714756, -2.922102, 1, 1, 1, 1, 1,
-0.238708, -1.02874, -5.130439, 1, 1, 1, 1, 1,
-0.2383984, 0.4355013, -0.3278574, 1, 1, 1, 1, 1,
-0.2352581, 0.084108, -1.767406, 1, 1, 1, 1, 1,
-0.2313596, -0.7633073, -2.528486, 1, 1, 1, 1, 1,
-0.2310597, 1.151251, 1.256061, 0, 0, 1, 1, 1,
-0.229425, 2.585904, -0.6666532, 1, 0, 0, 1, 1,
-0.2244767, 1.514244, 1.285296, 1, 0, 0, 1, 1,
-0.2195998, 0.7016751, -0.3976135, 1, 0, 0, 1, 1,
-0.215095, -0.2037691, -1.816411, 1, 0, 0, 1, 1,
-0.2051836, 0.01065571, -0.6706889, 1, 0, 0, 1, 1,
-0.2039525, 1.499974, 1.712445, 0, 0, 0, 1, 1,
-0.2036702, 0.6914794, 1.044242, 0, 0, 0, 1, 1,
-0.203096, -0.1464744, -1.974758, 0, 0, 0, 1, 1,
-0.2009132, 1.27196, 0.7068818, 0, 0, 0, 1, 1,
-0.198838, 0.8541375, -0.6606785, 0, 0, 0, 1, 1,
-0.1979583, 1.186554, 0.8728836, 0, 0, 0, 1, 1,
-0.1942924, -1.377569, -2.642468, 0, 0, 0, 1, 1,
-0.1933319, -1.265011, -2.752358, 1, 1, 1, 1, 1,
-0.1930295, -1.320128, -4.558547, 1, 1, 1, 1, 1,
-0.1900131, -0.2901418, -2.033475, 1, 1, 1, 1, 1,
-0.1894282, 0.1630143, -0.917986, 1, 1, 1, 1, 1,
-0.1882404, -1.261242, -2.302704, 1, 1, 1, 1, 1,
-0.1879429, 0.2164132, -1.486487, 1, 1, 1, 1, 1,
-0.1857298, 0.2631699, -0.7401927, 1, 1, 1, 1, 1,
-0.1855397, -1.108591, -1.222208, 1, 1, 1, 1, 1,
-0.1851364, -0.888773, -1.944171, 1, 1, 1, 1, 1,
-0.1824381, 1.571478, -0.06968744, 1, 1, 1, 1, 1,
-0.1824189, -1.080913, -3.709618, 1, 1, 1, 1, 1,
-0.1794122, 0.091308, -0.9247197, 1, 1, 1, 1, 1,
-0.1792398, 0.04219854, -3.491422, 1, 1, 1, 1, 1,
-0.1741897, -0.1570021, 0.3921783, 1, 1, 1, 1, 1,
-0.1668303, 0.5895284, 0.1446545, 1, 1, 1, 1, 1,
-0.1634391, 0.917994, -0.6585839, 0, 0, 1, 1, 1,
-0.1558583, 1.490825, -2.37981, 1, 0, 0, 1, 1,
-0.1541379, 0.03099765, 0.3254081, 1, 0, 0, 1, 1,
-0.1527445, -0.3139252, -3.243504, 1, 0, 0, 1, 1,
-0.1520313, -0.02914969, -2.208067, 1, 0, 0, 1, 1,
-0.1498376, 1.460892, 0.4034928, 1, 0, 0, 1, 1,
-0.1491136, -0.1303016, -3.474764, 0, 0, 0, 1, 1,
-0.1455505, -0.03434404, -1.191269, 0, 0, 0, 1, 1,
-0.1439092, -0.8079956, -3.633157, 0, 0, 0, 1, 1,
-0.1391149, -0.7540284, -3.712379, 0, 0, 0, 1, 1,
-0.1388488, 0.3155289, 0.5036276, 0, 0, 0, 1, 1,
-0.1383425, -1.856034, -1.992357, 0, 0, 0, 1, 1,
-0.1354248, -0.3192762, -3.101963, 0, 0, 0, 1, 1,
-0.1329961, -0.6459867, -1.946438, 1, 1, 1, 1, 1,
-0.1255366, 0.6800035, 0.9232516, 1, 1, 1, 1, 1,
-0.1236697, -0.7737283, -1.996963, 1, 1, 1, 1, 1,
-0.1226956, -1.28511, -1.277941, 1, 1, 1, 1, 1,
-0.1223035, 0.4517812, 0.5724848, 1, 1, 1, 1, 1,
-0.1221423, 1.479646, 0.4486754, 1, 1, 1, 1, 1,
-0.118031, -1.775673, -3.771592, 1, 1, 1, 1, 1,
-0.1169131, -0.9258182, -1.384369, 1, 1, 1, 1, 1,
-0.107333, -0.2062926, -3.439542, 1, 1, 1, 1, 1,
-0.1061931, -0.1363622, -1.155892, 1, 1, 1, 1, 1,
-0.1017429, -0.6251388, -2.349159, 1, 1, 1, 1, 1,
-0.09644602, -1.094764, -4.579674, 1, 1, 1, 1, 1,
-0.09499356, -0.53685, -4.771482, 1, 1, 1, 1, 1,
-0.08861391, 0.5129559, -0.7400869, 1, 1, 1, 1, 1,
-0.08267108, -0.8481775, -4.09509, 1, 1, 1, 1, 1,
-0.0808888, -1.760257, -4.291421, 0, 0, 1, 1, 1,
-0.07242891, 0.6906566, 0.4336734, 1, 0, 0, 1, 1,
-0.07079997, -0.4229005, -1.745475, 1, 0, 0, 1, 1,
-0.06979868, -0.8435736, -3.409386, 1, 0, 0, 1, 1,
-0.06825358, -1.380123, -2.565366, 1, 0, 0, 1, 1,
-0.0663014, -0.8759118, -4.65117, 1, 0, 0, 1, 1,
-0.0656017, -1.71555, -3.693663, 0, 0, 0, 1, 1,
-0.0621289, -0.2659836, -2.398366, 0, 0, 0, 1, 1,
-0.05796944, -0.3922614, -4.543113, 0, 0, 0, 1, 1,
-0.0546358, -1.103518, -4.259212, 0, 0, 0, 1, 1,
-0.0545204, 0.166712, 0.6072422, 0, 0, 0, 1, 1,
-0.05261346, -0.7271445, -4.283745, 0, 0, 0, 1, 1,
-0.0514172, -0.527433, -1.588118, 0, 0, 0, 1, 1,
-0.0499676, 0.1353202, -0.5404414, 1, 1, 1, 1, 1,
-0.04570623, -0.8838463, -3.928127, 1, 1, 1, 1, 1,
-0.04562165, 0.7332572, -0.5915273, 1, 1, 1, 1, 1,
-0.03914637, -0.895398, -2.991766, 1, 1, 1, 1, 1,
-0.03821934, -0.551195, -2.446735, 1, 1, 1, 1, 1,
-0.03532719, -0.3928785, -4.387846, 1, 1, 1, 1, 1,
-0.02961581, 0.7361398, -1.222022, 1, 1, 1, 1, 1,
-0.02958875, 0.6529845, 0.09157845, 1, 1, 1, 1, 1,
-0.02304599, -1.004377, -3.562021, 1, 1, 1, 1, 1,
-0.01762439, -0.6882798, -2.100941, 1, 1, 1, 1, 1,
-0.01696411, -1.331133, -3.671322, 1, 1, 1, 1, 1,
-0.0149585, -0.226354, -3.247205, 1, 1, 1, 1, 1,
-0.01467991, -1.704994, -4.422987, 1, 1, 1, 1, 1,
-0.01449714, 0.2007782, 0.08728527, 1, 1, 1, 1, 1,
-0.01127784, 0.2405546, 1.133832, 1, 1, 1, 1, 1,
-0.008413031, -0.5182611, -1.901134, 0, 0, 1, 1, 1,
-0.001246043, 0.2116544, 0.7754452, 1, 0, 0, 1, 1,
0.0006939301, 0.1176965, -1.149741, 1, 0, 0, 1, 1,
0.00357161, -0.8843775, 3.286016, 1, 0, 0, 1, 1,
0.003844052, -0.7259442, 0.8004271, 1, 0, 0, 1, 1,
0.005725672, -0.01577969, 3.501501, 1, 0, 0, 1, 1,
0.0156756, 0.4816249, -0.1086276, 0, 0, 0, 1, 1,
0.0158292, 0.1459783, 0.496659, 0, 0, 0, 1, 1,
0.01752936, -2.287509, 1.358543, 0, 0, 0, 1, 1,
0.01816906, 1.238467, -0.567214, 0, 0, 0, 1, 1,
0.02081845, 2.152983, 0.5702932, 0, 0, 0, 1, 1,
0.02167452, -0.2281097, 3.859756, 0, 0, 0, 1, 1,
0.02188001, -0.7036299, 3.112478, 0, 0, 0, 1, 1,
0.02424878, -1.454332, 3.270599, 1, 1, 1, 1, 1,
0.02521542, -1.206407, 1.651841, 1, 1, 1, 1, 1,
0.02656441, 1.114635, -0.8934593, 1, 1, 1, 1, 1,
0.02704657, 0.9705281, 0.3477494, 1, 1, 1, 1, 1,
0.02841202, 0.1892753, 0.6384407, 1, 1, 1, 1, 1,
0.02896895, 1.38266, -1.319649, 1, 1, 1, 1, 1,
0.03576568, 0.9432852, -0.350825, 1, 1, 1, 1, 1,
0.03615616, -1.474151, 2.718094, 1, 1, 1, 1, 1,
0.03815174, 0.08028476, 0.6474046, 1, 1, 1, 1, 1,
0.03827978, 1.000826, 0.3419262, 1, 1, 1, 1, 1,
0.03960185, -0.6051118, 4.837014, 1, 1, 1, 1, 1,
0.0411339, -1.145229, 2.172322, 1, 1, 1, 1, 1,
0.04249093, -0.7943305, 1.637878, 1, 1, 1, 1, 1,
0.04753558, 0.2724678, 0.3708737, 1, 1, 1, 1, 1,
0.0501088, 0.5803843, -0.1082884, 1, 1, 1, 1, 1,
0.05318667, 0.6989578, -0.3645157, 0, 0, 1, 1, 1,
0.05759311, 0.4758821, -0.570435, 1, 0, 0, 1, 1,
0.05817382, 1.387147, 0.9865797, 1, 0, 0, 1, 1,
0.05869005, -0.8373779, 3.064243, 1, 0, 0, 1, 1,
0.06263506, 0.9217958, 0.4952974, 1, 0, 0, 1, 1,
0.06375706, 1.314744, 0.5890731, 1, 0, 0, 1, 1,
0.06604473, -0.2405634, 2.940097, 0, 0, 0, 1, 1,
0.06828022, -1.230347, 3.54787, 0, 0, 0, 1, 1,
0.07119936, -1.926138, 3.15066, 0, 0, 0, 1, 1,
0.0717639, 1.231891, -0.3048134, 0, 0, 0, 1, 1,
0.07589679, -1.253404, 1.949147, 0, 0, 0, 1, 1,
0.07684515, 1.333654, -0.0191227, 0, 0, 0, 1, 1,
0.08075358, -0.401778, 2.063171, 0, 0, 0, 1, 1,
0.08232329, -0.4559212, 3.419264, 1, 1, 1, 1, 1,
0.08996281, 0.5711727, 0.7078546, 1, 1, 1, 1, 1,
0.09228412, -0.9881226, 2.077462, 1, 1, 1, 1, 1,
0.092817, -0.5741258, 3.246551, 1, 1, 1, 1, 1,
0.09357028, -0.4424108, 3.031234, 1, 1, 1, 1, 1,
0.09422626, 1.456816, -0.09674343, 1, 1, 1, 1, 1,
0.09521563, 0.8681501, 0.3526064, 1, 1, 1, 1, 1,
0.09786667, -0.2152182, 2.841369, 1, 1, 1, 1, 1,
0.09929853, 1.467498, -0.7674172, 1, 1, 1, 1, 1,
0.103915, 0.6263941, 1.488781, 1, 1, 1, 1, 1,
0.1050914, -1.689566, 2.514715, 1, 1, 1, 1, 1,
0.1105084, 0.6751793, 0.02526564, 1, 1, 1, 1, 1,
0.1112763, 0.1223877, -1.294693, 1, 1, 1, 1, 1,
0.1139318, 0.6116956, 1.775793, 1, 1, 1, 1, 1,
0.1182456, -0.6101665, 1.055711, 1, 1, 1, 1, 1,
0.118478, -0.6687151, 2.068105, 0, 0, 1, 1, 1,
0.1204281, -0.4777925, 1.471414, 1, 0, 0, 1, 1,
0.1231555, 0.5370449, 0.432945, 1, 0, 0, 1, 1,
0.1246888, -0.06559366, 2.958991, 1, 0, 0, 1, 1,
0.1285932, 0.6070304, 1.585636, 1, 0, 0, 1, 1,
0.1299407, 0.4055001, 1.512711, 1, 0, 0, 1, 1,
0.1317505, 1.267349, 0.9886856, 0, 0, 0, 1, 1,
0.1320965, -1.121142, 2.476013, 0, 0, 0, 1, 1,
0.132753, 0.273073, 1.497331, 0, 0, 0, 1, 1,
0.1331067, 0.1940386, 3.111115, 0, 0, 0, 1, 1,
0.1347023, -1.346847, 2.790403, 0, 0, 0, 1, 1,
0.1348284, -0.4443307, 1.785781, 0, 0, 0, 1, 1,
0.1357095, -0.6252031, 2.628903, 0, 0, 0, 1, 1,
0.1374743, 1.123589, -0.7196525, 1, 1, 1, 1, 1,
0.1447223, 0.4899498, 0.09549322, 1, 1, 1, 1, 1,
0.1450705, -0.6534572, 3.148689, 1, 1, 1, 1, 1,
0.1482766, -1.04196, 1.715814, 1, 1, 1, 1, 1,
0.1484133, -0.7521799, 3.369426, 1, 1, 1, 1, 1,
0.1510806, -1.05473, 2.319902, 1, 1, 1, 1, 1,
0.1521795, -0.1744893, 2.220047, 1, 1, 1, 1, 1,
0.1521872, -1.520625, 2.165609, 1, 1, 1, 1, 1,
0.1583509, 0.8947042, 0.115103, 1, 1, 1, 1, 1,
0.1606585, -1.950119, 3.655245, 1, 1, 1, 1, 1,
0.1640643, 0.1275853, 1.565544, 1, 1, 1, 1, 1,
0.1691936, -0.5251235, 1.960092, 1, 1, 1, 1, 1,
0.1720138, -0.4346953, 0.7651928, 1, 1, 1, 1, 1,
0.1735191, 0.4499806, -0.4623511, 1, 1, 1, 1, 1,
0.1792127, 0.8523513, 1.184315, 1, 1, 1, 1, 1,
0.1793451, -0.2241972, 3.565952, 0, 0, 1, 1, 1,
0.1820675, 1.244519, 0.9007789, 1, 0, 0, 1, 1,
0.1854725, 0.8509853, 0.2625385, 1, 0, 0, 1, 1,
0.1864282, 1.419171, 0.4707474, 1, 0, 0, 1, 1,
0.1954619, -0.3957085, 2.826272, 1, 0, 0, 1, 1,
0.2005892, -0.9451059, 3.301753, 1, 0, 0, 1, 1,
0.2017117, -0.5786809, 1.764578, 0, 0, 0, 1, 1,
0.203063, -1.368765, 3.147336, 0, 0, 0, 1, 1,
0.2042859, -0.9994678, 3.535384, 0, 0, 0, 1, 1,
0.2080307, -0.1348774, 2.270265, 0, 0, 0, 1, 1,
0.2103127, 0.7147103, 0.03067234, 0, 0, 0, 1, 1,
0.2107063, -1.480039, 3.156483, 0, 0, 0, 1, 1,
0.2152967, -0.2152457, 3.765588, 0, 0, 0, 1, 1,
0.2378769, -0.4284721, 0.9901385, 1, 1, 1, 1, 1,
0.238871, -2.708769, 4.27976, 1, 1, 1, 1, 1,
0.2410582, 0.4929103, -0.2630826, 1, 1, 1, 1, 1,
0.2454474, 1.87157, 0.2703746, 1, 1, 1, 1, 1,
0.2474765, -0.6676695, 3.199484, 1, 1, 1, 1, 1,
0.2566388, 0.6749399, 1.952636, 1, 1, 1, 1, 1,
0.2603967, -0.9207824, 3.275341, 1, 1, 1, 1, 1,
0.2646251, 1.918283, 0.2813134, 1, 1, 1, 1, 1,
0.2669455, 1.902024, 0.6931772, 1, 1, 1, 1, 1,
0.2671767, 1.60087, 0.853443, 1, 1, 1, 1, 1,
0.2735835, -2.371527, 4.206589, 1, 1, 1, 1, 1,
0.2760978, -0.3676707, 3.471659, 1, 1, 1, 1, 1,
0.2789614, 0.7756488, 0.5167302, 1, 1, 1, 1, 1,
0.2846182, -0.7780425, 1.797417, 1, 1, 1, 1, 1,
0.2860045, -0.08145955, 3.261792, 1, 1, 1, 1, 1,
0.2866853, 0.8810107, 1.746178, 0, 0, 1, 1, 1,
0.295983, 0.8310636, 0.8532717, 1, 0, 0, 1, 1,
0.2961792, -1.534266, -0.2334779, 1, 0, 0, 1, 1,
0.2994583, -0.7583316, 3.225795, 1, 0, 0, 1, 1,
0.3007187, -0.08503687, 3.169038, 1, 0, 0, 1, 1,
0.3009612, -0.6185986, 1.035321, 1, 0, 0, 1, 1,
0.3022152, -1.708679, 1.454849, 0, 0, 0, 1, 1,
0.303538, -1.212243, 0.07196139, 0, 0, 0, 1, 1,
0.3058811, 0.7882278, 1.679865, 0, 0, 0, 1, 1,
0.307541, -0.7747275, 3.721477, 0, 0, 0, 1, 1,
0.3182882, 0.1035637, 1.459375, 0, 0, 0, 1, 1,
0.3215206, 0.5141307, 1.83602, 0, 0, 0, 1, 1,
0.3239777, 0.396794, 2.264563, 0, 0, 0, 1, 1,
0.3245271, -0.5190687, 2.606376, 1, 1, 1, 1, 1,
0.3275757, 0.1950494, 0.2005939, 1, 1, 1, 1, 1,
0.3298517, -0.7916638, 2.588687, 1, 1, 1, 1, 1,
0.331156, -0.417526, 2.072762, 1, 1, 1, 1, 1,
0.3352984, -0.8374934, 2.510225, 1, 1, 1, 1, 1,
0.338962, -1.09657, 1.453907, 1, 1, 1, 1, 1,
0.3402107, -0.7028024, 2.606244, 1, 1, 1, 1, 1,
0.3429783, 0.08267745, 1.714606, 1, 1, 1, 1, 1,
0.3439367, -1.292144, 1.458265, 1, 1, 1, 1, 1,
0.3447211, 0.2111054, 0.4001896, 1, 1, 1, 1, 1,
0.34754, 0.9442948, 0.1854046, 1, 1, 1, 1, 1,
0.3493595, 1.382242, -0.4898341, 1, 1, 1, 1, 1,
0.3511898, -1.037448, 3.198123, 1, 1, 1, 1, 1,
0.3527426, 0.3541137, -1.320566, 1, 1, 1, 1, 1,
0.352968, -0.6659214, 2.888251, 1, 1, 1, 1, 1,
0.3530389, -1.302799, 0.5623025, 0, 0, 1, 1, 1,
0.3610899, -0.3792103, 2.479453, 1, 0, 0, 1, 1,
0.3612493, -1.056661, 2.114627, 1, 0, 0, 1, 1,
0.3653645, 0.3712942, 0.7770396, 1, 0, 0, 1, 1,
0.3682514, 0.7808998, 0.5645734, 1, 0, 0, 1, 1,
0.3711714, -0.9341398, 2.288526, 1, 0, 0, 1, 1,
0.3728958, 0.5885203, 1.933795, 0, 0, 0, 1, 1,
0.3739833, -1.582263, 2.770668, 0, 0, 0, 1, 1,
0.3758208, 1.592921, 1.225449, 0, 0, 0, 1, 1,
0.3767498, -0.561838, 2.763227, 0, 0, 0, 1, 1,
0.3771073, -0.452198, 2.313241, 0, 0, 0, 1, 1,
0.3777606, 1.839535, -0.7371048, 0, 0, 0, 1, 1,
0.3817457, -0.8524663, 3.881565, 0, 0, 0, 1, 1,
0.3827676, -0.7508364, 3.95698, 1, 1, 1, 1, 1,
0.3858153, 0.8926573, 0.0669491, 1, 1, 1, 1, 1,
0.3890672, -2.260165, 3.313762, 1, 1, 1, 1, 1,
0.392237, 2.011833, -0.8284467, 1, 1, 1, 1, 1,
0.3945243, -0.5154848, 2.419517, 1, 1, 1, 1, 1,
0.3963361, 0.199538, 1.030729, 1, 1, 1, 1, 1,
0.3984229, -1.735901, 1.475728, 1, 1, 1, 1, 1,
0.4000369, 1.253384, 1.688929, 1, 1, 1, 1, 1,
0.4050585, -0.9676226, 3.61202, 1, 1, 1, 1, 1,
0.4057271, 0.4097824, 1.669149, 1, 1, 1, 1, 1,
0.4088127, 0.7505093, 1.565593, 1, 1, 1, 1, 1,
0.4089314, 0.3257862, 0.9393233, 1, 1, 1, 1, 1,
0.4142139, -0.7130299, 3.373448, 1, 1, 1, 1, 1,
0.4170158, -0.03826634, 0.02406225, 1, 1, 1, 1, 1,
0.4173472, 2.08142, -0.4495202, 1, 1, 1, 1, 1,
0.4182467, -1.411648, 3.097442, 0, 0, 1, 1, 1,
0.4191492, 1.398959, 1.162919, 1, 0, 0, 1, 1,
0.4206012, -0.6428716, 2.442949, 1, 0, 0, 1, 1,
0.4228014, -0.286525, 2.832718, 1, 0, 0, 1, 1,
0.4298059, 0.3223166, 1.774734, 1, 0, 0, 1, 1,
0.4361264, -0.452439, 3.259395, 1, 0, 0, 1, 1,
0.4361607, -1.096331, 3.187039, 0, 0, 0, 1, 1,
0.4380982, -0.1332022, 1.002514, 0, 0, 0, 1, 1,
0.4438322, 0.4022028, 0.6153388, 0, 0, 0, 1, 1,
0.4468755, -0.5285933, 5.487212, 0, 0, 0, 1, 1,
0.4488573, -0.6210337, 3.483109, 0, 0, 0, 1, 1,
0.4516518, 0.1875989, 2.54116, 0, 0, 0, 1, 1,
0.4529285, 0.002621316, 1.067872, 0, 0, 0, 1, 1,
0.4567083, -0.1926269, 1.321904, 1, 1, 1, 1, 1,
0.4619957, 0.02370371, 0.6479958, 1, 1, 1, 1, 1,
0.4643477, -1.476537, 2.876497, 1, 1, 1, 1, 1,
0.464517, 0.32124, 1.565433, 1, 1, 1, 1, 1,
0.4658499, -0.500994, 2.595875, 1, 1, 1, 1, 1,
0.4679211, 1.311672, -0.423443, 1, 1, 1, 1, 1,
0.4729044, -0.6101156, 2.234171, 1, 1, 1, 1, 1,
0.479572, -1.520065, 1.977015, 1, 1, 1, 1, 1,
0.4863484, -0.3308131, 0.9714575, 1, 1, 1, 1, 1,
0.4963939, -0.1728833, 1.971025, 1, 1, 1, 1, 1,
0.5010893, 1.65391, 1.501168, 1, 1, 1, 1, 1,
0.5028557, -1.972754, 2.629227, 1, 1, 1, 1, 1,
0.504239, 0.3614424, -0.8630726, 1, 1, 1, 1, 1,
0.5061484, 0.7405213, 1.271429, 1, 1, 1, 1, 1,
0.5064713, 0.108164, 1.546345, 1, 1, 1, 1, 1,
0.5070418, 0.008677755, 1.64261, 0, 0, 1, 1, 1,
0.5180171, -0.0679179, 1.680194, 1, 0, 0, 1, 1,
0.5204607, -2.311468, 2.323009, 1, 0, 0, 1, 1,
0.5247527, 2.00008, 0.1691163, 1, 0, 0, 1, 1,
0.5259514, -0.5928694, 2.701399, 1, 0, 0, 1, 1,
0.526236, 0.2588796, 2.481345, 1, 0, 0, 1, 1,
0.5279257, -0.2958396, 3.271648, 0, 0, 0, 1, 1,
0.5346647, 2.034877, -0.9034892, 0, 0, 0, 1, 1,
0.5349814, 0.1757751, 0.6160981, 0, 0, 0, 1, 1,
0.536539, 0.7879956, -1.15024, 0, 0, 0, 1, 1,
0.5386323, 1.451795, -0.8259616, 0, 0, 0, 1, 1,
0.5401834, -0.02539512, 1.92235, 0, 0, 0, 1, 1,
0.5461466, -0.712806, 2.552713, 0, 0, 0, 1, 1,
0.5542877, 0.0003236637, -0.3440701, 1, 1, 1, 1, 1,
0.5549991, -0.7557478, 1.126854, 1, 1, 1, 1, 1,
0.5616031, 0.9607739, 0.2137534, 1, 1, 1, 1, 1,
0.566388, -2.120517, 3.258086, 1, 1, 1, 1, 1,
0.5673887, 0.09672974, 0.753172, 1, 1, 1, 1, 1,
0.5688346, 1.230534, 0.6656105, 1, 1, 1, 1, 1,
0.5692964, -0.4411921, 0.4945966, 1, 1, 1, 1, 1,
0.5730075, 0.1588488, -1.040375, 1, 1, 1, 1, 1,
0.5731179, 0.5539608, -0.7469616, 1, 1, 1, 1, 1,
0.5768175, 0.548273, 0.01796835, 1, 1, 1, 1, 1,
0.5846905, -0.9663869, 3.095609, 1, 1, 1, 1, 1,
0.5867427, -0.1624682, 2.539123, 1, 1, 1, 1, 1,
0.5875074, 1.050249, -0.7788411, 1, 1, 1, 1, 1,
0.5875735, -1.965411, 2.642823, 1, 1, 1, 1, 1,
0.59215, -1.659094, 0.3667214, 1, 1, 1, 1, 1,
0.5922244, 2.037593, -2.587492, 0, 0, 1, 1, 1,
0.5928985, 0.2054068, 2.394193, 1, 0, 0, 1, 1,
0.5933831, -0.5514595, 1.703341, 1, 0, 0, 1, 1,
0.5944827, 0.262317, 1.593878, 1, 0, 0, 1, 1,
0.6011158, -0.9989148, 3.6888, 1, 0, 0, 1, 1,
0.6029246, -0.1569816, 0.5417774, 1, 0, 0, 1, 1,
0.6030164, 0.2898237, 1.39494, 0, 0, 0, 1, 1,
0.61343, -0.613371, 4.754258, 0, 0, 0, 1, 1,
0.6164464, 0.8978242, 2.498376, 0, 0, 0, 1, 1,
0.6164865, 1.793796, 0.4129559, 0, 0, 0, 1, 1,
0.6171347, 0.1443678, 2.170529, 0, 0, 0, 1, 1,
0.6190915, 0.5986481, 0.6997855, 0, 0, 0, 1, 1,
0.6270207, -0.5797071, 1.709663, 0, 0, 0, 1, 1,
0.6272475, -0.02150545, 1.535416, 1, 1, 1, 1, 1,
0.628998, -0.6740627, 3.016104, 1, 1, 1, 1, 1,
0.6311136, -1.18502, 2.610481, 1, 1, 1, 1, 1,
0.6360466, 0.3471544, 0.9855907, 1, 1, 1, 1, 1,
0.6360723, -1.847385, 1.865377, 1, 1, 1, 1, 1,
0.6366674, 0.5678843, -0.08132065, 1, 1, 1, 1, 1,
0.6396404, -1.48709, 4.128206, 1, 1, 1, 1, 1,
0.6509776, -0.6425343, 4.276306, 1, 1, 1, 1, 1,
0.6523364, 1.474035, 0.3868977, 1, 1, 1, 1, 1,
0.6602973, 0.5595345, -0.2452649, 1, 1, 1, 1, 1,
0.6626498, -1.213407, 4.469017, 1, 1, 1, 1, 1,
0.6647757, 0.6374428, 0.3269792, 1, 1, 1, 1, 1,
0.6649693, 0.1505124, 1.837362, 1, 1, 1, 1, 1,
0.6689418, -0.8678288, 3.59132, 1, 1, 1, 1, 1,
0.6733933, 0.2530636, 3.366968, 1, 1, 1, 1, 1,
0.6772981, -0.02996661, 1.601802, 0, 0, 1, 1, 1,
0.6775659, -0.8936492, 2.386256, 1, 0, 0, 1, 1,
0.6809991, -1.656157, 1.880487, 1, 0, 0, 1, 1,
0.6869239, -0.5087365, 0.547765, 1, 0, 0, 1, 1,
0.6891677, -0.9888529, 1.574261, 1, 0, 0, 1, 1,
0.6922735, -0.9391418, 1.95199, 1, 0, 0, 1, 1,
0.6965307, -0.4011148, 3.996396, 0, 0, 0, 1, 1,
0.7045938, 1.22989, 0.03097166, 0, 0, 0, 1, 1,
0.7076494, 0.6529317, 0.83029, 0, 0, 0, 1, 1,
0.7111569, -1.442884, 4.012945, 0, 0, 0, 1, 1,
0.7131613, -0.7267031, 1.40619, 0, 0, 0, 1, 1,
0.7133365, -0.8834245, 3.390922, 0, 0, 0, 1, 1,
0.7138392, -0.5185471, 2.615685, 0, 0, 0, 1, 1,
0.7188262, -0.03391716, 1.389998, 1, 1, 1, 1, 1,
0.7197312, -1.332044, 2.394874, 1, 1, 1, 1, 1,
0.7217044, -0.7125921, 1.758517, 1, 1, 1, 1, 1,
0.7227303, -0.6756326, 2.534095, 1, 1, 1, 1, 1,
0.7248706, 0.8984075, 2.146271, 1, 1, 1, 1, 1,
0.7282443, 0.729205, 0.5985584, 1, 1, 1, 1, 1,
0.7325641, -0.8256781, 0.7713367, 1, 1, 1, 1, 1,
0.7363404, -1.18827, 2.414501, 1, 1, 1, 1, 1,
0.7393793, 0.8808172, -0.2401869, 1, 1, 1, 1, 1,
0.7397778, -0.9533132, 1.06568, 1, 1, 1, 1, 1,
0.7407358, 2.175213, 0.2473088, 1, 1, 1, 1, 1,
0.7412358, -1.185074, 1.894305, 1, 1, 1, 1, 1,
0.7439517, 0.1911081, 0.8242172, 1, 1, 1, 1, 1,
0.7532288, -1.365415, 1.977639, 1, 1, 1, 1, 1,
0.7577661, -0.0989588, 3.058348, 1, 1, 1, 1, 1,
0.7614455, -0.277287, 2.566779, 0, 0, 1, 1, 1,
0.7618684, 0.6094509, -0.05948109, 1, 0, 0, 1, 1,
0.7619606, -0.8953769, 3.908135, 1, 0, 0, 1, 1,
0.7627667, 0.8247481, 0.6659315, 1, 0, 0, 1, 1,
0.7640209, 0.408004, 1.40257, 1, 0, 0, 1, 1,
0.7652847, 0.243146, 1.329545, 1, 0, 0, 1, 1,
0.7722561, 0.5274715, 1.520599, 0, 0, 0, 1, 1,
0.7752457, 0.7953597, 2.445747, 0, 0, 0, 1, 1,
0.7767727, -1.905115, 0.8773258, 0, 0, 0, 1, 1,
0.7926469, -0.3213714, 2.141965, 0, 0, 0, 1, 1,
0.793404, 0.04010747, 0.4706727, 0, 0, 0, 1, 1,
0.7953284, -0.4691349, 1.946632, 0, 0, 0, 1, 1,
0.8003569, 0.01527238, 2.503901, 0, 0, 0, 1, 1,
0.8018173, 0.2922583, 0.5435903, 1, 1, 1, 1, 1,
0.8080311, -1.157513, 1.947867, 1, 1, 1, 1, 1,
0.8092989, 1.733047, 3.632041, 1, 1, 1, 1, 1,
0.8127165, -0.4735151, 2.020952, 1, 1, 1, 1, 1,
0.8144497, 1.513288, 0.4744969, 1, 1, 1, 1, 1,
0.8267605, 0.1057614, 0.957531, 1, 1, 1, 1, 1,
0.8270019, 0.08502334, 1.187072, 1, 1, 1, 1, 1,
0.8275537, -1.588584, 1.932898, 1, 1, 1, 1, 1,
0.8296564, -0.164365, 3.032034, 1, 1, 1, 1, 1,
0.8300338, -1.390296, 3.109584, 1, 1, 1, 1, 1,
0.8338277, -1.573878, 1.755781, 1, 1, 1, 1, 1,
0.8382792, -0.2146993, 2.673613, 1, 1, 1, 1, 1,
0.8402095, 1.433971, 0.6445802, 1, 1, 1, 1, 1,
0.8416275, -1.085478, 3.651006, 1, 1, 1, 1, 1,
0.8423258, -0.8051097, 1.316195, 1, 1, 1, 1, 1,
0.8438748, 0.4363484, 1.034922, 0, 0, 1, 1, 1,
0.8469503, -0.5211524, 1.670228, 1, 0, 0, 1, 1,
0.8492126, -1.386906, 4.097364, 1, 0, 0, 1, 1,
0.8702129, -0.4464177, 3.596562, 1, 0, 0, 1, 1,
0.8717684, -0.225448, 1.379665, 1, 0, 0, 1, 1,
0.875509, -0.9938048, 1.385915, 1, 0, 0, 1, 1,
0.8811679, 0.7326023, 1.710205, 0, 0, 0, 1, 1,
0.8847123, -0.4506136, 1.089124, 0, 0, 0, 1, 1,
0.8865224, 0.3353088, -0.9032189, 0, 0, 0, 1, 1,
0.8936879, 1.042122, -0.2908348, 0, 0, 0, 1, 1,
0.8952926, 2.095977, -0.777534, 0, 0, 0, 1, 1,
0.8997521, 0.8476391, 0.0579042, 0, 0, 0, 1, 1,
0.9006658, -1.12954, 3.692559, 0, 0, 0, 1, 1,
0.9009773, 0.8587213, 0.5138234, 1, 1, 1, 1, 1,
0.9022241, 0.5490324, 0.08666093, 1, 1, 1, 1, 1,
0.9029824, -0.3586698, 2.036579, 1, 1, 1, 1, 1,
0.9036304, 1.120929, 0.3611635, 1, 1, 1, 1, 1,
0.9070747, 0.2705707, 0.787825, 1, 1, 1, 1, 1,
0.9097173, -0.2786851, 2.284372, 1, 1, 1, 1, 1,
0.9297924, 0.4831538, 1.112902, 1, 1, 1, 1, 1,
0.9395076, 1.523975, 0.7538874, 1, 1, 1, 1, 1,
0.9395615, -0.9067203, 3.880936, 1, 1, 1, 1, 1,
0.9396809, -0.4329933, 1.597259, 1, 1, 1, 1, 1,
0.9460267, 2.32224, 0.7973372, 1, 1, 1, 1, 1,
0.9464668, -2.19768, 3.124346, 1, 1, 1, 1, 1,
0.9582583, -0.1260945, 0.7487005, 1, 1, 1, 1, 1,
0.9595344, -0.1392423, 3.222283, 1, 1, 1, 1, 1,
0.9695877, 0.1564263, 1.365953, 1, 1, 1, 1, 1,
0.97516, -1.501488, 2.511018, 0, 0, 1, 1, 1,
0.9761233, -0.4820337, 2.695284, 1, 0, 0, 1, 1,
0.9770299, 1.356889, 0.6572172, 1, 0, 0, 1, 1,
0.9771882, -0.5765132, 1.925925, 1, 0, 0, 1, 1,
0.9790423, -2.160394, 3.325886, 1, 0, 0, 1, 1,
0.9822531, -0.4482822, 2.376348, 1, 0, 0, 1, 1,
0.9832171, -0.3277539, 2.110281, 0, 0, 0, 1, 1,
0.9991611, -1.462934, 2.234775, 0, 0, 0, 1, 1,
1.003732, 1.156156, 0.8091943, 0, 0, 0, 1, 1,
1.005532, -1.160431, 1.423021, 0, 0, 0, 1, 1,
1.009433, 0.6095192, 2.340067, 0, 0, 0, 1, 1,
1.010394, 0.7718973, -0.6625336, 0, 0, 0, 1, 1,
1.01674, -1.160392, 2.004639, 0, 0, 0, 1, 1,
1.022627, -0.2712518, 0.8469644, 1, 1, 1, 1, 1,
1.023605, 0.3800926, 1.756783, 1, 1, 1, 1, 1,
1.033099, -0.6384198, 3.565678, 1, 1, 1, 1, 1,
1.033534, -1.479332, 3.5818, 1, 1, 1, 1, 1,
1.037309, -0.5454262, 3.50926, 1, 1, 1, 1, 1,
1.049403, 1.917615, 2.949183, 1, 1, 1, 1, 1,
1.064549, -0.3815996, 1.063402, 1, 1, 1, 1, 1,
1.065603, -0.643796, 1.575519, 1, 1, 1, 1, 1,
1.068776, -0.1942039, 2.150064, 1, 1, 1, 1, 1,
1.076666, 0.5613379, 0.3118417, 1, 1, 1, 1, 1,
1.07838, 0.4113045, 1.58458, 1, 1, 1, 1, 1,
1.080737, 0.5377274, -0.4623162, 1, 1, 1, 1, 1,
1.087163, 1.841797, 0.06221801, 1, 1, 1, 1, 1,
1.091669, 0.9716375, 0.07800413, 1, 1, 1, 1, 1,
1.093202, -0.7164422, 1.932839, 1, 1, 1, 1, 1,
1.093272, -1.964471, 2.287613, 0, 0, 1, 1, 1,
1.096708, -0.6226259, 2.52204, 1, 0, 0, 1, 1,
1.097783, 1.527782, 2.601592, 1, 0, 0, 1, 1,
1.097961, 0.7650252, -1.417107, 1, 0, 0, 1, 1,
1.1043, -0.5745118, 3.10433, 1, 0, 0, 1, 1,
1.104379, 2.707823, 0.4185608, 1, 0, 0, 1, 1,
1.105101, 1.695643, 0.6141257, 0, 0, 0, 1, 1,
1.105153, 1.628972, -0.1172192, 0, 0, 0, 1, 1,
1.10973, -1.610356, 2.200816, 0, 0, 0, 1, 1,
1.122496, 1.498563, 1.453538, 0, 0, 0, 1, 1,
1.12598, -1.165384, 2.863966, 0, 0, 0, 1, 1,
1.128238, -1.413922, 2.993486, 0, 0, 0, 1, 1,
1.128992, -1.145126, 1.978476, 0, 0, 0, 1, 1,
1.129781, -0.837079, 2.088727, 1, 1, 1, 1, 1,
1.130576, 1.543122, 1.000114, 1, 1, 1, 1, 1,
1.130871, 0.420443, 3.288049, 1, 1, 1, 1, 1,
1.137762, 0.6389256, 0.9733844, 1, 1, 1, 1, 1,
1.138573, 1.606733, -1.276654, 1, 1, 1, 1, 1,
1.142243, 0.06148371, 2.066898, 1, 1, 1, 1, 1,
1.149822, 0.7458685, 2.378173, 1, 1, 1, 1, 1,
1.164635, -0.696754, 0.1501997, 1, 1, 1, 1, 1,
1.173814, 1.703495, 1.290997, 1, 1, 1, 1, 1,
1.175068, 0.3342638, 1.089824, 1, 1, 1, 1, 1,
1.175202, -0.5345423, 2.71305, 1, 1, 1, 1, 1,
1.183241, -0.585775, 0.7763413, 1, 1, 1, 1, 1,
1.190146, 0.5488351, 0.7890007, 1, 1, 1, 1, 1,
1.191864, 0.8687025, 0.8456963, 1, 1, 1, 1, 1,
1.194117, 0.7549437, 0.8227746, 1, 1, 1, 1, 1,
1.199019, -0.2967264, 2.271125, 0, 0, 1, 1, 1,
1.201091, -0.6109851, 0.118717, 1, 0, 0, 1, 1,
1.206773, -0.1022723, 2.884183, 1, 0, 0, 1, 1,
1.215764, 0.3187926, 2.564778, 1, 0, 0, 1, 1,
1.220732, -0.6803374, 4.134474, 1, 0, 0, 1, 1,
1.233434, 0.6803735, 0.7968348, 1, 0, 0, 1, 1,
1.233804, 1.173552, 2.043362, 0, 0, 0, 1, 1,
1.236415, -0.3568699, 1.715846, 0, 0, 0, 1, 1,
1.238031, -0.6984082, 1.977576, 0, 0, 0, 1, 1,
1.249328, -1.805129, 2.14739, 0, 0, 0, 1, 1,
1.250653, -0.2251923, 1.377966, 0, 0, 0, 1, 1,
1.251333, -0.794727, 0.6169916, 0, 0, 0, 1, 1,
1.253417, 0.863452, -0.4250134, 0, 0, 0, 1, 1,
1.264169, 0.5237668, 2.586571, 1, 1, 1, 1, 1,
1.274629, -1.617444, 2.279794, 1, 1, 1, 1, 1,
1.277546, 0.1343262, 2.090603, 1, 1, 1, 1, 1,
1.278591, -0.08796095, 2.048017, 1, 1, 1, 1, 1,
1.305694, 0.4635823, 1.550785, 1, 1, 1, 1, 1,
1.308925, -0.5316457, 1.705383, 1, 1, 1, 1, 1,
1.325113, -0.6798795, 2.13618, 1, 1, 1, 1, 1,
1.328665, -0.8409978, 3.400656, 1, 1, 1, 1, 1,
1.329963, -0.3137898, 1.019488, 1, 1, 1, 1, 1,
1.330788, 0.05423611, 1.73008, 1, 1, 1, 1, 1,
1.345119, 2.264525, 0.1769142, 1, 1, 1, 1, 1,
1.351377, -1.021587, 1.067109, 1, 1, 1, 1, 1,
1.355037, -0.6573641, 2.152247, 1, 1, 1, 1, 1,
1.359239, -0.8524351, 1.994831, 1, 1, 1, 1, 1,
1.361632, -0.02039729, 1.430995, 1, 1, 1, 1, 1,
1.369468, -1.136316, 1.919791, 0, 0, 1, 1, 1,
1.372786, -0.5712399, 0.2747531, 1, 0, 0, 1, 1,
1.375734, 0.8925604, 0.3617876, 1, 0, 0, 1, 1,
1.379332, -1.35072, 3.169963, 1, 0, 0, 1, 1,
1.384334, 0.6356637, 1.291175, 1, 0, 0, 1, 1,
1.40495, -0.5383679, 1.558517, 1, 0, 0, 1, 1,
1.410143, -1.66708, 2.785151, 0, 0, 0, 1, 1,
1.413866, -1.258268, 1.996436, 0, 0, 0, 1, 1,
1.414721, -0.04207209, 0.9625885, 0, 0, 0, 1, 1,
1.415709, -1.873488, 2.499725, 0, 0, 0, 1, 1,
1.415866, -0.1444903, 2.528965, 0, 0, 0, 1, 1,
1.418991, -2.128425, 1.86799, 0, 0, 0, 1, 1,
1.420415, -0.7586695, 2.655878, 0, 0, 0, 1, 1,
1.426138, -1.221127, 3.491471, 1, 1, 1, 1, 1,
1.429652, 1.411009, -0.2096529, 1, 1, 1, 1, 1,
1.435216, 0.7093883, 1.000695, 1, 1, 1, 1, 1,
1.439396, -0.4589902, 2.278669, 1, 1, 1, 1, 1,
1.442868, 1.247845, -0.7562066, 1, 1, 1, 1, 1,
1.446806, 1.063158, 1.425828, 1, 1, 1, 1, 1,
1.448435, -1.361364, 1.822791, 1, 1, 1, 1, 1,
1.454052, 0.7541059, 1.542214, 1, 1, 1, 1, 1,
1.464633, 0.4277771, 2.039279, 1, 1, 1, 1, 1,
1.478274, -1.069138, 2.032563, 1, 1, 1, 1, 1,
1.4785, -0.8287839, 2.380765, 1, 1, 1, 1, 1,
1.485931, 0.1109366, 1.123981, 1, 1, 1, 1, 1,
1.492234, 0.1971857, 1.155435, 1, 1, 1, 1, 1,
1.499869, -0.8786893, 1.825887, 1, 1, 1, 1, 1,
1.507279, -2.030928, 2.273736, 1, 1, 1, 1, 1,
1.507817, 1.107729, 3.908122, 0, 0, 1, 1, 1,
1.542429, 0.4663645, 1.076917, 1, 0, 0, 1, 1,
1.546748, -0.3411636, 0.5215818, 1, 0, 0, 1, 1,
1.578489, -0.226836, 2.801513, 1, 0, 0, 1, 1,
1.617964, -1.365581, 3.337082, 1, 0, 0, 1, 1,
1.619432, -1.665185, 0.4593534, 1, 0, 0, 1, 1,
1.619514, -0.1189303, -0.02837074, 0, 0, 0, 1, 1,
1.639293, -0.08461281, 2.692935, 0, 0, 0, 1, 1,
1.652983, 0.06868606, 1.736157, 0, 0, 0, 1, 1,
1.707109, 2.991746, -0.4668283, 0, 0, 0, 1, 1,
1.719786, 0.300692, 0.6777695, 0, 0, 0, 1, 1,
1.720764, -1.03249, 2.232014, 0, 0, 0, 1, 1,
1.745469, 1.600672, 2.067783, 0, 0, 0, 1, 1,
1.747849, -1.824273, 1.579782, 1, 1, 1, 1, 1,
1.761293, -0.9081528, 2.124577, 1, 1, 1, 1, 1,
1.780615, 0.641035, 0.4224905, 1, 1, 1, 1, 1,
1.793238, -0.3776906, 0.6399215, 1, 1, 1, 1, 1,
1.794314, 0.1862679, 1.798342, 1, 1, 1, 1, 1,
1.807521, -0.1946705, -0.8790821, 1, 1, 1, 1, 1,
1.824479, -1.283359, 1.91999, 1, 1, 1, 1, 1,
1.826613, -0.2122611, 2.518973, 1, 1, 1, 1, 1,
1.839361, -1.076526, 1.650157, 1, 1, 1, 1, 1,
1.850386, 0.1941479, 2.146962, 1, 1, 1, 1, 1,
1.856218, 1.466799, 1.291445, 1, 1, 1, 1, 1,
1.876322, 0.5095284, 2.517814, 1, 1, 1, 1, 1,
1.881611, -1.021164, 1.524415, 1, 1, 1, 1, 1,
1.884602, -0.8379911, 0.1602781, 1, 1, 1, 1, 1,
1.897378, -0.4626847, 1.763612, 1, 1, 1, 1, 1,
1.899377, 0.5139026, 0.169052, 0, 0, 1, 1, 1,
1.900939, -0.5259842, 1.041787, 1, 0, 0, 1, 1,
1.919145, 1.025395, 0.5477764, 1, 0, 0, 1, 1,
1.942345, -0.1681659, 3.048169, 1, 0, 0, 1, 1,
1.943995, 0.3776509, 2.178061, 1, 0, 0, 1, 1,
1.950287, -0.5683554, 2.295504, 1, 0, 0, 1, 1,
1.961787, -0.1910703, 0.3884465, 0, 0, 0, 1, 1,
1.977721, 0.9258441, 3.409442, 0, 0, 0, 1, 1,
2.033517, 1.06138, 1.794969, 0, 0, 0, 1, 1,
2.052302, -1.522848, 2.096119, 0, 0, 0, 1, 1,
2.080837, -0.9871673, 1.817136, 0, 0, 0, 1, 1,
2.225566, 0.6579338, 1.19946, 0, 0, 0, 1, 1,
2.305521, 2.037929, 1.532463, 0, 0, 0, 1, 1,
2.319956, 0.9879026, 0.9945509, 1, 1, 1, 1, 1,
2.41366, -0.9815908, 1.237776, 1, 1, 1, 1, 1,
2.517894, 0.2254273, -0.494968, 1, 1, 1, 1, 1,
2.519252, 0.6896172, 1.484297, 1, 1, 1, 1, 1,
2.63347, -1.051142, -0.0805934, 1, 1, 1, 1, 1,
2.670467, -0.5429653, 2.271355, 1, 1, 1, 1, 1,
3.013496, 0.400149, 0.36213, 1, 1, 1, 1, 1
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
var radius = 9.365427;
var distance = 32.89566;
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
mvMatrix.translate( 0.008321524, -0.1414886, -0.04600787 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.89566);
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
